---
name: data-profile
description: "Generates a comprehensive statistical profile of a dataset — distributions, correlations, missing patterns, and anomalies. Lighter than full EDA."
argument-hint: "<data-path>"
user-invocable: true
allowed-tools: Read, Glob, Grep, Write, Edit, Bash, NotebookEdit
---

# Data Profiling

Quick statistical profile of a dataset — faster than full EDA, focused on statistics.

## Output
- Shape, types, memory usage
- Per-column: nulls, uniques, distribution stats
- Correlation matrix
- Missing pattern analysis
- Quick anomaly flags
