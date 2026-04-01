---
name: data-lineage
description: "Documents data lineage — traces data from source through transformations to consumption, generating lineage diagrams and documentation."
argument-hint: "<dataset-or-table>"
user-invocable: true
allowed-tools: Read, Glob, Grep, Write, Edit, Bash
---

# Data Lineage

Traces and documents data flow from source to consumption.

## Workflow
1. Identify the target dataset/table
2. Trace upstream: what data sources feed into it
3. Trace transformations: what processing steps occur
4. Trace downstream: what consumes this dataset
5. Generate lineage diagram (text-based)
6. Document in data catalog

## Output Format
```
Source A → [Transform 1] → Intermediate → [Transform 2] → Target → [Consumer 1]
Source B ↗                                                       → [Consumer 2]
```
