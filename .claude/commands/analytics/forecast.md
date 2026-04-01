---
name: forecast
description: "Builds time series forecasts — model selection, training, evaluation, and visualization of predictions with confidence intervals."
argument-hint: "<data-path> --target <column> --horizon <periods>"
user-invocable: true
allowed-tools: Read, Glob, Grep, Write, Edit, Bash, NotebookEdit, WebSearch
---

# Time Series Forecasting

Build and evaluate time series forecasts.

## Workflow
1. Load and validate time series data
2. Decompose: trend, seasonality, residuals
3. Select model (ARIMA, Prophet, ML-based)
4. Train with proper time series cross-validation
5. Generate forecast with confidence intervals
6. Evaluate: MAPE, RMSE, visual inspection
7. Create forecast report
