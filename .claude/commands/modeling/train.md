---
name: train
description: "Orchestrates a model training workflow — data loading, feature preparation, model training, evaluation, and experiment logging. Supports scikit-learn, XGBoost, LightGBM, PyTorch, and TensorFlow."
argument-hint: "<task-type> [--framework sklearn|xgboost|pytorch|lightgbm]"
user-invocable: true
allowed-tools: Read, Glob, Grep, Write, Edit, Bash, NotebookEdit, WebSearch
---

# Model Training Workflow

This command orchestrates a structured model training workflow with experiment
tracking and proper evaluation.

## Workflow

### 1. Understand the Task

Ask or detect:
- **Task type**: classification, regression, ranking, clustering, generation
- **Target variable**: which column to predict
- **Data source**: path to training data
- **Framework preference**: sklearn, xgboost, lightgbm, pytorch, tensorflow
- **Evaluation metric**: accuracy, F1, RMSE, AUC, etc.

### 2. Data Preparation

- Load and validate data
- Train/validation/test split (default: 70/15/15)
- Handle class imbalance (if classification)
- Feature scaling/encoding (if needed)
- Document split strategy and random seed

### 3. Baseline Model

**Always start with a baseline:**
- Classification: majority class, logistic regression
- Regression: mean prediction, linear regression
- Time series: naive forecast, simple moving average
- Log baseline metrics as the benchmark to beat

### 4. Model Training

Train the requested model with:
- Default hyperparameters first
- Cross-validation for robust evaluation
- Experiment tracking (MLflow if configured)
- Log: parameters, metrics, feature importance, artifacts

### 5. Evaluation

Generate comprehensive evaluation:
- Primary metric + secondary metrics
- Confusion matrix (classification)
- Residual plots (regression)
- Learning curves
- Feature importance
- Cross-validation statistics

### 6. Experiment Logging

Log to experiment tracker:
```python
# MLflow example
mlflow.log_params(params)
mlflow.log_metrics(metrics)
mlflow.log_artifact(model_path)
mlflow.log_artifact(evaluation_report)
```

### 7. Generate Outputs

- Model artifact: `project/models/[name]_[version].pkl`
- Training notebook: `project/notebooks/modeling/train_[name]_[date].ipynb`
- Model card: `project/models/[name]_model_card.md`
- Experiment log entry

### 8. Recommend Next Steps

- If performance is good: suggest `/evaluate` for deeper analysis, then `/deploy`
- If performance is poor: suggest `/feature-engineer` or `/hyperopt`
- Always: suggest `/experiment` to compare approaches

### Agent Consultation

- `ml-engineer` for implementation details
- `feature-engineer` for feature improvements
- `statistician` for evaluation methodology
- `ml-engineering-lead` for approach decisions
