---
name: sql-review
description: "Reviews SQL queries for quality, performance, and best practices — query plan analysis, index recommendations, and anti-pattern detection."
argument-hint: "<sql-file-or-directory>"
user-invocable: true
allowed-tools: Read, Glob, Grep, Bash
---

# SQL Code Review

Reviews SQL queries against coding standards and performance best practices.

## Checklist
- Keyword casing (uppercase)
- CTE usage over nested subqueries
- Column qualification in JOINs
- SELECT * detection
- NULL handling
- Index recommendations
- dbt test coverage (if applicable)
- Query plan analysis
