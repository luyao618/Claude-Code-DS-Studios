# Agent Roster

The following agents are available. Each has a dedicated definition file in
`.claude/agents/`. Use the agent best suited to the task at hand. When a task
spans multiple domains, the coordinating agent (usually `ds-project-manager` or
the domain lead) should delegate to specialists.

## Tier 1 -- Director Agents (Opus)

| Agent | Domain | When to Use |
|-------|--------|-------------|
| `chief-data-officer` | Strategy & governance | Project scoping, data strategy, stakeholder alignment, resource allocation |
| `ml-architecture-director` | ML systems architecture | ML system design, tech selection, model serving patterns, architecture reviews |
| `data-engineering-director` | Data platform | Data platform design, warehouse architecture, pipeline strategy, infra cost |
| `analytics-director` | Analytics & experimentation | Analytics strategy, experiment programs, KPI frameworks, reporting standards |
| `ds-project-manager` | Project coordination | Sprint planning, task assignment, progress tracking, cross-team coordination |

## Tier 2 -- Department Lead Agents (Sonnet)

| Agent | Domain | Reports To | When to Use |
|-------|--------|-----------|-------------|
| `data-engineering-lead` | Data engineering | data-engineering-director | ETL design, data pipeline architecture, data quality frameworks |
| `ml-engineering-lead` | ML engineering | ml-architecture-director | Model development workflows, training infrastructure, feature engineering |
| `analytics-lead` | Analytics | analytics-director | Analysis design, dashboard strategy, metric definitions |
| `mlops-lead` | MLOps | ml-architecture-director | CI/CD for ML, model deployment, monitoring, infrastructure |
| `data-governance-lead` | Data governance | data-engineering-director | Data quality policies, metadata management, compliance, access control |
| `visualization-lead` | Data visualization | analytics-director | Chart design, dashboard UX, storytelling with data |
| `experimentation-lead` | Experimentation | analytics-director | A/B test design, statistical methodology, experiment platforms |
| `nlp-lead` | NLP | ml-architecture-director | Text processing, LLM applications, NLP pipelines |
| `cv-lead` | Computer vision | ml-architecture-director | Image/video processing, CV model selection, annotation strategy |
| `platform-lead` | Data platform | data-engineering-director | Infrastructure, compute management, platform tooling |
| `research-lead` | Research | ml-architecture-director | Literature review, novel approaches, proof-of-concept |
| `data-product-lead` | Data products | data-engineering-director | Data APIs, data marketplace, self-service analytics |

## Tier 3 -- Specialist Agents

### Data Engineering (5 agents)

| Agent | Domain | Model | When to Use |
|-------|--------|-------|-------------|
| `data-engineer` | Data pipelines | Sonnet | ETL/ELT implementation, data transformations, pipeline code |
| `etl-specialist` | ETL patterns | Sonnet | Complex extraction, transformation logic, incremental loading |
| `streaming-engineer` | Real-time data | Sonnet | Kafka, streaming pipelines, real-time processing |
| `data-quality-engineer` | Data quality | Sonnet | Data validation rules, quality monitoring, anomaly detection |
| `metadata-engineer` | Metadata & lineage | Haiku | Data catalogs, lineage tracking, schema documentation |

### ML/AI (10 agents)

| Agent | Domain | Model | When to Use |
|-------|--------|-------|-------------|
| `ml-engineer` | General ML | Sonnet | Model implementation, training code, evaluation |
| `deep-learning-specialist` | Deep learning | Sonnet | Neural networks, PyTorch/TensorFlow, GPU optimization |
| `nlp-specialist` | NLP | Sonnet | Text preprocessing, transformers, embeddings, NER, sentiment |
| `cv-specialist` | Computer vision | Sonnet | Image classification, object detection, segmentation |
| `time-series-specialist` | Time series | Sonnet | Forecasting, anomaly detection, temporal features |
| `recommender-specialist` | Recommendation | Sonnet | Collaborative filtering, content-based, hybrid systems |
| `tabular-ml-specialist` | Tabular ML | Haiku | XGBoost, LightGBM, CatBoost, sklearn pipelines |
| `generative-ai-specialist` | Generative AI | Sonnet | LLMs, RAG, fine-tuning, prompt engineering |
| `feature-engineer` | Feature engineering | Sonnet | Feature creation, selection, feature stores |
| `prompt-engineer` | Prompt engineering | Sonnet | LLM prompts, chain design, evaluation |

### Statistics & Experimentation (3 agents)

| Agent | Domain | Model | When to Use |
|-------|--------|-------|-------------|
| `statistician` | Statistics | Sonnet | Hypothesis testing, distributions, sampling, power analysis |
| `bayesian-specialist` | Bayesian methods | Sonnet | Bayesian modeling, MCMC, probabilistic programming |
| `causal-inference-specialist` | Causal inference | Sonnet | Causal modeling, uplift, diff-in-diff, instrumental variables |

### Analytics & BI (5 agents)

| Agent | Domain | Model | When to Use |
|-------|--------|-------|-------------|
| `data-analyst` | Data analysis | Sonnet | SQL queries, data exploration, metric computation |
| `bi-developer` | BI tools | Sonnet | Dashboard implementation, BI platform configuration |
| `report-writer` | Report writing | Haiku | Analysis summaries, executive reports, presentations |
| `dashboard-designer` | Dashboard design | Sonnet | Dashboard layout, KPI visualization, interactivity |
| `ab-test-analyst` | A/B testing | Sonnet | Test analysis, statistical significance, experiment reporting |

### Visualization (1 agent)

| Agent | Domain | Model | When to Use |
|-------|--------|-------|-------------|
| `visualization-designer` | Data viz design | Sonnet | Chart selection, color palettes, accessibility, storytelling |

### MLOps & Infrastructure (4 agents)

| Agent | Domain | Model | When to Use |
|-------|--------|-------|-------------|
| `mlops-engineer` | MLOps | Sonnet | CI/CD for ML, model registry, deployment automation |
| `model-monitor` | Model monitoring | Sonnet | Drift detection, performance tracking, alerting |
| `infra-engineer` | Infrastructure | Sonnet | Cloud setup, compute provisioning, networking |
| `cost-optimizer` | Cost optimization | Haiku | Cloud cost analysis, right-sizing, spot instances |

### Quality & Documentation (5 agents)

| Agent | Domain | Model | When to Use |
|-------|--------|-------|-------------|
| `security-engineer` | Security | Sonnet | Data encryption, access control, PII handling, audit |
| `notebook-specialist` | Notebooks | Sonnet | Notebook quality, structure, reproducibility |
| `documentation-writer` | Documentation | Haiku | READMEs, API docs, runbooks, model cards |
| `test-engineer` | Testing | Sonnet | Test design, pytest, data validation, CI integration |
| `performance-engineer` | Performance | Sonnet | Query optimization, memory profiling, parallelization |

## Stack Specialists (12 agents)

| Agent | Technology | Model | When to Use |
|-------|-----------|-------|-------------|
| `python-ecosystem` | pandas, numpy, sklearn, PyTorch, polars | Sonnet | Python library selection, API patterns, performance |
| `r-ecosystem` | tidyverse, caret, tidymodels, shiny | Sonnet | R workflows, statistical computing, Shiny apps |
| `sql-warehouse` | BigQuery, Snowflake, Redshift, DuckDB | Sonnet | SQL optimization, warehouse-specific features |
| `spark-bigdata` | PySpark, Spark SQL, Delta Lake | Sonnet | Distributed processing, Spark tuning, Delta operations |
| `dbt-specialist` | dbt models, tests, macros | Sonnet | dbt project structure, incremental models, testing |
| `aws-ml` | SageMaker, S3, Glue, Athena | Sonnet | AWS ML services, IAM, cost management |
| `gcp-ml` | Vertex AI, BigQuery ML, Dataflow | Sonnet | GCP ML services, BigQuery optimization |
| `azure-ml` | Azure ML, Synapse, Data Factory | Sonnet | Azure ML workspace, Databricks integration |
| `databricks-specialist` | Unity Catalog, MLflow, Delta Lake | Sonnet | Databricks workspace, notebooks, Unity Catalog |
| `snowflake-specialist` | Snowpark, streams, tasks, Snowpipe | Sonnet | Snowflake optimization, Snowpark Python |
| `airflow-specialist` | DAGs, operators, sensors, XComs | Sonnet | Airflow DAG design, custom operators, scheduling |
| `docker-k8s-specialist` | Docker, Helm, KServe, Seldon | Sonnet | Containerization, orchestration, model serving |
