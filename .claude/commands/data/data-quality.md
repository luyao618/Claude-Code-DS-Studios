---
name: data-quality
description: "Assesses data quality across multiple dimensions — completeness, accuracy, consistency, timeliness, and uniqueness. Generates a quality report with actionable recommendations."
argument-hint: "<data-path> [--strict]"
user-invocable: true
allowed-tools: Read, Glob, Grep, Write, Edit, Bash, NotebookEdit
---

# Data Quality Assessment

This command performs a comprehensive data quality assessment and produces an
actionable report.

## Workflow

### 1. Identify the Data
- Use provided data path or scan available datasets
- Support: CSV, Parquet, JSON, database tables

### 2. Quality Dimensions

Assess each dimension with specific checks:

**Completeness:**
- Missing value counts and percentages per column
- Row completeness (% of rows with all fields populated)
- Required fields validation (from schema if available)

**Accuracy:**
- Value range checks (numeric columns)
- Pattern validation (emails, phones, dates)
- Referential integrity (foreign keys if applicable)
- Business rule validation (from config if available)

**Consistency:**
- Cross-column consistency (e.g., start_date < end_date)
- Format consistency within columns
- Unit consistency
- Encoding consistency (UTF-8, etc.)

**Timeliness:**
- Data freshness (latest timestamp)
- Expected update frequency vs. actual
- Date gaps and irregularities

**Uniqueness:**
- Duplicate rows
- Duplicate keys
- Near-duplicates (fuzzy matching)

### 3. Generate Report

Create `project/reports/data-quality_[dataset]_[date].md`:
```markdown
# Data Quality Report: [Dataset]

## Summary
| Dimension | Score | Status |
|-----------|-------|--------|
| Completeness | 95% | PASS |
| Accuracy | 87% | WARN |
| Consistency | 92% | PASS |
| Timeliness | 100% | PASS |
| Uniqueness | 99% | PASS |

## Detailed Findings
### Critical Issues
### Warnings
### Informational

## Recommendations
### Immediate Actions
### Long-term Improvements
```

### 4. Recommend Next Steps
- If critical issues: flag for data-engineering-lead
- If warnings: suggest specific fixes
- If clean: recommend proceeding to feature engineering or modeling
