---
name: feature-store
description: "Sets up a feature store — defines feature definitions, implements computation, versioning, and serving for both training and inference."
argument-hint: "[setup|add|serve]"
user-invocable: true
allowed-tools: Read, Glob, Grep, Write, Edit, Bash, WebSearch
---

# Feature Store

Manages feature definitions, computation, and serving.

## Workflow
- **setup**: Initialize feature store structure in project/data/features/
- **add**: Add new feature definitions with computation logic
- **serve**: Generate serving code for online/offline feature access
