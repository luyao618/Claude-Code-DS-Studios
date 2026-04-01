---
name: feature-select
description: "Performs feature selection — statistical methods, importance-based, recursive elimination, and correlation analysis to identify the best feature subset."
argument-hint: "<data-path> --target <column>"
user-invocable: true
allowed-tools: Read, Glob, Grep, Write, Edit, Bash, NotebookEdit
---

# Feature Selection

Systematic feature selection to find the optimal feature subset.

## Methods
1. **Statistical**: Mutual information, chi-squared, ANOVA F-value
2. **Importance-based**: Tree-based importance, permutation importance
3. **Wrapper**: Recursive feature elimination, forward/backward selection
4. **Correlation**: Remove highly correlated features
5. **L1 Regularization**: Lasso for automatic selection
