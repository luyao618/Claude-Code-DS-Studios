---
name: team-eda
description: "Orchestrates a full EDA team workflow — coordinates data-analyst, data-quality-engineer, visualization-designer, and notebook-specialist for comprehensive data exploration."
argument-hint: "<data-path>"
user-invocable: true
allowed-tools: Read, Glob, Grep, Write, Edit, Bash, NotebookEdit, WebSearch
---

# Team EDA Orchestration

Coordinates multiple agents for comprehensive exploratory data analysis.

## Team Composition
- **Orchestrator**: analytics-lead
- **data-analyst**: SQL queries, metric computation
- **data-quality-engineer**: Quality assessment
- **visualization-designer**: Chart design and standards
- **notebook-specialist**: Notebook quality
- **report-writer**: Summary and recommendations

## Workflow
1. analytics-lead scopes the analysis
2. data-quality-engineer assesses data quality
3. data-analyst performs exploratory analysis
4. visualization-designer reviews and improves charts
5. notebook-specialist reviews notebook quality
6. report-writer creates executive summary
7. analytics-lead reviews and approves
