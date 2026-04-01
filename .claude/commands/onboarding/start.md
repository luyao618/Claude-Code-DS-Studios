---
name: start
description: "First-time onboarding — asks where you are, then guides you to the right workflow. No assumptions."
argument-hint: "[no arguments]"
user-invocable: true
allowed-tools: Read, Glob, Grep, AskUserQuestion
---

# Guided Onboarding

This command is the entry point for new users. It does NOT assume you have a
project, a stack preference, or any prior experience. It asks first, then routes
you to the right workflow.

---

## Workflow

### 1. Detect Project State (Silent)

Before asking anything, silently gather context so you can tailor your guidance.
Do NOT show these results unprompted — they inform your recommendations, not
the conversation opener.

Check:
- **Data exists?** Check for files in `project/data/raw/` and `project/data/processed/`.
- **Notebooks exist?** Glob for `project/notebooks/**/*.ipynb`.
- **Source code exists?** Glob for Python files in `project/src/`.
- **Models exist?** Check for files in `project/models/`.
- **Configs exist?** Check for files in `project/configs/`.
- **dbt project?** Check for `project/dbt/dbt_project.yml`.
- **Docker setup?** Check for Dockerfiles in `project/docker/`.
- **Experiments?** Check for MLflow or experiment tracking artifacts.

Store these findings internally.

---

### 2. Ask Where the User Is

This is the first thing the user sees. Present these 4 options clearly:

> **Welcome to Claude Code DS Studios!**
>
> Before I suggest anything, I'd like to understand where you're starting from.
> Where are you at with your data science project?
>
> **A) Starting from scratch** — I don't have a project yet. I need to define
> the problem, choose tools, and set up the environment.
>
> **B) Have data, need analysis** — I have data and want to explore it,
> build models, or create dashboards.
>
> **C) Have a model, need to productionize** — I have a working model and
> need to deploy it, monitor it, and build a pipeline around it.
>
> **D) Existing project** — I have an existing DS project and want help
> organizing, improving, or extending it.

Wait for the user's answer. Do not proceed until they respond.

---

### 3. Route Based on Answer

#### If A: Starting from scratch

1. Acknowledge that starting from zero is fine
2. Ask about the business problem and data availability
3. Recommend the setup path:
   - `/setup-stack` — configure Python, cloud, warehouse
   - `/brainstorm` — scope the problem with chief-data-officer
   - `/ingest` — set up data ingestion
   - `/eda` — explore the data
   - `/sprint-plan` — plan the first sprint

#### If B: Have data, need analysis

1. Ask about the data (format, size, location) and the goal (EDA, modeling, dashboards)
2. Recommend the analysis path:
   - `/setup-stack` — if stack not configured
   - `/eda` — exploratory data analysis
   - `/data-quality` — assess data quality
   - `/train` — if building models
   - `/dashboard` — if building dashboards

#### If C: Have a model, need to productionize

1. Ask about the model (framework, serving requirements, scale)
2. Recommend the deployment path:
   - `/setup-stack` — ensure MLOps tooling configured
   - `/deploy` — containerize and deploy
   - `/monitor` — set up drift detection
   - `/pipeline` — automate the workflow

#### If D: Existing project

1. Share what you found in Step 1 (now it's relevant)
2. Ask what they need help with
3. Recommend based on gaps:
   - `/code-review` or `/notebook-review` — quality check
   - `/data-quality` — assess data quality
   - `/sprint-plan` — organize work

---

### 4. Confirm Before Proceeding

After presenting the recommended path, ask the user which step they'd like
to take first. Never auto-run the next command.

---

### 5. Hand Off

When the user chooses their next step, let them invoke the command themselves
or offer to run it for them. The `/start` command's job is done once the user
has a clear next action.

---

## Collaborative Protocol

1. **Ask first** — never assume the user's state or intent
2. **Present options** — give clear paths, not mandates
3. **User decides** — they pick the direction
4. **No auto-execution** — recommend the next command, don't run it without asking
5. **Adapt** — if the user's situation doesn't fit a template, listen and adjust
