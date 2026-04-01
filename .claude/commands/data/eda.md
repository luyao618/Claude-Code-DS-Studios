---
name: eda
description: "Runs an exploratory data analysis workflow — loads data, profiles it, generates summary statistics, identifies quality issues, and creates visualizations. Produces a structured EDA notebook or report."
argument-hint: "<data-path> [--output notebook|report]"
user-invocable: true
allowed-tools: Read, Glob, Grep, Write, Edit, Bash, NotebookEdit, WebSearch
---

# Exploratory Data Analysis

This command orchestrates a structured EDA workflow, producing either a Jupyter
notebook or a markdown report.

## Workflow

### 1. Identify the Data

- If a data path is provided, use it
- Otherwise, scan `project/data/raw/` and `project/data/processed/` for available datasets
- Ask the user which dataset to analyze if multiple are found
- Support formats: CSV, Parquet, JSON, Excel, SQL query results

### 2. Data Profiling

Generate comprehensive statistics:

**Shape & Types:**
- Row count, column count
- Data types (numeric, categorical, datetime, text)
- Memory usage

**Univariate Analysis:**
- Numeric: mean, median, std, min, max, quartiles, skewness, kurtosis
- Categorical: unique values, top frequencies, missing rates
- Datetime: range, frequency, gaps

**Missing Data:**
- Missing counts and percentages per column
- Missing patterns (MCAR, MAR, MNAR assessment)
- Visualization of missing patterns

**Distributions:**
- Histograms for numeric columns
- Bar charts for categorical columns
- Box plots for outlier detection

### 3. Bivariate Analysis

- Correlation matrix (numeric columns)
- Cross-tabulations (categorical columns)
- Scatter plots for key relationships
- Target variable analysis (if specified)

### 4. Data Quality Assessment

- Duplicate rows
- Constant columns
- High-cardinality categoricals
- Potential data leakage indicators
- Date range validation
- Outlier detection (IQR method)

### 5. Generate Output

**Notebook format** (default):
- Create `project/notebooks/exploratory/eda_[dataset]_[date].ipynb`
- Structured cells: imports, loading, profiling, visualization, findings

**Report format:**
- Create `project/reports/eda_[dataset]_[date].md`
- Markdown with embedded chart references

### 6. Summarize Findings

Produce a summary section with:
- Key findings (top 5 observations)
- Data quality issues requiring attention
- Recommended next steps (feature engineering, cleaning, modeling)

### Agent Consultation

For comprehensive EDA, consider consulting:
- `data-analyst` for domain-specific analysis
- `data-quality-engineer` for quality assessment
- `visualization-designer` for chart optimization
- `analytics-lead` for analysis strategy
