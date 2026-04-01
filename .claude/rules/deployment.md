---
paths:
  - "project/src/serving/**"
  - "project/docker/**"
---

# Deployment Rules

- Every deployed model MUST have a monitoring plan before going live
- Every deployment MUST have a documented rollback procedure
- Docker images MUST use multi-stage builds and not run as root
- API endpoints MUST have input validation (Pydantic models)
- Health check endpoints MUST be implemented (/health, /ready)
- Prediction logging MUST be enabled (inputs, outputs, latency)
- Environment-specific configs MUST be separate (dev, staging, prod)
- Secrets MUST NOT be baked into Docker images — use env vars or secrets manager
- Load testing MUST be performed before production deployment
- Canary or shadow deployment MUST be used for high-risk model changes
