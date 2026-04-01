---
name: report
description: "Generates a structured analysis report — executive summary, methodology, findings, visualizations, and recommendations. Supports markdown and notebook formats."
argument-hint: "<report-name> [--format md|notebook]"
user-invocable: true
allowed-tools: Read, Glob, Grep, Write, Edit, Bash, NotebookEdit
---

# Analysis Report Generation

This command creates a structured analysis report from data and findings.

## Workflow

### 1. Define Report Scope

Ask about:
- **Topic**: what question is being answered
- **Audience**: executives, technical team, external stakeholders
- **Key findings**: main results to communicate
- **Data sources**: underlying data and analyses
- **Format**: markdown report or Jupyter notebook

### 2. Report Structure

```markdown
# [Report Title]

## Executive Summary
[2-3 sentence summary for busy readers]

## Background
[Why this analysis was done, business context]

## Methodology
[Data sources, analysis approach, assumptions, limitations]

## Key Findings
### Finding 1: [Title]
[Data, visualization, interpretation]

### Finding 2: [Title]
[Data, visualization, interpretation]

## Recommendations
1. [Actionable recommendation with expected impact]
2. [Actionable recommendation with expected impact]

## Appendix
- Data sources and access
- Detailed methodology
- Additional charts and tables

## Metadata
- Author: [Name]
- Date: [Date]
- Data as of: [Date]
- Review status: [Draft/Reviewed/Final]
```

### 3. Generate Report

- Create report file in `project/reports/[name]_[date].md`
- Include referenced charts from `project/reports/figures/`
- For notebook format: create in `project/notebooks/reporting/`

### Agent Consultation

- `report-writer` for report generation
- `visualization-designer` for chart selection
- `analytics-lead` for methodology review
