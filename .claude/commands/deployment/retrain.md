---
name: retrain
description: "Orchestrates model retraining — refreshes training data, retrains the model, evaluates against current production model, and prepares for deployment."
argument-hint: "<model-name>"
user-invocable: true
allowed-tools: Read, Glob, Grep, Write, Edit, Bash
---

# Model Retraining

Orchestrate model retraining workflow.

## Workflow
1. Refresh training data from latest source
2. Validate data quality
3. Retrain model with production config
4. Evaluate against current production baseline
5. Compare: if improvement > threshold, recommend promotion
6. Log retraining experiment
7. Hand off to MLOps for deployment decision
