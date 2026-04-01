---
paths:
  - "project/src/features/**"
  - "project/data/features/**"
---

# Feature Engineering Rules

- Every feature MUST have a documented business rationale
- Features MUST be available in both training and serving environments
- Validate NO target leakage: features must not use future information
- Feature computation MUST be deterministic and reproducible
- Feature pipelines MUST be tested with unit tests
- Feature definitions stored in configs/features.yaml with: name, type, description, source
- High-cardinality categoricals MUST use appropriate encoding (target, frequency, hashing)
- Missing value strategy MUST be documented for each feature
- Feature importance MUST be tracked across model versions
- Feature store entries MUST include versioning and lineage
