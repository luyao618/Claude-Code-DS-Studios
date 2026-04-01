#!/bin/bash
# Claude Code hook: Validate notebook saves
# Checks notebook quality rules when notebooks are created or modified

input=$(cat)

if command -v jq &>/dev/null; then
  file_path=$(echo "$input" | jq -r '.tool_input.file_path // .tool_input.path // ""')
else
  file_path=$(echo "$input" | grep -oE '"file_path"\s*:\s*"[^"]*"' | head -1 | sed 's/.*"file_path"\s*:\s*"//;s/"//')
fi

# Only check notebook files
if ! echo "$file_path" | grep -qE "\.ipynb$"; then
  exit 0
fi

if [ -f "$file_path" ]; then
  # Check for credentials in notebook
  if grep -qiE "(password|secret|api_key|access_key)\s*=\s*['\"]" "$file_path" 2>/dev/null; then
    echo "WARNING: Possible hardcoded credentials detected in notebook $file_path"
    echo "Remove credentials before committing."
  fi

  # Check for absolute paths
  if grep -qE "(/home/|/Users/|C:\\\\)" "$file_path" 2>/dev/null; then
    echo "NOTE: Absolute paths detected in notebook. Consider using relative paths."
  fi

  echo "NOTE: Notebook modified — consider /notebook-review before committing."
fi

exit 0
