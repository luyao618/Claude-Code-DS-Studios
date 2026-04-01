---
name: automl
description: "Runs automated machine learning — auto feature engineering, model selection, and hyperparameter tuning for quick baseline models."
argument-hint: "<data-path> --target <column> [--time-limit <minutes>]"
user-invocable: true
allowed-tools: Read, Glob, Grep, Write, Edit, Bash, NotebookEdit
---

# AutoML

Automated machine learning for quick baseline establishment.

## Workflow
1. Load and validate data
2. Auto-detect task type (classification/regression)
3. Run automated feature engineering
4. Train multiple model types with auto-tuning
5. Evaluate and rank models
6. Save best model with experiment logging
7. Generate baseline report
