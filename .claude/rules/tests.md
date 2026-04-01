---
paths:
  - "project/tests/**"
  - "tests/**"
---

# Test Rules

- Unit tests for all data transformation functions in src/
- Integration tests for pipeline end-to-end with sample data
- Data validation tests: schema checks, null rates, value ranges, uniqueness
- Model tests: prediction shape, score ranges, inference latency
- Use `pytest` as the test framework — consistent with the ecosystem
- Test data MUST be in `tests/fixtures/` — never use production data in tests
- Test functions MUST have descriptive names: `test_[what]_[scenario]_[expected]`
- Tests MUST be deterministic — set random seeds, mock external services
- Minimum 80% coverage for `src/` modules
- Tests MUST run in CI — no test should require manual setup
- Parameterize tests for multiple scenarios (use pytest.mark.parametrize)
- Include edge case tests: empty DataFrames, null values, type mismatches
- Performance tests for critical paths: query time, prediction latency
