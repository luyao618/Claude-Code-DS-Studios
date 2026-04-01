---
name: brainstorm
description: "Facilitated brainstorming session — problem framing, approach generation, feasibility assessment, and action planning for data science challenges."
argument-hint: "<topic> [open|constrained]"
user-invocable: true
allowed-tools: Read, Glob, Grep, Write, Edit, WebSearch, AskUserQuestion
---

# Brainstorming Session

Structured brainstorming for data science problems.

## Workflow
1. **Frame the problem**: What are we trying to solve? What constraints exist?
2. **Generate approaches**: List 3-5 possible approaches without judgment
3. **Evaluate feasibility**: Data availability, complexity, timeline, risk
4. **Prioritize**: Rank by expected impact × feasibility
5. **Plan**: Define next steps for the top approach(es)

## Output
Create `project/experiments/brainstorms/[topic]_[date].md` with:
- Problem statement
- Approaches considered
- Evaluation matrix
- Recommended approach with rationale
- Action items
