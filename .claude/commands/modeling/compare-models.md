---
name: compare-models
description: "Compares multiple trained models — metrics comparison, statistical tests, error analysis, and recommendation of the best model."
argument-hint: "<experiment-name>"
user-invocable: true
allowed-tools: Read, Glob, Grep, Write, Edit, Bash, NotebookEdit
---

# Model Comparison

Compare multiple models from an experiment.

## Workflow
1. Load all model runs from the experiment
2. Compare metrics (table format, sorted by primary metric)
3. Statistical significance tests between top models
4. Error analysis: where do models differ?
5. Complexity/performance trade-off analysis
6. Recommend best model with rationale
