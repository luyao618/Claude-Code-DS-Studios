#!/bin/bash
# Claude Code PostToolUse hook: Validate file writes
# Checks for common DS anti-patterns after file creation/modification
#
# Input: JSON on stdin with tool_name, tool_input, and tool_output fields

input=$(cat)

if command -v jq &>/dev/null; then
  tool_name=$(echo "$input" | jq -r '.tool_name // ""')
  file_path=$(echo "$input" | jq -r '.tool_input.file_path // .tool_input.path // ""')
else
  tool_name=$(echo "$input" | grep -oE '"tool_name"\s*:\s*"[^"]*"' | head -1 | sed 's/.*"tool_name"\s*:\s*"//;s/"//')
  file_path=$(echo "$input" | grep -oE '"file_path"\s*:\s*"[^"]*"' | head -1 | sed 's/.*"file_path"\s*:\s*"//;s/"//')
fi

# Check if credentials were written to a file
if [ -n "$file_path" ] && [ -f "$file_path" ]; then
  # Check for hardcoded credentials
  if grep -qiE "(password|secret|api_key|access_key|private_key)\s*=\s*['\"][^'\"]+['\"]" "$file_path" 2>/dev/null; then
    echo "WARNING: Possible hardcoded credentials detected in $file_path"
    echo "Consider using environment variables or a secrets manager instead."
  fi

  # Check for hardcoded paths
  if grep -qE "(/home/|/Users/|C:\\\\)" "$file_path" 2>/dev/null; then
    echo "WARNING: Hardcoded absolute paths detected in $file_path"
    echo "Consider using relative paths or configuration variables."
  fi

  # Check Python files for common issues
  if echo "$file_path" | grep -qE "\.py$"; then
    # Check for print statements in non-notebook code
    if ! echo "$file_path" | grep -q "notebook" && grep -qE "^\s*print\(" "$file_path" 2>/dev/null; then
      echo "NOTE: print() found in $file_path — consider using logging module for production code."
    fi
  fi

  # Check notebook files
  if echo "$file_path" | grep -qE "\.ipynb$"; then
    echo "NOTE: Notebook modified. Consider running /notebook-review before committing."
  fi
fi

exit 0
