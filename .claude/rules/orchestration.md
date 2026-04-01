---
paths:
  - "project/dags/**"
  - "project/src/pipelines/orchestration/**"
---

# Orchestration Rules

- Every DAG MUST have: owner, description, start_date, schedule_interval
- DAGs MUST have retries configured with appropriate retry_delay
- Failure callbacks MUST be configured for alerting
- Tasks MUST be idempotent — safe to re-run
- Use task groups for logical grouping of related tasks
- XCom usage MUST be minimized — only small metadata, never data payloads
- DAG files MUST be tested with `dag.test()` before deployment
- Sensor timeouts MUST be configured to prevent infinite waiting
- Backfill-safe design: DAGs should handle historical runs correctly
- Include data quality checks between pipeline stages
