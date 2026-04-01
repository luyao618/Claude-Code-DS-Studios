---
name: sprint-plan
description: "Generates a new sprint plan or updates an existing one. Accounts for DS-specific uncertainty with exploration buffers and experiment time. Pulls context from project documents and backlogs."
argument-hint: "[new|update|status]"
user-invocable: true
allowed-tools: Read, Glob, Grep, Write, Edit, AskUserQuestion
context: |
  !ls project/experiments/sprints/ 2>/dev/null
---

# Sprint Planning

When this command is invoked:

1. **Read the current project state** from experiment logs and session state.

2. **Read the previous sprint** (if any) from `project/experiments/sprints/`
   to understand velocity and carryover.

3. **Scan for pending work** — open issues, experiment results, deployment tasks.

4. **Check the risk register** for known blockers.

For `new`:

5. **Generate a sprint plan** following this format:

```markdown
# Sprint [N] -- [Start Date] to [End Date]

## Sprint Goal
[One sentence describing what this sprint achieves]

## Capacity
- Total days: [X]
- Exploration buffer (30%): [Y days reserved for unknowns]
- Available for planned work: [Z days]

## Tasks

### Must Have (Critical Path)
| ID | Task | Owner/Agent | Est. Days | Dependencies | Acceptance Criteria |
|----|------|-------------|-----------|-------------|-------------------|

### Should Have
| ID | Task | Owner/Agent | Est. Days | Dependencies | Acceptance Criteria |
|----|------|-------------|-----------|-------------|-------------------|

### Exploration / Spike
| ID | Task | Owner/Agent | Time Box | Question to Answer |
|----|------|-------------|----------|-------------------|

## Carryover from Previous Sprint
| Task | Reason | New Estimate |
|------|--------|-------------|

## Risks
| Risk | Probability | Impact | Mitigation |
|------|------------|--------|------------|

## Dependencies
- [External dependencies]

## Definition of Done
- [ ] All Must Have tasks completed
- [ ] Experiment results documented
- [ ] Code reviewed and merged
- [ ] Data quality validated
- [ ] Documentation updated
```

For `status`:

5. **Generate a status report**:

```markdown
# Sprint [N] Status -- [Date]

## Progress: [X/Y tasks complete] ([Z%])

### Completed
| Task | Completed By | Key Result |
|------|-------------|------------|

### In Progress
| Task | Owner | % Done | Blockers |
|------|-------|--------|----------|

### Not Started
| Task | Owner | At Risk? | Notes |
|------|-------|----------|-------|

### Blocked
| Task | Blocker | Owner of Blocker | ETA |
|------|---------|-----------------|-----|

## Experiment Results This Sprint
| Experiment | Finding | Impact on Plan |
|-----------|---------|---------------|

## Burndown Assessment
[On track / Behind / Ahead]
[If behind: What is being deferred]
```

### Agent Consultation

For comprehensive sprint planning, consider consulting:
- `ds-project-manager` for coordination and risk assessment
- `ml-engineering-lead` for ML task estimation
- `data-engineering-lead` for data pipeline task estimation
