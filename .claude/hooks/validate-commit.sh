#!/bin/bash
# Claude Code hook: Validate commit messages and staged files
# Checks for common DS anti-patterns before commits

input=$(cat)

if command -v jq &>/dev/null; then
  command_text=$(echo "$input" | jq -r '.tool_input.command // ""')
else
  command_text=$(echo "$input" | grep -oE '"command"\s*:\s*"[^"]*"' | head -1 | sed 's/.*"command"\s*:\s*"//;s/"//')
fi

# Only check git commit commands
if ! echo "$command_text" | grep -qE "git commit"; then
  exit 0
fi

# Check for large files in staging
LARGE_FILES=$(git diff --staged --name-only 2>/dev/null | while read -r f; do
  if [ -f "$f" ]; then
    SIZE=$(wc -c < "$f" 2>/dev/null | tr -d ' ')
    if [ "$SIZE" -gt 10485760 ]; then  # 10MB
      echo "$f ($(echo "scale=1; $SIZE/1048576" | bc 2>/dev/null || echo "$SIZE")MB)"
    fi
  fi
done)

if [ -n "$LARGE_FILES" ]; then
  echo "WARNING: Large files staged for commit:"
  echo "$LARGE_FILES"
  echo "Consider using DVC or Git LFS for large data/model files."
fi

# Check for .env files
if git diff --staged --name-only 2>/dev/null | grep -qE "\.env$|\.env\."; then
  echo "BLOCKED: .env file staged for commit. Remove it from staging."
  echo "Add .env to .gitignore to prevent future accidents."
  exit 1
fi

# Check for raw data files (only warn on data/ directories, not test fixtures)
if git diff --staged --name-only 2>/dev/null | grep -qE "data/raw/"; then
  echo "WARNING: Raw data files staged for commit. Raw data should use DVC or Git LFS."
fi

# Check for large data files in non-test directories
if git diff --staged --name-only 2>/dev/null | grep -qE "(project/data/|data/).*\.(csv|parquet|pkl|joblib)$" | grep -qvE "tests/"; then
  echo "WARNING: Data/model files staged from data directories. Consider using DVC or Git LFS."
fi

# Check for notebook files with large outputs
STAGED_NOTEBOOKS=$(git diff --staged --name-only 2>/dev/null | grep -E "\.ipynb$")
if [ -n "$STAGED_NOTEBOOKS" ]; then
  echo "$STAGED_NOTEBOOKS" | while read -r nb; do
    if [ -f "$nb" ]; then
      NB_SIZE=$(wc -c < "$nb" 2>/dev/null | tr -d ' ')
      if [ "$NB_SIZE" -gt 1048576 ]; then  # 1MB — likely has large outputs
        echo "WARNING: Notebook $nb is $(echo "scale=1; $NB_SIZE/1048576" | bc 2>/dev/null || echo "large"). Consider clearing outputs before committing."
      fi
    fi
  done
fi

# Check for model artifacts outside project/models/
if git diff --staged --name-only 2>/dev/null | grep -qE "\.(pkl|joblib|pt|pth|onnx|safetensors|ckpt)$"; then
  echo "NOTE: Model artifact files staged for commit. Ensure they belong in the models/ directory."
fi

exit 0
