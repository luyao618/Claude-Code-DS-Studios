---
name: orchestrate
description: "Sets up pipeline orchestration — DAG definition, task dependencies, scheduling, and monitoring for Airflow, Prefect, or Dagster."
argument-hint: "<pipeline-name> [--platform airflow|prefect|dagster]"
user-invocable: true
allowed-tools: Read, Glob, Grep, Write, Edit, Bash, WebSearch
---

# Pipeline Orchestration

Configure pipeline orchestration with the chosen platform.

## Workflow
1. Define task graph and dependencies
2. Generate DAG/flow definition
3. Configure scheduling (cron, event-triggered)
4. Set up alerting on failures
5. Create deployment instructions
