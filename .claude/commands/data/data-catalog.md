---
name: data-catalog
description: "Documents a dataset with comprehensive metadata — schema, statistics, lineage, quality metrics, and usage guidelines. Creates a data catalog entry."
argument-hint: "<data-path> [--update]"
user-invocable: true
allowed-tools: Read, Glob, Grep, Write, Edit, Bash
---

# Data Catalog Entry

This command creates or updates a data catalog entry for a dataset, making it
discoverable and understandable for all team members.

## Workflow

### 1. Identify the Data
- Use provided data path
- Detect format and schema automatically

### 2. Gather Metadata

**Technical Metadata:**
- Schema (column names, types, descriptions)
- Row count, file size
- Partitioning (if applicable)
- Format and compression

**Business Metadata:**
- Ask user for: description, owner, business domain
- Suggested tags based on column names
- Access level (public, restricted, confidential)

**Quality Metadata:**
- Run quick quality checks
- Completeness score, freshness, last updated

**Lineage:**
- Source system (ask user)
- Upstream dependencies
- Downstream consumers (if known)

### 3. Generate Catalog Entry

Create `project/data/catalog/[dataset_name].md`:
```markdown
# Dataset: [Name]

## Description
[Business description]

## Owner
[Team/Person]

## Schema
| Column | Type | Description | Nullable | Example |
|--------|------|-------------|----------|---------|

## Statistics
- Rows: [N]
- Last Updated: [Date]
- Freshness SLA: [Hours/Days]

## Quality
- Completeness: [%]
- Last Quality Check: [Date]

## Lineage
- Source: [System/Table]
- Updated by: [Pipeline/Process]
- Consumers: [List]

## Access
- Level: [Public/Restricted/Confidential]
- Request access: [Process]

## Usage Notes
[Any caveats, known issues, or tips for consumers]
```
