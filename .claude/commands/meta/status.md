---
name: status
description: "Shows current project status — active sprint, recent experiments, model performance, pipeline health, and pending tasks."
argument-hint: "[no arguments]"
user-invocable: true
allowed-tools: Read, Glob, Grep, Bash
---

# Project Status

Display comprehensive project status.

## Information Gathered
1. **Git Status**: Branch, recent commits, uncommitted changes
2. **Sprint Status**: Current sprint progress (if active)
3. **Experiments**: Recent experiment runs and results
4. **Models**: Deployed models and their performance
5. **Pipelines**: Pipeline health and recent runs
6. **Data**: Dataset counts, freshness, quality scores
7. **Code Health**: TODOs, FIXMEs, test coverage
8. **Session State**: Active session state file contents
