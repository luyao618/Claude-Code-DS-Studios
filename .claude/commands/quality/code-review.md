---
name: code-review
description: "Reviews Python code for quality, maintainability, performance, and DS-specific best practices. Checks for common ML anti-patterns, data leakage, and testing gaps."
argument-hint: "<file-or-directory> [--strict]"
user-invocable: true
allowed-tools: Read, Glob, Grep, Bash
---

# Code Review

This command performs a comprehensive code review focused on data science and
ML best practices.

## Review Checklist

### 1. Code Quality
- [ ] Type hints on all function signatures
- [ ] Docstrings on all public functions (Google style)
- [ ] No hardcoded paths, credentials, or magic numbers
- [ ] Consistent naming conventions
- [ ] No unused imports or variables
- [ ] Appropriate error handling
- [ ] Logging instead of print statements (non-notebook code)

### 2. Data Science Specific
- [ ] No data leakage (target information in features)
- [ ] Proper train/test split (no information from test in training)
- [ ] Random seeds set for reproducibility
- [ ] Feature scaling applied consistently (fit on train, transform on test)
- [ ] Class imbalance handled appropriately
- [ ] Null/missing value handling documented

### 3. ML Pipeline Quality
- [ ] Pipeline is idempotent (re-running produces same results)
- [ ] Data validation at pipeline boundaries
- [ ] Experiment tracking calls present
- [ ] Model artifacts saved with metadata
- [ ] Feature importance computed

### 4. Performance
- [ ] No unnecessary copies of large DataFrames
- [ ] Appropriate use of vectorized operations
- [ ] Database queries are optimized (no SELECT *, proper indexing)
- [ ] Memory-efficient data types used

### 5. Testing
- [ ] Unit tests exist for data transformation functions
- [ ] Integration tests for pipeline end-to-end
- [ ] Data validation tests
- [ ] Model prediction shape and range tests

### 6. Security
- [ ] No hardcoded credentials
- [ ] No PII in logs or outputs
- [ ] Appropriate file permissions
- [ ] Input validation for any external data

## Output Format

```markdown
# Code Review: [file/directory]

## Summary
- **Overall**: [PASS/CONCERNS/FAIL]
- **Files reviewed**: [N]
- **Issues found**: [N critical, N warnings, N suggestions]

## Critical Issues
[Must fix before merge]

## Warnings
[Should fix, but not blocking]

## Suggestions
[Nice to have improvements]

## Positive Observations
[What's done well — reinforcement matters]
```

### Agent Consultation

- `test-engineer` for testing improvements
- `performance-engineer` for performance issues
- `security-engineer` for security concerns
- `ml-engineering-lead` for ML pattern review
