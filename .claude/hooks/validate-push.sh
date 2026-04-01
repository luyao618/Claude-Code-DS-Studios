#!/bin/bash
# Claude Code hook: Validate git push commands
# Prevents accidental force pushes and pushes to protected branches

input=$(cat)

if command -v jq &>/dev/null; then
  command_text=$(echo "$input" | jq -r '.tool_input.command // ""')
else
  command_text=$(echo "$input" | grep -oE '"command"\s*:\s*"[^"]*"' | head -1 | sed 's/.*"command"\s*:\s*"//;s/"//')
fi

# Only check git push commands
if ! echo "$command_text" | grep -qE "git push"; then
  exit 0
fi

# Block force push
if echo "$command_text" | grep -qE "(-f|--force)"; then
  echo "BLOCKED: Force push is not allowed. Use --force-with-lease if you must force push."
  exit 1
fi

# Warn about pushing to main/master
if echo "$command_text" | grep -qE "main|master"; then
  BRANCH=$(git rev-parse --abbrev-ref HEAD 2>/dev/null)
  if [ "$BRANCH" = "main" ] || [ "$BRANCH" = "master" ]; then
    echo "WARNING: Pushing directly to $BRANCH. Consider using a feature branch and PR."
  fi
fi

exit 0
