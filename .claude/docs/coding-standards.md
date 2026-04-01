# Coding Standards

## Python Standards

- All Python code must include type hints on function signatures
- All public functions must have docstrings (Google style)
- Use `ruff` for linting and formatting (line length: 100)
- Use `mypy` for type checking (strict mode recommended)
- Every module must have a module-level docstring explaining its purpose
- Imports must be sorted: stdlib, third-party, local (enforced by ruff)
- No hardcoded paths, credentials, or magic numbers — use config files
- Use `pathlib.Path` over `os.path` for file operations
- Use `logging` over `print` for any non-notebook code
- **Verification-driven development**: Write tests first when adding data pipelines
  or model training code. Compare expected output to actual output before marking
  work complete.

## SQL Standards

- Use uppercase for SQL keywords (`SELECT`, `FROM`, `WHERE`, `JOIN`)
- Use CTEs over nested subqueries for readability
- Every CTE must have a comment explaining its purpose
- Include a header comment with: author, date, purpose, dependencies
- Always qualify column names with table aliases in JOINs
- Use `COALESCE` for NULL handling, document expected NULL behavior
- Avoid `SELECT *` in production queries — explicitly name columns
- dbt models must have schema tests (`unique`, `not_null`, `accepted_values`)

## Notebook Standards

- Every notebook must start with a markdown cell: title, author, date, purpose
- Use a consistent cell structure: Markdown header -> Code -> Output interpretation
- No cells longer than 30 lines — split into logical units
- All imports in the first code cell
- Pin all package versions in a requirements comment or `%pip install` cell
- Visualizations must have titles, axis labels, and legends
- Clean up exploratory cells before sharing — remove dead code and debugging
- Save final results to files, don't just display them
- Use `%%time` or `%%timeit` for performance-critical cells

## Data Pipeline Standards

- All pipelines must be idempotent (re-running produces the same result)
- Include data validation at pipeline boundaries (input/output)
- Log row counts, schema checks, and null percentages at each step
- Use partitioning for large datasets (date-based preferred)
- Store intermediate results for debugging (configurable in production)
- All configs externalized to YAML/JSON files in `configs/`

## Model Training Standards

- Every training run must be logged to an experiment tracker (MLflow preferred)
- Log: parameters, metrics, artifacts, data version, code version
- Use random seeds for reproducibility — document the seed
- Save model artifacts with metadata (training date, data hash, metrics)
- Baseline models must exist before complex models are attempted
- Feature importance must be computed and logged for all models
- Document any data leakage prevention measures

## Testing Standards

- Unit tests for all data transformation functions
- Integration tests for pipeline end-to-end (with sample data)
- Data tests: schema validation, null checks, range checks, uniqueness
- Model tests: prediction shape, score ranges, inference time
- Use `pytest` as the test framework
- Test data must be in `tests/fixtures/` — never use production data in tests
- Minimum 80% coverage for `src/` modules

## Git Standards

- Commits must reference a task or purpose in the message
- Branch naming: `feature/`, `fix/`, `experiment/`, `data/`
- No large data files in git — use DVC or Git LFS
- No credentials or secrets in any committed file
- `.gitignore` must include: `data/raw/`, `models/*.pkl`, `.env`, `__pycache__/`
