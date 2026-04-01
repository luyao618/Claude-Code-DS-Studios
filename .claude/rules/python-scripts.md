---
paths:
  - "project/src/**/*.py"
  - "src/**/*.py"
---

# Python Script Rules

- All functions MUST have type hints on parameters and return values
- All public functions MUST have Google-style docstrings
- Use `logging` module for all output — no `print()` in production code
- No hardcoded paths — use `pathlib.Path` and config files
- No hardcoded credentials — use environment variables or secrets manager
- No magic numbers — define as named constants with comments
- Use `ruff` formatting standards (line length: 100)
- Imports sorted: stdlib, third-party, local (enforced by isort/ruff)
- Every module MUST have a module-level docstring
- Exception handling must be specific — no bare `except:` clauses
- Use context managers for file and database operations
- Dataclass or Pydantic models for configuration objects
- Functions should be pure where possible — minimize side effects
