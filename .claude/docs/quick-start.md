# DS Studios Agent Architecture -- Quick Start Guide

## What Is This?

This is a complete Claude Code agent architecture for data science. It organizes
62 specialized AI agents into a team hierarchy that mirrors real data science
organizations, with defined responsibilities, delegation rules, and coordination
protocols. It includes stack-specialist agents for Python, R, SQL, Spark, dbt,
AWS, GCP, Azure, Databricks, Snowflake, Airflow, and Docker/K8s. All agents are
grounded in established data science best practices (CRISP-DM, MLOps maturity
model, statistical rigor, reproducibility). Use whichever stack set matches your
project.

## How to Use

### 1. Understand the Hierarchy

There are four tiers of agents:

- **Tier 1 (Opus)**: Directors who make strategic decisions
  - `chief-data-officer` -- strategy, governance, stakeholder alignment
  - `ml-architecture-director` -- ML system architecture, tech selection
  - `data-engineering-director` -- data platform, warehouse, pipelines
  - `analytics-director` -- analytics strategy, experimentation, KPIs
  - `ds-project-manager` -- sprint planning, coordination, tracking

- **Tier 2 (Sonnet)**: Department leads who own their domain
  - `data-engineering-lead`, `ml-engineering-lead`, `analytics-lead`,
    `mlops-lead`, `data-governance-lead`, `visualization-lead`,
    `experimentation-lead`, `nlp-lead`, `cv-lead`, `platform-lead`,
    `research-lead`, `data-product-lead`

- **Tier 3 (Sonnet/Haiku)**: Specialists who execute within their domain
  - Data engineers, ML engineers, analysts, statisticians, MLOps engineers

- **Stack Specialists (Sonnet)**: Deep technology experts
  - `python-ecosystem`, `r-ecosystem`, `sql-warehouse`, `spark-bigdata`,
    `dbt-specialist`, `aws-ml`, `gcp-ml`, `azure-ml`, `databricks-specialist`,
    `snowflake-specialist`, `airflow-specialist`, `docker-k8s-specialist`

### 2. Pick the Right Agent for the Job

Ask yourself: "What role would handle this in a real DS team?"

| I need to... | Use this agent |
|-------------|---------------|
| Explore a new dataset | `data-analyst` or `/eda` |
| Build an ETL pipeline | `data-engineer` or `etl-specialist` |
| Engineer features | `feature-engineer` or `/feature-engineer` |
| Train a model | `ml-engineer` or `/train` |
| Tune hyperparameters | `ml-engineer` or `/hyperopt` |
| Deploy a model to production | `mlops-engineer` or `/deploy` |
| Monitor model drift | `model-monitor` or `/monitor` |
| Design a dashboard | `dashboard-designer` or `/dashboard` |
| Run an A/B test | `ab-test-analyst` or `/ab-test` |
| Review a notebook | `notebook-specialist` or `/notebook-review` |
| Write SQL queries | `sql-warehouse` specialist |
| Optimize Spark jobs | `spark-bigdata` specialist |
| Set up dbt models | `dbt-specialist` |
| Design data warehouse schema | `data-engineer` or `/schema-design` |
| Track data lineage | `metadata-engineer` or `/data-lineage` |
| Assess data quality | `data-quality-engineer` or `/data-quality` |
| Build a forecast | `time-series-specialist` or `/forecast` |
| Explain model predictions | `ml-engineer` or `/explain` |
| Optimize cloud costs | `cost-optimizer` |
| Review code quality | `test-engineer` or `/code-review` |
| Plan a sprint | `ds-project-manager` or `/sprint-plan` |
| Brainstorm approaches | `research-lead` or `/brainstorm` |
| Set up SageMaker | `aws-ml` specialist |
| Set up Vertex AI | `gcp-ml` specialist |
| Set up Azure ML | `azure-ml` specialist |
| Resolve strategic question | `chief-data-officer` |
| Make architecture decision | `ml-architecture-director` |

### 3. Use Slash Commands for Common Tasks

| Command | What it does |
|---------|-------------|
| `/start` | First-time onboarding — detects project state, guides setup |
| `/setup-stack` | Configure technology stack (Python, cloud, warehouse) |
| `/eda` | Exploratory data analysis workflow |
| `/data-quality` | Assess and report data quality issues |
| `/data-catalog` | Document datasets with metadata |
| `/train` | Model training workflow with experiment tracking |
| `/evaluate` | Model evaluation with metrics and visualizations |
| `/experiment` | MLflow experiment tracking setup and logging |
| `/deploy` | Model deployment workflow |
| `/monitor` | Model monitoring setup and drift detection |
| `/dashboard` | Dashboard specification and creation |
| `/report` | Generate analysis reports |
| `/ab-test` | A/B test design and analysis |
| `/code-review` | Python code review |
| `/notebook-review` | Notebook quality review |
| `/sprint-plan` | Sprint planning and tracking |

### 4. Follow the Coordination Rules

1. Work flows down the hierarchy: Directors -> Leads -> Specialists
2. Conflicts escalate up the hierarchy
3. Cross-department work is coordinated by `ds-project-manager`
4. Agents do not modify files outside their domain without delegation
5. All decisions are documented

## First Steps for a New Project

**Don't know where to begin?** Run `/start`. It asks where you are and routes
you to the right workflow.

### Path A: "Starting from scratch"

1. **Run `/start`** — guided onboarding
2. **Run `/setup-stack`** — configure Python, cloud, warehouse
3. **Define the problem** — work with `chief-data-officer` to scope
4. **Ingest data** — use `/ingest` to set up data pipelines
5. **Explore data** — use `/eda` for exploratory analysis
6. **Plan the sprint** — use `/sprint-plan new`

### Path B: "I have data, need a model"

1. **Run `/setup-stack`** — configure your environment
2. **Run `/eda`** — understand your data
3. **Run `/feature-engineer`** — create features
4. **Run `/train`** — train models with experiment tracking
5. **Run `/evaluate`** — compare and select the best model
6. **Run `/deploy`** — deploy to production

### Path C: "I have a model, need to productionize"

1. **Run `/setup-stack`** — ensure MLOps tooling configured
2. **Run `/deploy`** — containerize and deploy
3. **Run `/monitor`** — set up drift detection
4. **Run `/pipeline`** — automate the full workflow

### Path D: "Existing project, need help"

1. **Run `/start`** — it analyzes what exists
2. **Run `/code-review`** or `/notebook-review`** — quality check
3. **Run `/sprint-plan`** — organize next steps

## File Structure Reference

```
CLAUDE.md                          -- Master config (read this first)
.claude/
  settings.json                    -- Claude Code hooks and project settings
  agents/                          -- 62 agent definitions (YAML frontmatter)
  commands/                        -- 45 slash command definitions (10 categories)
  hooks/                           -- 10 hook scripts (.sh) wired by settings.json
  rules/                           -- 15 path-specific rule files
  docs/
    quick-start.md                 -- This file
    agent-roster.md                -- Full agent list with tiers
    coordination-map.md            -- Delegation and workflow map
    coordination-rules.md          -- Agent coordination rules
    coding-standards.md            -- Python, SQL, notebook standards
    context-management.md          -- Context budgets and compaction
    directory-structure.md         -- Project directory layout
    mcp-integration-guide.md       -- MCP server configuration
    skills-reference.md            -- All slash commands reference
    stack-guides/                  -- Per-technology deep guides
    templates/                     -- 35 document templates
project/                           -- Standard DS project template
  data/                            -- Raw, interim, processed, external, features
  notebooks/                       -- Exploratory, modeling, evaluation, reporting
  src/                             -- Source code modules
  dbt/                             -- dbt models, seeds, macros, tests
  dags/                            -- Airflow DAGs
  configs/                         -- Configuration files
  tests/                           -- Unit, integration, data tests
  models/                          -- Serialized models
  reports/                         -- Generated reports and figures
  experiments/                     -- Experiment logs and artifacts
  docker/                          -- Dockerfiles and compose
```
