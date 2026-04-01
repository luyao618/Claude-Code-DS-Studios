---
name: evaluate
description: "Performs comprehensive model evaluation — metrics computation, comparison against baselines, error analysis, bias assessment, and model card generation."
argument-hint: "<model-path> [--test-data <path>]"
user-invocable: true
allowed-tools: Read, Glob, Grep, Write, Edit, Bash, NotebookEdit
---

# Model Evaluation

This command performs thorough model evaluation beyond simple metrics.

## Workflow

### 1. Load Model and Data
- Load the model artifact
- Load test/validation data
- Verify no data leakage (test data not in training)

### 2. Performance Metrics

**Classification:**
- Accuracy, precision, recall, F1 (macro, micro, weighted)
- AUC-ROC, AUC-PR
- Confusion matrix
- Per-class metrics

**Regression:**
- MAE, MSE, RMSE, MAPE
- R-squared, adjusted R-squared
- Residual analysis
- Prediction intervals

### 3. Comparison

- Compare against baseline model
- Compare against previous best model (if exists)
- Statistical significance test (paired t-test or bootstrap)

### 4. Error Analysis

- Identify worst predictions
- Analyze error patterns by feature segments
- Detect systematic biases
- Identify edge cases

### 5. Bias Assessment

- Performance across demographic groups (if applicable)
- Fairness metrics (equalized odds, demographic parity)
- Calibration analysis

### 6. Generate Model Card

Create `project/models/[name]_model_card.md`:
```markdown
# Model Card: [Name]

## Model Details
- Framework: [sklearn/pytorch/etc.]
- Version: [v1.0]
- Training Date: [Date]

## Intended Use
- Primary use case
- Out-of-scope uses

## Training Data
- Source, size, date range
- Feature summary

## Evaluation Results
| Metric | Value | Baseline | Improvement |
|--------|-------|----------|-------------|

## Limitations
- Known failure modes
- Data limitations

## Ethical Considerations
- Bias assessment results
- Fairness metrics
```
