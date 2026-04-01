#!/bin/bash
# Claude Code PreToolUse hook: Validate Bash commands before execution
# Prevents destructive operations on data and models
#
# Input: JSON on stdin with tool_name and tool_input fields

input=$(cat)

# Extract the command being run — prefer jq for reliable JSON parsing
if command -v jq &>/dev/null; then
  tool_name=$(echo "$input" | jq -r '.tool_name // ""')
  command_text=$(echo "$input" | jq -r '.tool_input.command // ""')
else
  # Fallback: regex-based extraction (may be unreliable with escaped quotes)
  # This is a best-effort parse — jq is strongly recommended
  tool_name=$(echo "$input" | grep -oE '"tool_name"\s*:\s*"[^"]*"' | head -1 | sed 's/.*"tool_name"\s*:\s*"//;s/"//')
  command_text=$(echo "$input" | grep -oE '"command"\s*:\s*"[^"]*"' | head -1 | sed 's/.*"command"\s*:\s*"//;s/"//')
  if [ -z "$tool_name" ]; then
    # Cannot reliably parse input without jq — allow through to avoid false blocks
    exit 0
  fi
fi

# Only check Bash commands
if [ "$tool_name" != "Bash" ]; then
  exit 0
fi

# Block destructive data operations — check multiple patterns
if echo "$command_text" | grep -qiE "(rm|unlink|find.*-delete).*data/raw"; then
  echo "BLOCKED: Cannot delete raw data files. Raw data is immutable."
  echo "If you need to clean data, write to data/processed/ instead."
  exit 1
fi

# Warn about modifying raw data
if echo "$command_text" | grep -qE "cp.*data/raw.*data/raw|mv.*data/raw|>.*data/raw"; then
  echo "WARNING: Modifying raw data directory. Raw data should be immutable."
  echo "Consider writing to data/interim/ or data/processed/ instead."
fi

# Block credential exposure
if echo "$command_text" | grep -qiE "echo.*(password|secret|token|api[_-]key)"; then
  echo "BLOCKED: Potential credential exposure in command."
  exit 1
fi

# Warn about pip install without version pinning
if echo "$command_text" | grep -qE "pip install [a-zA-Z]" && ! echo "$command_text" | grep -qE "pip install.*==|pip install.*-r|pip install.*requirements|pip install.*-e"; then
  echo "WARNING: Installing package without version pin. Consider using requirements.txt or pinning versions."
fi

exit 0
