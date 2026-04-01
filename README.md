# Claude Code DS Studios

Turn Claude Code into a **complete virtual data science organization** — 62 AI agents, 45 workflow commands, and a full coordination system mirroring real DS/ML team hierarchy.

## What Is This?

Claude Code DS Studios transforms Claude Code into an entire data science department with specialized agents spanning the full ML lifecycle: data engineering, feature engineering, model training, deployment, monitoring, analytics, experimentation, and governance.

Inspired by [Claude-Code-Game-Studios](https://github.com/Claude-Code-Game-Studios), this project goes further with:

| Feature | Game Studios | DS Studios |
|---------|-------------|------------|
| **Agents** | 48 | **62** |
| **Slash Commands** | 37 | **45** |
| **Rules** | 11 | **15** |
| **Hooks** | 8 | **10** |
| **Templates** | 28 | **35** |
| **Stack Specialists** | 3 | **12** |
| **MCP Integration** | None | **Native** |
| **Notebook Support** | None | **Native** (NotebookEdit) |
| **Data Lineage** | None | **/data-lineage** |
| **Experiment Tracking** | None | **/experiment + MLflow** |
| **Model Registry** | None | **Model Registry** |
| **Team Orchestration** | None | **3 commands** |
| **Cost Optimization** | None | **cost-optimizer agent** |
| **Data Governance** | None | **Full framework** |

## Quick Start

```bash
# 1. Clone this repo (or copy the .claude/ directory into your DS project)
git clone https://github.com/your-org/Claude-Code-DS-Studios.git
cd Claude-Code-DS-Studios

# 2. Open Claude Code in this directory
claude

# 3. Run the onboarding flow
/start
```

The `/start` command detects your project state and guides you through setup:

- **No project yet?** It helps you define scope, choose a stack, and scaffold the project
- **Existing project?** It analyzes what you have and identifies gaps
- **Returning?** It recovers your session state and shows next steps

## Agent Hierarchy

```
                              [Human Data Scientist]
                                       |
            +--------------+-----------+-----------+--------------+
            |              |           |           |              |
    chief-data-officer  ml-arch-dir  de-dir  analytics-dir  ds-pm
            |              |           |           |              |
         (strategy)    +---+---+   +--+--+    +---+---+    (coordination)
                       |   |   |   |     |    |   |   |
                    ml-lead |  nlp de-lead gov ana viz exp
                       |   cv  |     |     |   |   |   |
                    +--+--+ | ++-+ +-+-+ +-+-+ | +-+  |
                    |  |  | | | |  | | | | | | | | |  |
                   [33 Specialists + 12 Stack Experts]
```

### Tier 1 — Directors (5 Opus agents)
Strategic decision-making, architecture review, resource allocation

### Tier 2 — Department Leads (12 Sonnet agents)
Domain ownership, team coordination, quality standards

### Tier 3 — Specialists (33 Sonnet/Haiku agents)
Hands-on implementation across data engineering, ML, analytics, MLOps

### Stack Specialists (12 Sonnet agents)
Deep expertise in specific technologies: Python, R, SQL, Spark, dbt, cloud platforms

## Slash Commands

| Category | Commands |
|----------|----------|
| **Onboarding** | `/start`, `/setup-stack`, `/configure-mcp` |
| **Data** | `/ingest`, `/eda`, `/data-profile`, `/data-quality`, `/data-catalog`, `/schema-design`, `/data-lineage` |
| **Feature** | `/feature-engineer`, `/feature-store`, `/feature-select` |
| **Modeling** | `/train`, `/evaluate`, `/hyperopt`, `/experiment`, `/compare-models`, `/explain`, `/automl` |
| **Deployment** | `/deploy`, `/serve`, `/monitor`, `/retrain`, `/rollback` |
| **Pipeline** | `/pipeline`, `/orchestrate`, `/schedule`, `/backfill` |
| **Analytics** | `/dashboard`, `/report`, `/ab-test`, `/cohort-analysis`, `/forecast` |
| **Quality** | `/code-review`, `/notebook-review`, `/sql-review`, `/security-audit` |
| **Team** | `/brainstorm`, `/sprint-plan`, `/team-eda`, `/team-modeling`, `/team-deploy` |
| **Meta** | `/status`, `/help`, `/agent-roster` |

## Key Differentiators

### Native Notebook Support
Agents understand and can create/edit Jupyter notebooks using the `NotebookEdit` tool.
The `/notebook-review` command applies DS-specific quality standards to notebooks.

### Experiment Tracking
The `/experiment` command integrates with MLflow for tracking parameters, metrics, and artifacts.
The `experimentation-lead` agent coordinates A/B tests and ML experiments.

### Data Governance
A complete governance framework with the `data-governance-lead`, `data-quality-engineer`,
and `metadata-engineer` agents ensuring data quality, lineage, and compliance.

### Cost Optimization
The `cost-optimizer` agent monitors compute costs across cloud platforms and recommends
right-sizing, spot instances, and efficient query patterns.

### Multi-Cloud Support
Stack specialists for AWS (SageMaker), GCP (Vertex AI), and Azure (Azure ML) provide
cloud-native guidance while maintaining portability.

## Project Structure

The `project/` directory contains a standard data science project template:

```
project/
├── data/{raw,interim,processed,external,features}/
├── notebooks/{exploratory,modeling,evaluation,reporting}/
├── src/{data,features,models,pipelines,serving,visualization,utils}/
├── dbt/{models,seeds,macros,tests}/
├── dags/
├── configs/
├── tests/{unit,integration,data}/
├── models/
├── reports/figures/
├── experiments/
└── docker/
```

## Documentation

Full documentation is in `.claude/docs/`:

- `quick-start.md` — Getting started guide
- `agent-roster.md` — Complete agent list with roles and tiers
- `coordination-map.md` — Delegation and workflow patterns
- `coordination-rules.md` — 5 core coordination rules
- `coding-standards.md` — Python, SQL, notebook standards
- `context-management.md` — Context budget and recovery strategies
- `mcp-integration-guide.md` — MCP server configuration
- `stack-guides/` — Per-technology deep guides

## Requirements

- [Claude Code](https://claude.com/claude-code) (latest version)
- Git
- Python 3.10+ (recommended)
- `jq` (for hooks — `brew install jq` / `apt install jq`)

## License

MIT
