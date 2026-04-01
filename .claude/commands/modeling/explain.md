---
name: explain
description: "Generates model explanations — SHAP values, feature importance, partial dependence plots, and local explanations for individual predictions."
argument-hint: "<model-path> [--method shap|lime|pdp]"
user-invocable: true
allowed-tools: Read, Glob, Grep, Write, Edit, Bash, NotebookEdit
---

# Model Explainability

Generate comprehensive model explanations.

## Methods
1. **SHAP**: Global and local feature importance
2. **LIME**: Local interpretable explanations
3. **Partial Dependence**: Feature effect visualization
4. **Feature Importance**: Tree-based and permutation importance
5. **Counterfactual**: What-if analysis for individual predictions
