#!/usr/bin/env bash
# Claude Code DS Studios — Status Line
# Receives JSON on stdin, outputs a single-line status.
#
# Segments: ctx% | model | phase [| Phase > Task > Dataset]

input=$(cat)

# --- Parse JSON (jq with grep fallback) ---
if command -v jq &>/dev/null; then
  model=$(echo "$input" | jq -r '.model.display_name // "Unknown"')
  used_pct=$(echo "$input" | jq -r '.context_window.used_percentage // empty')
  cwd=$(echo "$input" | jq -r '.workspace.current_dir // .cwd // ""')
else
  model=$(echo "$input" | grep -oE '"display_name"\s*:\s*"[^"]*"' | head -1 | sed 's/.*: *"//;s/"//')
  used_pct=$(echo "$input" | grep -oE '"used_percentage"\s*:\s*[0-9]+' | head -1 | sed 's/.*: *//')
  cwd=$(echo "$input" | grep -oE '"current_dir"\s*:\s*"[^"]*"' | head -1 | sed 's/.*: *"//;s/"//')
  [ -z "$model" ] && model="Unknown"
fi

# Normalize Windows paths
cwd=$(echo "$cwd" | sed 's|\\|/|g')
[ -z "$cwd" ] && cwd="."

# --- Context usage ---
if [ -n "$used_pct" ]; then
  ctx_label="ctx: ${used_pct}%"
else
  ctx_label="ctx: --"
fi

# --- Project phase detection ---
phase=""

# Check for explicit phase
phase_file="$cwd/project/experiments/phase.txt"
if [ -f "$phase_file" ]; then
  phase=$(head -1 "$phase_file" | tr -d '\r\n')
fi

# Auto-detect from artifacts
if [ -z "$phase" ]; then
  has_models=false
  has_notebooks=false
  has_data=false
  has_pipelines=false
  has_deploy=false

  [ -d "$cwd/project/models" ] && [ "$(ls -A "$cwd/project/models" 2>/dev/null)" ] && has_models=true
  [ -d "$cwd/project/notebooks" ] && [ "$(find "$cwd/project/notebooks" -name "*.ipynb" 2>/dev/null | head -1)" ] && has_notebooks=true
  [ -d "$cwd/project/data/raw" ] && [ "$(ls -A "$cwd/project/data/raw" 2>/dev/null)" ] && has_data=true
  [ -d "$cwd/project/src/pipelines" ] && [ "$(ls -A "$cwd/project/src/pipelines" 2>/dev/null)" ] && has_pipelines=true
  [ -d "$cwd/project/docker" ] && [ "$(find "$cwd/project/docker" -name "Dockerfile*" 2>/dev/null | head -1)" ] && has_deploy=true

  if [ "$has_deploy" = true ]; then
    phase="Production"
  elif [ "$has_pipelines" = true ]; then
    phase="Pipeline"
  elif [ "$has_models" = true ]; then
    phase="Modeling"
  elif [ "$has_notebooks" = true ]; then
    phase="Exploration"
  elif [ "$has_data" = true ]; then
    phase="Data Ingestion"
  else
    phase="Setup"
  fi
fi

# --- Task breadcrumb from session state ---
breadcrumb=""
state_file="$cwd/project/experiments/session-state/active.md"
if [ -f "$state_file" ]; then
  in_block=false
  s_phase="" s_task="" s_dataset=""
  while IFS= read -r line; do
    case "$line" in
      *"<!-- STATUS -->"*) in_block=true; continue ;;
      *"<!-- /STATUS -->"*) break ;;
    esac
    if [ "$in_block" = true ]; then
      case "$line" in
        Phase:*) s_phase=$(echo "$line" | sed 's/^Phase: *//') ;;
        Task:*) s_task=$(echo "$line" | sed 's/^Task: *//') ;;
        Dataset:*) s_dataset=$(echo "$line" | sed 's/^Dataset: *//') ;;
      esac
    fi
  done < "$state_file"

  parts=""
  [ -n "$s_phase" ] && parts="$s_phase"
  [ -n "$s_task" ] && parts="${parts:+$parts > }$s_task"
  [ -n "$s_dataset" ] && parts="${parts:+$parts > }$s_dataset"
  [ -n "$parts" ] && breadcrumb=" | $parts"
fi

# --- Assemble ---
printf "%s" "${ctx_label} | ${model} | ${phase}${breadcrumb}"
