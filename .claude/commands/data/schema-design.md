---
name: schema-design
description: "Designs data warehouse schemas — dimensional models, star/snowflake schemas, or denormalized tables based on query patterns and use cases."
argument-hint: "<domain> [--style star|snowflake|obt]"
user-invocable: true
allowed-tools: Read, Glob, Grep, Write, Edit, Bash, WebSearch
---

# Schema Design

Designs data warehouse schemas optimized for analytics and ML feature serving.

## Workflow
1. Understand data entities and relationships
2. Identify query patterns and access patterns
3. Choose modeling approach (star, snowflake, OBT)
4. Design tables with appropriate keys and indexes
5. Generate DDL and dbt model stubs
6. Document schema with ERD
