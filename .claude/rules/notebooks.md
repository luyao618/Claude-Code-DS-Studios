---
paths:
  - "project/notebooks/**"
  - "**/*.ipynb"
---

# Notebook Rules

- Every notebook MUST start with a markdown cell containing: title, author, date, purpose
- All imports MUST be in the first code cell
- No cell may exceed 30 lines — split into logical units
- Every code section MUST be preceded by a markdown header explaining intent
- Visualizations MUST have titles, axis labels, and legends
- No hardcoded absolute paths (use relative paths or config variables)
- Package versions MUST be documented (requirements comment or %pip install)
- Random seeds MUST be set for any stochastic operations
- Output cells displaying DataFrames MUST use .head() or .sample() — no full DataFrame prints
- Dead code and debugging cells MUST be removed before committing
- Sensitive data (credentials, PII) MUST NOT appear in any cell or output
- When creating notebooks, use the incremental approach: create skeleton first,
  then fill each section with user approval between sections
