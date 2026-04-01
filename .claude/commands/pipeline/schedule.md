---
name: schedule
description: "Configures pipeline scheduling — cron expressions, event triggers, and dependency-based scheduling."
argument-hint: "<pipeline-name> --cron <expression>"
user-invocable: true
allowed-tools: Read, Glob, Grep, Write, Edit, Bash
---

# Pipeline Scheduling

Configure scheduling for data and ML pipelines.

## Schedule Types
- **Cron**: Time-based scheduling
- **Event-triggered**: File arrival, API webhook, database change
- **Dependency-based**: Triggered by upstream completion
- **Manual**: On-demand execution with parameterization
