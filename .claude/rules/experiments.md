---
paths:
  - "project/experiments/**"
  - "mlruns/**"
---

# Experiment Rules

- Every experiment MUST have a documented hypothesis before running
- Primary metric MUST be defined before training starts (no post-hoc metric selection)
- All experiment runs MUST be logged with: parameters, metrics, data version, code version
- Baseline model MUST exist before complex models are attempted
- Failed experiments MUST be documented — what was tried and why it failed
- Experiment names MUST be descriptive: [task]_[approach]_[date]
- Reproducibility: random seeds and environment must be logged
- Comparison MUST use proper statistical tests, not just point estimates
- Time-boxed exploration: set a time limit before starting
