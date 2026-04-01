---
name: hyperopt
description: "Runs hyperparameter optimization — Optuna, grid search, random search, or Bayesian optimization with experiment tracking."
argument-hint: "<model-config> [--method optuna|grid|random]"
user-invocable: true
allowed-tools: Read, Glob, Grep, Write, Edit, Bash, NotebookEdit
---

# Hyperparameter Optimization

Systematic hyperparameter tuning with experiment tracking.

## Workflow
1. Define search space from model config
2. Choose optimization method (Optuna recommended)
3. Run optimization with cross-validation
4. Log all trials to experiment tracker
5. Analyze results: importance, convergence, best parameters
6. Update model config with optimal parameters
