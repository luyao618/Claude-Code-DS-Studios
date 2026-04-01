---
name: help
description: "Shows available commands, agents, and workflows. Helps navigate the DS Studios system."
argument-hint: "[topic]"
user-invocable: true
allowed-tools: Read, Glob, Grep
---

# Help

Navigate the DS Studios system.

## Usage
- `/help` — Show all available commands
- `/help agents` — Show agent roster
- `/help workflows` — Show common workflow patterns
- `/help [command]` — Show details for a specific command

## Quick Reference

### Getting Started
- `/start` — Onboarding
- `/setup-stack` — Configure tools
- `/help` — This help

### Data
- `/ingest`, `/eda`, `/data-profile`, `/data-quality`, `/data-catalog`, `/schema-design`, `/data-lineage`

### Features
- `/feature-engineer`, `/feature-store`, `/feature-select`

### Modeling
- `/train`, `/evaluate`, `/hyperopt`, `/experiment`, `/compare-models`, `/explain`, `/automl`

### Deployment
- `/deploy`, `/serve`, `/monitor`, `/retrain`, `/rollback`

### Pipeline
- `/pipeline`, `/orchestrate`, `/schedule`, `/backfill`

### Analytics
- `/dashboard`, `/report`, `/ab-test`, `/cohort-analysis`, `/forecast`

### Quality
- `/code-review`, `/notebook-review`, `/sql-review`, `/security-audit`

### Team
- `/brainstorm`, `/sprint-plan`, `/team-eda`, `/team-modeling`, `/team-deploy`

### Meta
- `/status`, `/help`, `/agent-roster`
