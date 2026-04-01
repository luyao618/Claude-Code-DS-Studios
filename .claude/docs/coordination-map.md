# Agent Coordination and Delegation Map

## Organizational Hierarchy

```
                              [Human Data Scientist]
                                       |
         +-------------+--------------++--------------+--------------+
         |              |              |               |              |
  chief-data-officer  ml-arch-dir  de-director  analytics-dir  ds-project-mgr
         |              |              |               |              |
      (strategy)   +----+----+    +---+---+      +----+----+   (coordination)
                   |    |    |    |   |   |      |    |    |
              ml-lead mlops nlp  de-lead gov  ana-lead viz  exp
                |     |    |  cv   |    |  plat  |    |    |
              +-+-+   |   ++-+  +--+--+ |  |   +-+-+ |  +-+-+
              | | |   |   | |   | | | | |  |   | | | |  | | |
             [ML Specialists] [DE Specs] [Gov] [Analytics] [Exp]
              |                  |         |      |          |
           research           d-prod    sec    bi-dev    stats
              |                          |
           [Stack Specialists x12]    perf-eng

  Tier 3 Specialists by Department:

  Data Engineering: data-engineer, etl-specialist, streaming-engineer,
                    data-quality-engineer, metadata-engineer

  ML/AI: ml-engineer, deep-learning-specialist, nlp-specialist,
         cv-specialist, time-series-specialist, recommender-specialist,
         tabular-ml-specialist, generative-ai-specialist,
         feature-engineer, prompt-engineer

  Statistics: statistician, bayesian-specialist, causal-inference-specialist

  Analytics: data-analyst, bi-developer, report-writer,
             dashboard-designer, ab-test-analyst

  Visualization: visualization-designer

  MLOps: mlops-engineer, model-monitor, infra-engineer, cost-optimizer

  Quality: security-engineer, notebook-specialist, documentation-writer,
           test-engineer, performance-engineer
```

### Legend
```
ml-arch-dir = ml-architecture-director
de-director = data-engineering-director
analytics-dir = analytics-director
ds-project-mgr = ds-project-manager
ml-lead = ml-engineering-lead
de-lead = data-engineering-lead
ana-lead = analytics-lead
gov = data-governance-lead
viz = visualization-lead
exp = experimentation-lead
plat = platform-lead
d-prod = data-product-lead
sec = security-engineer
perf-eng = performance-engineer
```

## Delegation Rules

### Who Can Delegate to Whom

| From | Can Delegate To |
|------|----------------|
| chief-data-officer | All directors, all leads (strategic directives) |
| ml-architecture-director | ml-engineering-lead, mlops-lead, nlp-lead, cv-lead, research-lead |
| data-engineering-director | data-engineering-lead, data-governance-lead, platform-lead, data-product-lead |
| analytics-director | analytics-lead, visualization-lead, experimentation-lead |
| ds-project-manager | Any agent (task assignment within their domain only) |
| ml-engineering-lead | ml-engineer, deep-learning-specialist, feature-engineer, tabular-ml-specialist, generative-ai-specialist, prompt-engineer |
| mlops-lead | mlops-engineer, model-monitor, infra-engineer, cost-optimizer |
| nlp-lead | nlp-specialist |
| cv-lead | cv-specialist |
| data-engineering-lead | data-engineer, etl-specialist, streaming-engineer, data-quality-engineer, metadata-engineer |
| data-governance-lead | data-quality-engineer, metadata-engineer, security-engineer |
| analytics-lead | data-analyst, bi-developer, report-writer, dashboard-designer |
| visualization-lead | visualization-designer, dashboard-designer |
| experimentation-lead | ab-test-analyst, statistician |
| research-lead | bayesian-specialist, causal-inference-specialist, time-series-specialist, recommender-specialist |
| platform-lead | infra-engineer, docker-k8s-specialist |
| data-product-lead | data-engineer, bi-developer |

### Escalation Paths

| Situation | Escalate To |
|-----------|------------|
| Data quality vs. delivery speed | data-engineering-director |
| Model accuracy vs. latency | ml-architecture-director |
| Feature engineering approach conflict | ml-engineering-lead, then ml-architecture-director |
| Data schema change affecting models | ds-project-manager (coordinates), then directors |
| ML vs. heuristic approach debate | ml-architecture-director |
| Analytics methodology disagreement | analytics-director |
| A/B test design conflict | experimentation-lead, then analytics-director |
| Cloud cost overruns | cost-optimizer flags, data-engineering-director decides |
| Security/compliance concern | security-engineer flags, chief-data-officer decides |
| Cross-team resource contention | ds-project-manager |
| Strategic direction question | chief-data-officer |
| Pipeline failure affecting models | ds-project-manager coordinates de-lead + ml-lead |

## Common Workflow Patterns

### Pattern 1: New ML Project (Full Pipeline)

```
1. chief-data-officer    -- Scopes project, defines success criteria
2. ds-project-manager    -- Creates project plan, identifies dependencies
3. data-engineering-lead -- Designs data pipeline, identifies data sources
4. data-engineer         -- Implements ETL, loads raw data
5. data-analyst          -- Runs EDA, profiles data quality
6. ml-engineering-lead   -- Designs modeling approach
7. feature-engineer      -- Creates feature engineering pipeline
8. ml-engineer           -- Trains and evaluates models
9. mlops-lead            -- Designs deployment architecture
10. mlops-engineer       -- Deploys model to production
11. model-monitor        -- Sets up monitoring and alerting
12. dashboard-designer   -- Creates performance dashboard
13. ds-project-manager   -- Marks project complete, runs retrospective
```

### Pattern 2: EDA Workflow

```
1. analytics-lead       -- Defines analysis questions and scope
2. data-analyst         -- Writes SQL queries, explores data
3. visualization-designer -- Creates informative charts
4. notebook-specialist  -- Ensures notebook quality and reproducibility
5. report-writer        -- Summarizes findings
6. analytics-lead       -- Reviews and approves analysis
```

### Pattern 3: A/B Test

```
1. experimentation-lead  -- Designs experiment (hypothesis, metrics, duration)
2. statistician          -- Computes sample size, selects test methodology
3. data-engineer         -- Sets up event tracking pipeline
4. ab-test-analyst       -- Monitors test and analyzes results
5. causal-inference-specialist -- Validates causal claims (if needed)
6. experimentation-lead  -- Makes go/no-go recommendation
7. analytics-director    -- Final decision
```

### Pattern 4: Model Retraining

```
1. model-monitor         -- Detects drift, triggers retraining alert
2. mlops-lead            -- Evaluates if retraining is needed
3. data-engineer         -- Refreshes training data
4. feature-engineer      -- Updates feature pipeline
5. ml-engineer           -- Retrains model, evaluates against baseline
6. mlops-engineer        -- Deploys new model (shadow or canary)
7. model-monitor         -- Validates new model in production
8. mlops-lead            -- Promotes new model or rolls back
```

### Pattern 5: Data Pipeline Fix

```
1. data-quality-engineer -- Detects data quality issue
2. data-engineering-lead -- Triages severity and root cause
3. data-engineer         -- Fixes pipeline logic
4. test-engineer         -- Adds regression test
5. data-quality-engineer -- Validates fix and monitors
6. metadata-engineer     -- Updates lineage if schema changed
```

### Pattern 6: Sprint Cycle

```
1. ds-project-manager    -- Plans sprint with /sprint-plan new
2. [All agents]          -- Execute assigned tasks
3. ds-project-manager    -- Daily status with /sprint-plan status
4. test-engineer         -- Continuous testing during sprint
5. notebook-specialist   -- Reviews notebooks before merge
6. ds-project-manager    -- Sprint retrospective
7. ds-project-manager    -- Plans next sprint incorporating learnings
```

### Pattern 7: Dashboard Creation

```
1. analytics-director    -- Defines dashboard requirements and audience
2. analytics-lead        -- Specifies metrics and data sources
3. dashboard-designer    -- Designs layout and interactions
4. visualization-designer -- Creates chart specifications
5. bi-developer          -- Implements in BI tool
6. data-analyst          -- Validates data accuracy
7. analytics-lead        -- Reviews and approves
```

### Pattern 8: Team Orchestration (/team-eda, /team-modeling, /team-deploy)

```
/team-eda:
  Orchestrator: analytics-lead
  Agents: data-analyst, data-quality-engineer, visualization-designer,
          notebook-specialist, report-writer

/team-modeling:
  Orchestrator: ml-engineering-lead
  Agents: feature-engineer, ml-engineer, statistician,
          experiment tracker (MLflow), test-engineer

/team-deploy:
  Orchestrator: mlops-lead
  Agents: mlops-engineer, infra-engineer, model-monitor,
          docker-k8s-specialist, security-engineer
```

## Cross-Domain Communication Protocols

### Schema Change Notification

When a data schema changes, the data-engineering-lead must notify:
- ml-engineering-lead (feature pipeline impact)
- analytics-lead (dashboard and report impact)
- data-governance-lead (metadata update needed)
- ds-project-manager (schedule impact assessment)

### Model Update Notification

When a model is retrained or replaced, the mlops-lead must notify:
- model-monitor (monitoring thresholds may need updating)
- analytics-lead (metric definitions may be affected)
- data-product-lead (API consumers need to be informed)
- ds-project-manager (documentation update)

### Data Quality Alert

When data quality degrades, the data-quality-engineer must notify:
- data-engineering-lead (pipeline investigation)
- ml-engineering-lead (model impact assessment)
- analytics-lead (dashboard accuracy)
- ds-project-manager (stakeholder communication)

## Anti-Patterns to Avoid

1. **Bypassing the hierarchy**: A specialist agent should never make decisions
   that belong to their lead without consultation.
2. **Cross-domain implementation**: An agent should never modify files outside
   their designated area without explicit delegation from the relevant owner.
3. **Shadow decisions**: All decisions must be documented. Verbal agreements
   without written records lead to contradictions.
4. **Monolithic tasks**: Every task assigned to an agent should be completable
   in 1-3 days. If it is larger, it must be broken down first.
5. **Assumption-based implementation**: If a spec is ambiguous, the implementer
   must ask the specifier rather than guessing.
6. **Training without baseline**: Never train a complex model without first
   establishing a simple baseline for comparison.
7. **Deploying without monitoring**: Never deploy a model without setting up
   drift detection and performance monitoring.
8. **Raw data mutation**: Never modify files in `data/raw/` — create new
   processed versions in `data/processed/` or `data/interim/`.
