#!/bin/bash
# Claude Code SubagentStart hook: Log agent invocations
# Records which agents are invoked for audit trail and coordination tracking

input=$(cat)

TIMESTAMP=$(date +%Y%m%d_%H%M%S)
SESSION_LOG_DIR="project/experiments/session-logs"
mkdir -p "$SESSION_LOG_DIR" 2>/dev/null

# Extract agent name from input
if command -v jq &>/dev/null; then
  agent_name=$(echo "$input" | jq -r '.agent_name // "unknown"')
else
  agent_name=$(echo "$input" | grep -oE '"agent_name"\s*:\s*"[^"]*"' | head -1 | sed 's/.*"agent_name"\s*:\s*"//;s/"//')
  [ -z "$agent_name" ] && agent_name="unknown"
fi

echo "$TIMESTAMP | Agent invoked: $agent_name" >> "$SESSION_LOG_DIR/agent-log.txt" 2>/dev/null

exit 0
