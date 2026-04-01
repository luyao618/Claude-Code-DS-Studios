#!/bin/bash
# Claude Code hook: Detect project gaps
# Runs at session start to identify missing components

echo ""
echo "--- Project Health Check ---"

GAPS=""

# Check for .gitignore
if [ ! -f ".gitignore" ]; then
  GAPS="${GAPS}\n- Missing .gitignore (risk of committing sensitive files)"
fi

# Check for requirements
if [ ! -f "project/requirements.txt" ] && [ ! -f "project/pyproject.toml" ]; then
  GAPS="${GAPS}\n- Missing requirements.txt/pyproject.toml (dependencies not tracked)"
fi

# Check for stack config
if [ ! -f "project/configs/stack.yaml" ]; then
  GAPS="${GAPS}\n- Missing stack configuration (run /setup-stack)"
fi

# Check for data catalog
if [ ! -d "project/data/catalog" ]; then
  GAPS="${GAPS}\n- No data catalog (run /data-catalog to document datasets)"
fi

# Check for tests
if [ -d "project/src" ] && [ ! -d "project/tests/unit" ] || [ -z "$(ls -A project/tests/unit 2>/dev/null)" ]; then
  if [ -n "$(find project/src -name '*.py' 2>/dev/null | head -1)" ]; then
    GAPS="${GAPS}\n- No unit tests for src/ code"
  fi
fi

# Check for model cards
if [ -d "project/models" ] && [ -n "$(find project/models -name '*.pkl' -o -name '*.joblib' -o -name '*.pt' 2>/dev/null | head -1)" ]; then
  if [ -z "$(find project/models -name '*model_card*' 2>/dev/null | head -1)" ]; then
    GAPS="${GAPS}\n- Model artifacts exist without model cards"
  fi
fi

if [ -n "$GAPS" ]; then
  echo "Gaps detected:"
  echo -e "$GAPS"
else
  echo "No major gaps detected."
fi

echo "---"
exit 0
