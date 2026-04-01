#!/bin/bash
# Claude Code PreCompact hook: Dump session state before context compression
# This output appears in the conversation right before compaction, ensuring
# critical state survives the summarization process.

echo "=== DS STUDIOS SESSION STATE BEFORE COMPACTION ==="
echo "Timestamp: $(date)"

# --- Active session state file ---
STATE_FILE="project/experiments/session-state/active.md"
if [ -f "$STATE_FILE" ]; then
    echo ""
    echo "## Active Session State (from $STATE_FILE)"
    STATE_LINES=$(wc -l < "$STATE_FILE" 2>/dev/null | tr -d ' ')
    if [ "$STATE_LINES" -gt 100 ] 2>/dev/null; then
        head -n 100 "$STATE_FILE"
        echo "... (truncated — $STATE_LINES total lines, showing first 100)"
    else
        cat "$STATE_FILE"
    fi
else
    echo ""
    echo "## No active session state file found"
    echo "Consider maintaining project/experiments/session-state/active.md for better recovery."
fi

# --- Files modified this session ---
echo ""
echo "## Files Modified (git working tree)"

CHANGED=$(git diff --name-only 2>/dev/null)
STAGED=$(git diff --staged --name-only 2>/dev/null)
UNTRACKED=$(git ls-files --others --exclude-standard 2>/dev/null)

if [ -n "$CHANGED" ]; then
    echo "Unstaged changes:"
    echo "$CHANGED" | while read -r f; do echo "  - $f"; done
fi
if [ -n "$STAGED" ]; then
    echo "Staged changes:"
    echo "$STAGED" | while read -r f; do echo "  - $f"; done
fi
if [ -n "$UNTRACKED" ]; then
    UNTRACKED_COUNT=$(echo "$UNTRACKED" | wc -l | tr -d ' ')
    echo "New untracked files: $UNTRACKED_COUNT"
    echo "$UNTRACKED" | head -20 | while read -r f; do echo "  - $f"; done
    if [ "$UNTRACKED_COUNT" -gt 20 ]; then
        echo "  ... (showing first 20 of $UNTRACKED_COUNT)"
    fi
fi
if [ -z "$CHANGED" ] && [ -z "$STAGED" ] && [ -z "$UNTRACKED" ]; then
    echo "  (no uncommitted changes)"
fi

# --- Recent experiment logs ---
echo ""
echo "## Recent Experiments"
if [ -d "project/experiments" ]; then
    RECENT_EXP=$(find project/experiments -name "*.md" -newer project/experiments -maxdepth 2 2>/dev/null | head -5)
    if [ -n "$RECENT_EXP" ]; then
        echo "$RECENT_EXP" | while read -r f; do echo "  - $f"; done
    else
        echo "  (no recent experiment files)"
    fi
else
    echo "  (no experiments directory)"
fi

# --- Log compaction event ---
SESSION_LOG_DIR="project/experiments/session-logs"
mkdir -p "$SESSION_LOG_DIR" 2>/dev/null
echo "Context compaction occurred at $(date)." \
    >> "$SESSION_LOG_DIR/compaction-log.txt" 2>/dev/null

echo ""
echo "## Recovery Instructions"
echo "After compaction, read $STATE_FILE to recover full working context."
echo "Then read any files listed above that are being actively worked on."
echo "=== END SESSION STATE ==="

exit 0
