---
name: team-deploy
description: "Orchestrates a full deployment team workflow — coordinates mlops-engineer, infra-engineer, model-monitor, docker-k8s-specialist, and security-engineer for production deployment."
argument-hint: "<model-name>"
user-invocable: true
allowed-tools: Read, Glob, Grep, Write, Edit, Bash, WebSearch
---

# Team Deploy Orchestration

Coordinates multiple agents for production model deployment.

## Team Composition
- **Orchestrator**: mlops-lead
- **mlops-engineer**: Deployment automation
- **infra-engineer**: Infrastructure provisioning
- **model-monitor**: Monitoring setup
- **docker-k8s-specialist**: Containerization
- **security-engineer**: Security review

## Workflow
1. mlops-lead defines deployment architecture
2. security-engineer reviews access and security
3. docker-k8s-specialist creates containers
4. infra-engineer provisions infrastructure
5. mlops-engineer sets up CI/CD pipeline
6. model-monitor configures monitoring
7. mlops-lead validates and approves deployment
