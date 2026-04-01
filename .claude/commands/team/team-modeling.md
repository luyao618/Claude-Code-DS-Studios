---
name: team-modeling
description: "Orchestrates a full modeling team workflow — coordinates feature-engineer, ml-engineer, statistician, and test-engineer for end-to-end model development."
argument-hint: "<target-variable>"
user-invocable: true
allowed-tools: Read, Glob, Grep, Write, Edit, Bash, NotebookEdit, WebSearch
---

# Team Modeling Orchestration

Coordinates multiple agents for comprehensive model development.

## Team Composition
- **Orchestrator**: ml-engineering-lead
- **feature-engineer**: Feature creation and selection
- **ml-engineer**: Model training and evaluation
- **statistician**: Evaluation methodology
- **test-engineer**: Model testing
- **experiment tracker**: MLflow logging

## Workflow
1. ml-engineering-lead defines modeling approach
2. feature-engineer creates feature pipeline
3. ml-engineer trains baseline model
4. statistician validates evaluation methodology
5. ml-engineer iterates on model improvements
6. test-engineer writes model tests
7. ml-engineering-lead reviews and approves
