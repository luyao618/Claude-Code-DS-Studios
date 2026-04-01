---
name: pipeline
description: "Designs end-to-end ML pipelines — from data ingestion through feature engineering, training, evaluation, and deployment. Generates orchestration code."
argument-hint: "<pipeline-name> [--orchestrator airflow|prefect|dagster]"
user-invocable: true
allowed-tools: Read, Glob, Grep, Write, Edit, Bash, WebSearch
---

# ML Pipeline Design

Design and implement end-to-end ML pipelines.

## Workflow
1. Define pipeline stages (ingest, transform, feature, train, evaluate, deploy)
2. Design DAG with dependencies
3. Generate orchestration code for chosen platform
4. Add data quality gates between stages
5. Configure monitoring and alerting
6. Create pipeline documentation
