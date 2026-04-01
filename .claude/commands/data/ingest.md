---
name: ingest
description: "Sets up data ingestion — source connection, extraction logic, raw data storage, and initial validation. Supports databases, APIs, files, and streaming sources."
argument-hint: "<source-type> [--source <connection>]"
user-invocable: true
allowed-tools: Read, Glob, Grep, Write, Edit, Bash, WebSearch
---

# Data Ingestion

Sets up data ingestion from various sources to the project's raw data directory.

## Supported Sources
- **Database**: PostgreSQL, MySQL, BigQuery, Snowflake, Redshift
- **File**: CSV, Parquet, JSON, Excel (local or cloud storage)
- **API**: REST APIs with pagination and rate limiting
- **Streaming**: Kafka topics, event streams

## Workflow
1. Identify source type and connection details
2. Generate ingestion code in `project/src/data/ingest_[source].py`
3. Create configuration in `project/configs/ingestion/[source].yaml`
4. Add data validation checks
5. Document in data catalog
