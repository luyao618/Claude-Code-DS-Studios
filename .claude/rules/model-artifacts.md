---
paths:
  - "project/models/**"
  - "project/src/models/**"
---

# Model Artifact Rules

- Every model artifact MUST have an accompanying model card (model_card.md)
- Model files MUST include version metadata in the filename: [name]_v[version].[ext]
- Model cards MUST document: intended use, limitations, training data, evaluation metrics
- Large model files MUST NOT be committed to git — use DVC, MLflow, or cloud storage
- Model artifacts MUST be immutable — create new versions, don't overwrite
- Include model signature: expected input schema and output schema
- Bias assessment MUST be documented for models making decisions about people
- Model deprecation: document end-of-life and migration plan
