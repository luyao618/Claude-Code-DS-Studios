---
name: dashboard
description: "Designs and creates a data dashboard — defines KPIs, selects visualizations, creates layout, and generates implementation code for the chosen BI tool."
argument-hint: "<dashboard-name> [--tool streamlit|plotly|metabase]"
user-invocable: true
allowed-tools: Read, Glob, Grep, Write, Edit, Bash, WebSearch
---

# Dashboard Creation

This command orchestrates dashboard design and implementation.

## Workflow

### 1. Requirements Gathering

Ask about:
- **Audience**: executives, analysts, engineers, external
- **Purpose**: monitoring, exploration, reporting
- **Data sources**: which datasets/tables
- **Key metrics**: what numbers matter most
- **Refresh frequency**: real-time, hourly, daily
- **Tool preference**: Streamlit, Plotly Dash, Metabase, Looker

### 2. KPI Definition

For each metric:
- Name, definition, and calculation
- Data source and query
- Target/threshold values
- Visualization type

### 3. Layout Design

Design information hierarchy:
- **Top**: KPI cards with current values and trends
- **Middle**: Primary charts (time series, breakdowns)
- **Bottom**: Detailed tables and secondary charts
- **Filters**: date range, segments, categories

### 4. Implementation

**Streamlit** (default):
- Create `project/src/visualization/dashboard_[name].py`
- Include data loading, caching, and chart rendering
- Add filters and interactivity

**Plotly Dash:**
- Create Dash application with callbacks
- Responsive layout with CSS

### 5. Generate Specification

Create `project/reports/dashboards/[name]_spec.md`:
```markdown
# Dashboard: [Name]

## Audience
[Who uses this and for what decisions]

## KPIs
| Metric | Definition | Source | Target | Chart Type |
|--------|-----------|--------|--------|-----------|

## Layout
[Wireframe description]

## Data Refresh
[Frequency and method]

## Filters
[Available filter dimensions]
```

### Agent Consultation

- `dashboard-designer` for layout design
- `visualization-designer` for chart selection
- `bi-developer` for implementation
- `analytics-lead` for metric definitions
