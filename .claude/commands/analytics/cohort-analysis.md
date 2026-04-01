---
name: cohort-analysis
description: "Performs cohort analysis — user retention, lifecycle analysis, and cohort-based metrics over time."
argument-hint: "<data-path> --cohort-column <column> --metric <metric>"
user-invocable: true
allowed-tools: Read, Glob, Grep, Write, Edit, Bash, NotebookEdit
---

# Cohort Analysis

Analyze user behavior by cohorts over time.

## Workflow
1. Define cohorts (sign-up month, acquisition channel, etc.)
2. Define metric (retention, revenue, engagement)
3. Build cohort matrix
4. Visualize: retention curves, heatmaps
5. Identify patterns and actionable insights
6. Generate report
