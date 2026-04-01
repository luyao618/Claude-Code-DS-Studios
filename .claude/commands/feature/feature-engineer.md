---
name: feature-engineer
description: "Orchestrates feature engineering — analyzes raw data, proposes features, implements feature pipelines, and validates for leakage. Supports both notebook and production code."
argument-hint: "<target-variable> [--mode explore|implement]"
user-invocable: true
allowed-tools: Read, Glob, Grep, Write, Edit, Bash, NotebookEdit, WebSearch
---

# Feature Engineering

Systematic feature engineering workflow.

## Workflow
1. Analyze target variable and available features
2. Propose feature ideas (aggregations, interactions, encodings, temporal)
3. Implement features (notebook for exploration, src/ for production)
4. Validate: no target leakage, no train/test contamination
5. Assess feature importance
6. Document features in feature catalog
