---
paths:
  - "project/src/models/**"
  - "project/notebooks/modeling/**"
  - "project/configs/model_*.yaml"
---

# ML Training Rules

- Every training run MUST be logged to an experiment tracker (MLflow preferred)
- MUST log: parameters, metrics, data version, code version, random seed
- Always start with a baseline model before attempting complex approaches
- Train/test split MUST be done BEFORE any feature engineering
- Feature scaling MUST be fit on training data only, then applied to test
- Cross-validation MUST be used for model selection (minimum 5 folds)
- Class imbalance MUST be addressed explicitly — document the strategy
- Random seeds MUST be set for all stochastic operations
- Model artifacts MUST be saved with metadata (date, metrics, data hash)
- Feature importance MUST be computed and logged
- No data leakage — validate that no future information leaks into features
- Hyperparameters MUST be externalized in config files, never hardcoded
- Every model MUST have a model card documenting intended use and limitations
- When training notebooks are created, write incrementally: skeleton first,
  then fill each section with user approval
