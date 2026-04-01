---
paths:
  - "project/dbt/**"
  - "**/*.sql"
---

# SQL Query Rules

- Use uppercase for SQL keywords (SELECT, FROM, WHERE, JOIN, GROUP BY, ORDER BY)
- Use CTEs (WITH clauses) instead of nested subqueries for readability
- Every CTE MUST have a comment explaining its purpose
- Include a header comment: author, date, purpose, dependencies
- Always qualify column names with table/alias in JOINs (never ambiguous columns)
- Use COALESCE for NULL handling — document expected NULL behavior
- Avoid SELECT * in production queries — explicitly name all columns
- Use table aliases that are meaningful (not single letters unless obvious)
- dbt models MUST have schema tests: unique, not_null, accepted_values where applicable
- dbt models MUST have a YAML schema file with column descriptions
- Use incremental models for large tables — document the incremental strategy
- Include row count logging in pipeline queries
- Date filters MUST use parameterized values, never hardcoded dates
