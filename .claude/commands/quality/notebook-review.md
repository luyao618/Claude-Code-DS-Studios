---
name: notebook-review
description: "Reviews Jupyter notebooks for quality, reproducibility, and DS best practices. Checks cell structure, documentation, output cleanliness, and version control readiness."
argument-hint: "<notebook-path>"
user-invocable: true
allowed-tools: Read, Glob, Grep, Bash, NotebookEdit
---

# Notebook Review

This command reviews Jupyter notebooks against DS quality standards.

## Review Checklist

### 1. Structure
- [ ] Title cell (markdown): name, author, date, purpose
- [ ] All imports in the first code cell
- [ ] Logical section headers (## markdown cells)
- [ ] No cells longer than 30 lines
- [ ] Clear narrative flow: header → code → interpretation
- [ ] Conclusion/summary section at the end

### 2. Reproducibility
- [ ] Package versions documented (requirements or %pip install)
- [ ] Random seeds set
- [ ] Data paths are relative or configurable (no `/Users/...`)
- [ ] All cells can run top-to-bottom without errors
- [ ] No cells depend on external state not set in the notebook

### 3. Documentation
- [ ] Each section has a purpose description
- [ ] Key findings are interpreted in markdown (not just code output)
- [ ] Assumptions are documented
- [ ] Visualizations have titles, labels, and legends
- [ ] Magic numbers are explained

### 4. Code Quality
- [ ] No dead code or debugging cells
- [ ] No commented-out code blocks (remove or explain)
- [ ] Variable names are descriptive
- [ ] Functions used for repeated logic
- [ ] No global state mutations

### 5. Output Hygiene
- [ ] No large DataFrames printed (use .head())
- [ ] No unnecessary debug output
- [ ] Charts are appropriately sized
- [ ] Sensitive data not displayed in outputs
- [ ] Cell execution counts are sequential

### 6. Version Control
- [ ] Outputs cleared or minimal (reduces merge conflicts)
- [ ] No large binary data embedded
- [ ] No credentials in any cell

## Output Format

```markdown
# Notebook Review: [name]

## Summary
- **Overall**: [PASS/CONCERNS/FAIL]
- **Cells reviewed**: [N]
- **Issues found**: [N]

## Issues
### Critical
### Warnings
### Suggestions

## Positive Observations
```

### Agent Consultation

- `notebook-specialist` for notebook-specific improvements
- `visualization-designer` for chart improvements
- `analytics-lead` for analysis methodology
