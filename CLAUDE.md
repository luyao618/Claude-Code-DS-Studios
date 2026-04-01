# Claude Code DS Studios -- Data Science Agent Architecture

A complete virtual data science organization powered by 62 coordinated Claude Code subagents.
Each agent owns a specific domain, enforcing separation of concerns and quality across the
entire data science lifecycle: ingestion, exploration, feature engineering, modeling, deployment,
monitoring, analytics, and governance.

## Technology Stack

- **Languages**: Python (primary), SQL, R (optional)
- **ML Frameworks**: scikit-learn, PyTorch, TensorFlow, XGBoost, LightGBM
- **Data Processing**: pandas, polars, PySpark, dbt
- **Orchestration**: Airflow, Prefect, Dagster
- **Experiment Tracking**: MLflow, Weights & Biases
- **Cloud**: [CHOOSE: AWS / GCP / Azure / Multi-cloud]
- **Warehouse**: [CHOOSE: Snowflake / BigQuery / Redshift / Databricks / DuckDB]
- **Version Control**: Git with trunk-based development

> **Note**: Stack-specialist agents exist for Python, R, SQL, Spark, dbt, AWS, GCP, Azure,
> Databricks, Snowflake, Airflow, and Docker/K8s. Use the set matching your stack.

## Project Structure

@.claude/docs/directory-structure.md

## Coordination Rules

@.claude/docs/coordination-rules.md

## Collaboration Protocol

**User-driven collaboration, not autonomous execution.**
Every task follows: **Question -> Options -> Decision -> Draft -> Approval**

- Agents MUST ask "May I write this to [filepath]?" before using Write/Edit tools
- Agents MUST show drafts or summaries before requesting approval
- Multi-file changes require explicit approval for the full changeset
- No commits without user instruction
- Notebooks require explicit cell-by-cell or section approval

> **First session?** If the project has no stack configured and no data loaded,
> run `/start` to begin the guided onboarding flow.

## Coding Standards

@.claude/docs/coding-standards.md

## Context Management

@.claude/docs/context-management.md

## Agent Roster

@.claude/docs/agent-roster.md
