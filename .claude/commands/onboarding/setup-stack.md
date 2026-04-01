---
name: setup-stack
description: "Configure the technology stack — Python version, ML frameworks, cloud platform, data warehouse, and development tools. Creates configuration files and validates the environment."
argument-hint: "[python|cloud|warehouse|all]"
user-invocable: true
allowed-tools: Read, Glob, Grep, Write, Edit, Bash, AskUserQuestion
---

# Stack Configuration

This command helps configure the project's technology stack. It can configure
the full stack or individual components.

## Workflow

### 1. Detect Current Configuration

Silently check what's already configured:
- `project/configs/stack.yaml` — main stack config
- `project/requirements.txt` or `pyproject.toml` — Python dependencies
- `project/dbt/dbt_project.yml` — dbt config
- `project/docker/Dockerfile` — containerization
- Environment: `python --version`, `pip list`

### 2. Ask About Requirements

Present options based on what's missing:

**Python Environment:**
- Python version (3.10, 3.11, 3.12)
- Package manager (pip, conda, poetry, uv)
- Key libraries (pandas, polars, scikit-learn, PyTorch, TensorFlow)

**Cloud Platform:**
- AWS (SageMaker, S3, Glue)
- GCP (Vertex AI, BigQuery, Dataflow)
- Azure (Azure ML, Synapse, Data Factory)
- None (local development)

**Data Warehouse:**
- Snowflake
- BigQuery
- Redshift
- Databricks
- DuckDB (local)
- None

**Orchestration:**
- Airflow
- Prefect
- Dagster
- None

**Experiment Tracking:**
- MLflow (recommended)
- Weights & Biases
- None

### 3. Generate Configuration

Based on answers, create:
- `project/configs/stack.yaml` — central stack configuration
- `project/requirements.txt` — Python dependencies
- `project/pyproject.toml` — if using modern Python packaging
- `.gitignore` — project-appropriate ignores
- `project/docker/Dockerfile` — if containerization selected

### 4. Validate Environment

Run checks:
- Python version matches
- Key packages can be imported
- Cloud CLI configured (if applicable)
- Database connectivity (if applicable)

### 5. Recommend Next Steps

Based on configuration:
- If data warehouse: suggest `/schema-design`
- If ML frameworks: suggest `/eda` or `/train`
- If orchestration: suggest `/pipeline`
- If nothing specific: suggest `/start` for project scoping
