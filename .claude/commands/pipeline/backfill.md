---
name: backfill
description: "Plans and executes pipeline backfills — historical data reprocessing with proper partitioning and validation."
argument-hint: "<pipeline-name> --from <date> --to <date>"
user-invocable: true
allowed-tools: Read, Glob, Grep, Write, Edit, Bash
---

# Pipeline Backfill

Plan and execute historical data reprocessing.

## Workflow
1. Define backfill date range and partitions
2. Assess compute requirements and cost
3. Generate backfill execution plan
4. Execute with progress tracking
5. Validate backfill results
6. Document in pipeline log
