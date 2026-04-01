---
name: ab-test
description: "Designs and analyzes A/B tests — hypothesis formulation, sample size calculation, test monitoring, and result interpretation with statistical rigor."
argument-hint: "<test-name> [design|analyze|monitor]"
user-invocable: true
allowed-tools: Read, Glob, Grep, Write, Edit, Bash, WebSearch
---

# A/B Test Workflow

This command orchestrates A/B test design, monitoring, and analysis.

## Workflow

### For `design`:

1. **Define Hypothesis**
   - Null hypothesis (H0): no difference
   - Alternative hypothesis (H1): specific directional change
   - Primary metric: one metric that determines success
   - Secondary metrics: additional metrics to monitor
   - Guardrail metrics: metrics that must not degrade

2. **Sample Size Calculation**
   - Minimum detectable effect (MDE)
   - Significance level (alpha, default: 0.05)
   - Statistical power (1-beta, default: 0.80)
   - Baseline conversion rate or metric value
   - Calculate required sample size per variant

3. **Test Design Document**
   Create `project/experiments/ab_tests/[name]_design.md`:
   ```markdown
   # A/B Test: [Name]

   ## Hypothesis
   H0: [null hypothesis]
   H1: [alternative hypothesis]

   ## Metrics
   - Primary: [metric] (MDE: [X%])
   - Secondary: [metrics]
   - Guardrails: [metrics]

   ## Design
   - Sample size: [N] per variant
   - Duration: [estimated days]
   - Randomization unit: [user/session/etc.]
   - Variants: Control vs. Treatment

   ## Analysis Plan
   - Statistical test: [t-test/chi-squared/Mann-Whitney]
   - Correction method: [Bonferroni/BH if multiple metrics]
   - Sequential testing: [yes/no]
   ```

### For `analyze`:

1. **Load Results Data**
2. **Run Statistical Tests**
   - Primary metric: hypothesis test + confidence interval
   - Effect size with confidence interval
   - P-value interpretation
   - Practical significance assessment
3. **Segment Analysis**
   - Check for heterogeneous treatment effects
   - Analyze key segments
4. **Generate Analysis Report**

### For `monitor`:

1. **Check Sample Size Progress**
2. **Guardrail Metric Check**
3. **Early Stopping Assessment** (if sequential testing)
4. **Generate Status Update**

### Agent Consultation

- `ab-test-analyst` for analysis execution
- `statistician` for methodology questions
- `experimentation-lead` for design review
- `causal-inference-specialist` for complex designs
