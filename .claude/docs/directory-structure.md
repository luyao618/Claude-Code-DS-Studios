# Directory Structure

```text
/
├── CLAUDE.md                        # Master configuration
├── .claude/                         # Agent definitions, commands, hooks, rules, docs
├── project/
│   ├── data/
│   │   ├── raw/                     # Immutable raw data (never modify)
│   │   ├── interim/                 # Intermediate transformations
│   │   ├── processed/               # Final, clean datasets
│   │   ├── external/                # Third-party data sources
│   │   └── features/                # Feature store / engineered features
│   ├── notebooks/
│   │   ├── exploratory/             # EDA and data investigation
│   │   ├── modeling/                # Model development and experimentation
│   │   ├── evaluation/              # Model evaluation and comparison
│   │   └── reporting/               # Final analysis reports
│   ├── src/
│   │   ├── data/                    # Data loading, cleaning, validation
│   │   ├── features/                # Feature engineering code
│   │   ├── models/                  # Model definitions and training
│   │   ├── pipelines/               # End-to-end pipeline orchestration
│   │   ├── serving/                 # Model serving (API, batch inference)
│   │   ├── visualization/           # Chart and dashboard code
│   │   └── utils/                   # Shared utilities
│   ├── dbt/
│   │   ├── models/                  # dbt SQL models (staging, marts)
│   │   ├── seeds/                   # Static reference data
│   │   ├── macros/                  # Reusable SQL macros
│   │   └── tests/                   # dbt data tests
│   ├── dags/                        # Airflow DAG definitions
│   ├── configs/                     # YAML/JSON configuration files
│   ├── tests/
│   │   ├── unit/                    # Unit tests for src/ modules
│   │   ├── integration/             # Integration tests for pipelines
│   │   └── data/                    # Data validation tests
│   ├── models/                      # Serialized model artifacts
│   ├── reports/
│   │   └── figures/                 # Generated charts and visualizations
│   ├── experiments/                 # Experiment tracking logs and artifacts
│   │   └── session-state/           # Ephemeral session state (gitignored)
│   └── docker/                      # Dockerfiles and docker-compose
```

## Key Conventions

- `data/raw/` is **immutable** — never modify raw data files
- `data/processed/` contains analysis-ready datasets
- `data/features/` is the feature store — versioned feature sets
- `notebooks/` are for exploration only — production code lives in `src/`
- `src/` follows a module-per-concern pattern
- `models/` stores serialized models with version metadata
- `configs/` externalizes all hyperparameters, paths, and settings
- `experiments/` tracks all training runs (integrates with MLflow)
- `tests/data/` validates data schemas and quality constraints
