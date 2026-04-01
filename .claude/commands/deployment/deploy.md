---
name: deploy
description: "Orchestrates model deployment — containerization, API creation, infrastructure setup, monitoring configuration, and rollback planning."
argument-hint: "<model-path> [--mode api|batch|streaming]"
user-invocable: true
allowed-tools: Read, Glob, Grep, Write, Edit, Bash, WebSearch
---

# Model Deployment

This command orchestrates the full model deployment pipeline.

## Workflow

### 1. Pre-Deployment Checks

- Model artifact exists and loads correctly
- Model card exists with evaluation results
- Test data produces expected predictions
- No training/serving skew detected
- Monitoring plan defined

### 2. Deployment Mode Selection

**API (real-time):**
- FastAPI/Flask application
- Docker containerization
- Health check endpoint
- Input validation
- Prediction logging

**Batch:**
- Scheduled inference job
- Input/output data paths
- Failure handling and retry logic
- Result validation

**Streaming:**
- Event-driven inference
- Message queue integration
- Throughput and latency optimization

### 3. Generate Deployment Artifacts

For API mode:
- `project/src/serving/app.py` — API application
- `project/src/serving/predict.py` — prediction logic
- `project/src/serving/schemas.py` — request/response models
- `project/docker/Dockerfile.serve` — container definition
- `project/docker/docker-compose.serve.yml` — local testing
- `project/configs/serving.yaml` — serving configuration

### 4. Testing

- Unit tests for prediction logic
- Integration test with sample requests
- Load test specification
- Smoke test after deployment

### 5. Monitoring Setup

- Prediction logging (inputs, outputs, latency)
- Model performance monitoring (drift detection)
- Infrastructure monitoring (CPU, memory, latency)
- Alerting rules

### 6. Rollback Plan

Document rollback procedure:
- How to detect a problem
- How to roll back to previous version
- Who to notify
- Post-mortem template

### Agent Consultation

- `mlops-engineer` for deployment implementation
- `docker-k8s-specialist` for containerization
- `model-monitor` for monitoring setup
- `infra-engineer` for infrastructure provisioning
- `security-engineer` for security review
