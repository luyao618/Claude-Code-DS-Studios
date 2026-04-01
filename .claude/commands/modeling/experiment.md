---
name: experiment
description: "Sets up and manages ML experiments with tracking — creates experiment in MLflow, logs parameters/metrics/artifacts, and enables comparison across runs."
argument-hint: "<experiment-name> [new|log|compare]"
user-invocable: true
allowed-tools: Read, Glob, Grep, Write, Edit, Bash
---

# Experiment Tracking

This command manages ML experiments using MLflow or a local tracking system.

## Workflow

### For `new`:

1. Create experiment in MLflow (or local tracking directory)
2. Set up experiment configuration:
   - Name, description, tags
   - Primary metric and direction (minimize/maximize)
   - Parameter space documentation
3. Create experiment log: `project/experiments/[name]/README.md`
4. Generate boilerplate training code with tracking calls

### For `log`:

1. Log a training run to the active experiment:
   - Parameters (hyperparameters, data version, features used)
   - Metrics (primary + secondary)
   - Artifacts (model file, evaluation plots, feature importance)
   - Tags (framework, approach, notes)
2. Update experiment log with run summary

### For `compare`:

1. Load all runs for the specified experiment
2. Generate comparison:
   - Metric comparison table (sorted by primary metric)
   - Parameter comparison (what changed between runs)
   - Visualization: parallel coordinates, scatter matrix
3. Recommend best run with rationale
4. Identify promising directions for further experimentation

## Experiment Log Format

`project/experiments/[name]/README.md`:
```markdown
# Experiment: [Name]

## Objective
[What we're trying to learn/optimize]

## Primary Metric
[Metric name] (minimize/maximize)

## Runs
| Run | Date | Key Change | Primary Metric | Notes |
|-----|------|-----------|---------------|-------|

## Findings
[Key learnings from this experiment]

## Decision
[Which approach was selected and why]
```
