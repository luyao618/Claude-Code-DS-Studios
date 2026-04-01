---
paths:
  - "project/src/pipelines/**"
  - "project/src/data/**"
  - "project/dags/**"
---

# Data Pipeline Rules

- All pipelines MUST be idempotent — re-running produces the same result
- Include data validation at pipeline boundaries (input schemas, output checks)
- Log row counts, schema checks, and null percentages at each transformation step
- Use incremental processing when possible — full refreshes must be justified
- Failed pipelines MUST be safely retriable without manual intervention
- Raw data is IMMUTABLE — never modify files in data/raw/
- Intermediate results go to data/interim/, final results to data/processed/
- All configuration (paths, parameters, thresholds) MUST be externalized
- Pipelines MUST have monitoring and alerting for failures
- Use data contracts: define expected schemas between pipeline stages
- Airflow DAGs MUST have: owner, retries, retry_delay, and failure callbacks
- Pipeline dependencies MUST be explicit — no implicit ordering assumptions
- Include data freshness checks — alert if source data is stale
