#!/bin/bash
# Claude Code SessionStart hook: Load project context at session start
# Outputs context information that Claude sees when a session begins

echo "=== Claude Code DS Studios -- Session Context ==="

# Current branch
BRANCH=$(git rev-parse --abbrev-ref HEAD 2>/dev/null)
if [ -n "$BRANCH" ]; then
    echo "Branch: $BRANCH"

    # Recent commits
    echo ""
    echo "Recent commits:"
    git log --oneline -5 2>/dev/null | while read -r line; do
        echo "  $line"
    done
fi

# Python environment
if command -v python &>/dev/null; then
    PYVER=$(python --version 2>&1)
    echo ""
    echo "Python: $PYVER"
fi

# Check for virtual environment
if [ -n "$VIRTUAL_ENV" ]; then
    echo "Venv: $(basename "$VIRTUAL_ENV")"
elif [ -f "project/.python-version" ]; then
    echo "Python version file: $(cat project/.python-version)"
fi

# Data status
RAW_COUNT=0
PROCESSED_COUNT=0
if [ -d "project/data/raw" ]; then
    RAW_COUNT=$(find project/data/raw -type f 2>/dev/null | wc -l | tr -d ' ')
fi
if [ -d "project/data/processed" ]; then
    PROCESSED_COUNT=$(find project/data/processed -type f 2>/dev/null | wc -l | tr -d ' ')
fi
if [ "$RAW_COUNT" -gt 0 ] || [ "$PROCESSED_COUNT" -gt 0 ]; then
    echo ""
    echo "Data: ${RAW_COUNT} raw files, ${PROCESSED_COUNT} processed files"
fi

# Notebook count
NB_COUNT=0
if [ -d "project/notebooks" ]; then
    NB_COUNT=$(find project/notebooks -name "*.ipynb" 2>/dev/null | wc -l | tr -d ' ')
fi
if [ "$NB_COUNT" -gt 0 ]; then
    echo "Notebooks: ${NB_COUNT}"
fi

# Model artifacts
MODEL_COUNT=0
if [ -d "project/models" ]; then
    MODEL_COUNT=$(find project/models -type f \( -name "*.pkl" -o -name "*.joblib" -o -name "*.pt" -o -name "*.h5" -o -name "*.onnx" \) 2>/dev/null | wc -l | tr -d ' ')
fi
if [ "$MODEL_COUNT" -gt 0 ]; then
    echo "Models: ${MODEL_COUNT} artifacts"
fi

# Code health
if [ -d "project/src" ]; then
    TODO_COUNT=$(grep -r "TODO" project/src/ 2>/dev/null | wc -l | tr -d ' ')
    FIXME_COUNT=$(grep -r "FIXME" project/src/ 2>/dev/null | wc -l | tr -d ' ')
    if [ "$TODO_COUNT" -gt 0 ] || [ "$FIXME_COUNT" -gt 0 ]; then
        echo ""
        echo "Code health: ${TODO_COUNT} TODOs, ${FIXME_COUNT} FIXMEs in src/"
    fi
fi

# Experiment tracking
if [ -d "mlruns" ] || [ -d "project/mlruns" ]; then
    echo ""
    echo "MLflow: experiment tracking detected"
fi

# --- Active session state recovery ---
STATE_FILE="project/experiments/session-state/active.md"
if [ -f "$STATE_FILE" ]; then
    echo ""
    echo "=== ACTIVE SESSION STATE DETECTED ==="
    echo "A previous session left state at: $STATE_FILE"
    echo "Read this file to recover context and continue where you left off."
    echo ""
    echo "Quick summary:"
    head -20 "$STATE_FILE" 2>/dev/null
    TOTAL_LINES=$(wc -l < "$STATE_FILE" 2>/dev/null | tr -d ' ')
    if [ "$TOTAL_LINES" -gt 20 ]; then
        echo "  ... ($TOTAL_LINES total lines -- read the full file to continue)"
    fi
    echo "=== END SESSION STATE PREVIEW ==="
fi

echo "==================================="
exit 0
