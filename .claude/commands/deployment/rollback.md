---
name: rollback
description: "Rolls back a model deployment to a previous version — identifies previous version, validates it, and executes rollback with documentation."
argument-hint: "<model-name> [--to-version <version>]"
user-invocable: true
allowed-tools: Read, Glob, Grep, Write, Edit, Bash
---

# Model Rollback

Roll back a deployed model to a previous version.

## Workflow
1. Identify current and target versions
2. Validate target version model artifact
3. Execute rollback (swap model, update endpoint)
4. Validate serving after rollback
5. Document incident and root cause
6. Update monitoring thresholds if needed
