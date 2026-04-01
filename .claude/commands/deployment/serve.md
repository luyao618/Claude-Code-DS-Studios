---
name: serve
description: "Creates a model serving API — FastAPI application, request/response schemas, health checks, and input validation."
argument-hint: "<model-path> [--framework fastapi|flask]"
user-invocable: true
allowed-tools: Read, Glob, Grep, Write, Edit, Bash
---

# Model Serving

Create a serving API for a trained model.

## Generates
- `project/src/serving/app.py` — API application
- `project/src/serving/predict.py` — Prediction logic
- `project/src/serving/schemas.py` — Pydantic request/response models
- `project/tests/integration/test_serving.py` — API tests
