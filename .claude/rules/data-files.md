---
paths:
  - "project/data/**"
  - "data/**"
---

# Data File Rules

- Raw data in `data/raw/` is IMMUTABLE — never modify, only read
- Processed data goes to `data/processed/` with clear naming conventions
- Interim/temporary data goes to `data/interim/` — acceptable to regenerate
- Feature data goes to `data/features/` with version metadata
- File naming convention: `[dataset]_[version]_[date].[format]`
- Large files MUST NOT be committed to git — use DVC, Git LFS, or cloud storage
- Every dataset MUST have a corresponding data catalog entry
- CSV files MUST include headers — no headerless CSVs
- Parquet is preferred over CSV for large datasets (compression + schema)
- Data files MUST have documented schemas (column names, types, descriptions)
- Include row count and checksum in metadata for validation
- External data sources MUST be documented with: source URL, access method, refresh schedule
- PII data MUST be flagged and handled according to governance policies
