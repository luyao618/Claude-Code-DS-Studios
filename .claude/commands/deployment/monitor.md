---
name: monitor
description: "Sets up model monitoring — drift detection, performance tracking, data quality monitoring, and alerting. Configures automated retraining triggers."
argument-hint: "<model-name> [--drift|--performance|--all]"
user-invocable: true
allowed-tools: Read, Glob, Grep, Write, Edit, Bash
---

# Model Monitoring

This command sets up comprehensive monitoring for production models.

## Workflow

### 1. Define Monitoring Requirements

- What metrics to track (prediction drift, feature drift, performance)
- Alerting thresholds
- Monitoring frequency (per-request, hourly, daily)
- Notification channels

### 2. Drift Detection Setup

**Prediction Drift:**
- KS test for continuous predictions
- Chi-squared test for categorical predictions
- PSI (Population Stability Index)
- Threshold configuration

**Feature Drift:**
- Per-feature distribution monitoring
- Missing rate changes
- New category detection
- Schema drift detection

### 3. Performance Monitoring

- Ground truth collection pipeline (if available)
- Proxy metrics (when ground truth is delayed)
- Performance degradation detection
- A/B comparison with previous model version

### 4. Data Quality Monitoring

- Input data validation
- Missing value rates
- Out-of-range values
- Data freshness

### 5. Generate Monitoring Config

Create monitoring configuration and scripts:
- `project/configs/monitoring/[model_name].yaml`
- `project/src/serving/monitor.py` — monitoring logic
- Alert definitions and thresholds

### 6. Dashboard Integration

Recommend monitoring dashboard with:
- Real-time prediction volume
- Drift metrics over time
- Performance metrics trend
- Alert history

### Agent Consultation

- `model-monitor` for implementation
- `data-quality-engineer` for data monitoring
- `mlops-engineer` for infrastructure
