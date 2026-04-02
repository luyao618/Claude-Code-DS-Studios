# Claude Code DS Studios

把 Claude Code 变成一个**完整的虚拟数据科学团队** — 62 个 AI 智能体、45 条工作流命令、10 个自动化钩子，完整映射真实 DS/ML 团队的组织架构。

Turn Claude Code into a **complete virtual data science organization** — 62 AI agents, 45 workflow commands, 10 automated hooks, and a full coordination system mirroring real DS/ML team hierarchy.

---

<details open>
<summary><b>🇨🇳 中文文档</b></summary>

## 这是什么？

Claude Code DS Studios 将 Claude Code 变成一整个数据科学部门。62 个专业智能体覆盖 ML 全生命周期：数据工程、特征工程、模型训练、部署上线、监控运维、分析报表、实验设计和数据治理。

这不是一个传统的应用程序——而是一个**元框架**。你把 `.claude/` 目录和 `CLAUDE.md` 复制到自己的数据科学项目中，就能获得完整的 AI 团队协助。

灵感来源于 [Claude-Code-Game-Studios](https://github.com/Claude-Code-Game-Studios)，在其基础上大幅扩展：

| 特性 | Game Studios | DS Studios |
|------|-------------|------------|
| **智能体** | 48 | **62** |
| **斜杠命令** | 37 | **45** |
| **规则文件** | 11 | **15** |
| **自动化钩子** | 8 | **10** |
| **模板** | 28 | **35** |
| **技术栈专家** | 3 | **12** |
| **MCP 集成** | 无 | **原生支持** |
| **Notebook 支持** | 无 | **原生 (NotebookEdit)** |
| **数据血缘** | 无 | **/data-lineage** |
| **实验追踪** | 无 | **/experiment + MLflow** |
| **模型注册表** | 无 | **Model Registry** |
| **团队编排** | 无 | **3 条编排命令** |
| **成本优化** | 无 | **cost-optimizer 智能体** |
| **数据治理** | 无 | **完整框架** |

## 快速开始

```bash
# 1. 克隆仓库（或将 .claude/ 目录复制到你的 DS 项目中）
git clone https://github.com/your-org/Claude-Code-DS-Studios.git
cd Claude-Code-DS-Studios

# 2. 启动 Claude Code
claude

# 3. 运行引导流程
/start
```

`/start` 命令会自动检测你的项目状态并引导设置：

- **全新项目？** 帮你定义范围、选择技术栈、搭建项目骨架
- **已有项目？** 分析现有内容，识别缺失的部分
- **回来继续？** 恢复上次的会话状态，展示下一步

## 智能体层级

```
                            [人类数据科学家]
                                  |
          +--------------+--------+--------+--------------+
          |              |        |        |              |
   首席数据官      ML架构总监  数据工程总监  分析总监     项目经理
  (chief-data-   (ml-arch-   (de-dir)   (analytics-  (ds-pm)
   officer)       dir)                    dir)
          |              |        |        |              |
       (战略)      +---+---+  +--+--+  +---+---+     (协调)
                   |   |   |  |     |  |   |   |
                ML主管 |  NLP DE主管 治理 分析 可视化 实验
                   | CV  |     |     |   |   |    |
                +--+-+ | ++-+ +-+-+ +-+  |  +-+  |
                |  | | | | |  | | | | |  |  | |  |
               [33 个专家 + 12 个技术栈专家]
```

### 第一层 — 总监（5 个，使用 Opus 模型）
战略决策、架构审查、资源分配

### 第二层 — 部门主管（12 个，使用 Sonnet 模型）
领域管理、团队协调、质量标准制定

### 第三层 — 专家（33 个，Sonnet/Haiku 模型）
数据工程、ML、分析、MLOps 等领域的实际执行

### 技术栈专家（12 个，Sonnet 模型）
Python、R、SQL、Spark、dbt、AWS/GCP/Azure 等技术深度专家

## 钩子系统

10 个 Shell 钩子在 Claude Code 生命周期的关键节点自动运行，无需人工干预：

| 钩子 | 触发时机 | 作用 |
|------|---------|------|
| `session-start.sh` | 会话启动 | 加载项目上下文，恢复上次会话状态 |
| `detect-gaps.sh` | 会话启动 | 检测缺失的依赖文件、配置、测试等 |
| `pre-tool-use.sh` | 执行命令前 | 阻止删除原始数据、阻止暴露凭证 |
| `validate-commit.sh` | 执行命令前 | 拦截大文件提交、.env 文件暂存 |
| `validate-push.sh` | 执行命令前 | 阻止 force-push，警告直接推送到 main |
| `post-tool-use.sh` | 写文件后 | 检测硬编码的密码和绝对路径 |
| `notebook-save.sh` | 写文件后 | 保存 Notebook 时检查质量 |
| `pre-compact.sh` | 上下文压缩前 | 保存会话状态，防止信息丢失 |
| `stop.sh` | 会话结束 | 归档状态文件，记录会话日志 |
| `log-agent.sh` | 子智能体启动 | 记录智能体调用审计日志 |

## 斜杠命令

| 类别 | 命令 |
|------|------|
| **入门** | `/start`、`/setup-stack`、`/configure-mcp` |
| **数据** | `/ingest`、`/eda`、`/data-profile`、`/data-quality`、`/data-catalog`、`/schema-design`、`/data-lineage` |
| **特征** | `/feature-engineer`、`/feature-store`、`/feature-select` |
| **建模** | `/train`、`/evaluate`、`/hyperopt`、`/experiment`、`/compare-models`、`/explain`、`/automl` |
| **部署** | `/deploy`、`/serve`、`/monitor`、`/retrain`、`/rollback` |
| **流水线** | `/pipeline`、`/orchestrate`、`/schedule`、`/backfill` |
| **分析** | `/dashboard`、`/report`、`/ab-test`、`/cohort-analysis`、`/forecast` |
| **质量** | `/code-review`、`/notebook-review`、`/sql-review`、`/security-audit` |
| **团队** | `/brainstorm`、`/sprint-plan`、`/team-eda`、`/team-modeling`、`/team-deploy` |
| **元信息** | `/status`、`/help`、`/agent-roster` |

## 核心特性

### 原生 Notebook 支持
智能体可通过 `NotebookEdit` 工具直接创建和编辑 Jupyter Notebook。`/notebook-review` 命令执行 DS 专用的质量检查。

### 实验追踪
`/experiment` 命令集成 MLflow，追踪参数、指标和产物。`experimentation-lead` 智能体协调 A/B 测试和 ML 实验。

### 数据治理
完整的治理框架：`data-governance-lead`、`data-quality-engineer` 和 `metadata-engineer` 三个智能体协同保障数据质量、血缘和合规。

### 会话状态管理
`project/experiments/session-state/active.md` 作为跨会话的持久记忆。钩子自动在上下文压缩前保存状态，会话启动时恢复。对话可能丢失，但文件不会。

### 多云支持
AWS（SageMaker）、GCP（Vertex AI）、Azure（Azure ML）三大云平台的技术栈专家，提供云原生方案同时保持可移植性。

### 成本优化
`cost-optimizer` 智能体监控云平台计算成本，推荐实例调整、Spot 实例和高效查询模式。

## 项目结构

`project/` 目录是标准的数据科学项目模板：

```
project/
├── data/{raw,interim,processed,external,features}/   # 数据（raw 不可变）
├── notebooks/{exploratory,modeling,evaluation,reporting}/   # Notebook
├── src/{data,features,models,pipelines,serving,visualization,utils}/   # 生产代码
├── dbt/{models,seeds,macros,tests}/   # dbt 数据转换
├── dags/                              # Airflow DAG
├── configs/                           # 外部化配置
├── tests/{unit,integration,data}/     # 测试
├── models/                            # 模型产物
├── reports/figures/                   # 报告和图表
├── experiments/                       # 实验记录
└── docker/                            # Docker 配置
```

## 协作协议

**用户驱动，非自主执行。** 每个任务遵循：

```
提问 → 给出选项 → 用户决定 → 出草稿 → 用户批准
```

- 智能体在写文件前必须征求用户许可
- 多文件修改需要整体批准
- 不能自动提交代码
- Notebook 修改需要逐节或逐单元格确认

## 文档

完整文档在 `.claude/docs/`：

| 文件 | 内容 |
|------|------|
| `quick-start.md` | 快速入门指南 |
| `agent-roster.md` | 完整智能体列表 |
| `coordination-map.md` | 委派和工作流模式 |
| `coordination-rules.md` | 5 条核心协调规则 |
| `coding-standards.md` | Python、SQL、Notebook 编码规范 |
| `context-management.md` | 上下文管理与恢复策略 |
| `mcp-integration-guide.md` | MCP 服务器配置 |
| `skills-reference.md` | Skills 技能参考 |
| `stack-guides/` | 各技术栈深度指南 |

## 环境要求

- [Claude Code](https://claude.com/claude-code)（最新版）
- Git
- Python 3.10+（推荐）
- `jq`（钩子依赖 — `brew install jq` / `apt install jq`）

</details>

---

<details>
<summary><b>🇺🇸 English Documentation</b></summary>

## What Is This?

Claude Code DS Studios transforms Claude Code into an entire data science department. 62 specialized agents span the full ML lifecycle: data engineering, feature engineering, model training, deployment, monitoring, analytics, experimentation, and governance.

This is not a traditional application — it's a **meta-framework**. Copy the `.claude/` directory and `CLAUDE.md` into your own data science project to get a fully coordinated AI team.

Inspired by [Claude-Code-Game-Studios](https://github.com/Claude-Code-Game-Studios), expanded significantly:

| Feature | Game Studios | DS Studios |
|---------|-------------|------------|
| **Agents** | 48 | **62** |
| **Slash Commands** | 37 | **45** |
| **Rules** | 11 | **15** |
| **Hooks** | 8 | **10** |
| **Templates** | 28 | **35** |
| **Stack Specialists** | 3 | **12** |
| **MCP Integration** | None | **Native** |
| **Notebook Support** | None | **Native** (NotebookEdit) |
| **Data Lineage** | None | **/data-lineage** |
| **Experiment Tracking** | None | **/experiment + MLflow** |
| **Model Registry** | None | **Model Registry** |
| **Team Orchestration** | None | **3 commands** |
| **Cost Optimization** | None | **cost-optimizer agent** |
| **Data Governance** | None | **Full framework** |

## Quick Start

```bash
# 1. Clone this repo (or copy .claude/ into your DS project)
git clone https://github.com/your-org/Claude-Code-DS-Studios.git
cd Claude-Code-DS-Studios

# 2. Open Claude Code
claude

# 3. Run the onboarding flow
/start
```

The `/start` command detects your project state and guides you through setup:

- **No project yet?** Helps you define scope, choose a stack, and scaffold the project
- **Existing project?** Analyzes what you have and identifies gaps
- **Returning?** Recovers your session state and shows next steps

## Agent Hierarchy

```
                              [Human Data Scientist]
                                       |
            +--------------+-----------+-----------+--------------+
            |              |           |           |              |
    chief-data-officer  ml-arch-dir  de-dir  analytics-dir  ds-pm
            |              |           |           |              |
         (strategy)    +---+---+   +--+--+    +---+---+    (coordination)
                       |   |   |   |     |    |   |   |
                    ml-lead |  nlp de-lead gov ana viz exp
                       |   cv  |     |     |   |   |   |
                    +--+--+ | ++-+ +-+-+ +-+-+ | +-+  |
                    |  |  | | | |  | | | | | | | | |  |
                   [33 Specialists + 12 Stack Experts]
```

### Tier 1 — Directors (5 Opus agents)
Strategic decision-making, architecture review, resource allocation

### Tier 2 — Department Leads (12 Sonnet agents)
Domain ownership, team coordination, quality standards

### Tier 3 — Specialists (33 Sonnet/Haiku agents)
Hands-on implementation across data engineering, ML, analytics, MLOps

### Stack Specialists (12 Sonnet agents)
Deep expertise in specific technologies: Python, R, SQL, Spark, dbt, cloud platforms

## Hook System

10 shell hooks run automatically at key Claude Code lifecycle events:

| Hook | Trigger | Purpose |
|------|---------|---------|
| `session-start.sh` | SessionStart | Load project context, recover previous session |
| `detect-gaps.sh` | SessionStart | Flag missing dependencies, configs, tests |
| `pre-tool-use.sh` | PreToolUse (Bash) | Block raw data deletion, credential exposure |
| `validate-commit.sh` | PreToolUse (Bash) | Catch large files, .env staging, notebook bloat |
| `validate-push.sh` | PreToolUse (Bash) | Block force-push, warn on main branch pushes |
| `post-tool-use.sh` | PostToolUse (Write/Edit) | Detect hardcoded credentials and paths |
| `notebook-save.sh` | PostToolUse (Write/Edit) | Validate notebook quality on save |
| `pre-compact.sh` | PreCompact | Dump session state to survive context compression |
| `stop.sh` | Stop | Archive state file, log session summary |
| `log-agent.sh` | SubagentStart | Audit trail of agent invocations |

## Slash Commands

| Category | Commands |
|----------|----------|
| **Onboarding** | `/start`, `/setup-stack`, `/configure-mcp` |
| **Data** | `/ingest`, `/eda`, `/data-profile`, `/data-quality`, `/data-catalog`, `/schema-design`, `/data-lineage` |
| **Feature** | `/feature-engineer`, `/feature-store`, `/feature-select` |
| **Modeling** | `/train`, `/evaluate`, `/hyperopt`, `/experiment`, `/compare-models`, `/explain`, `/automl` |
| **Deployment** | `/deploy`, `/serve`, `/monitor`, `/retrain`, `/rollback` |
| **Pipeline** | `/pipeline`, `/orchestrate`, `/schedule`, `/backfill` |
| **Analytics** | `/dashboard`, `/report`, `/ab-test`, `/cohort-analysis`, `/forecast` |
| **Quality** | `/code-review`, `/notebook-review`, `/sql-review`, `/security-audit` |
| **Team** | `/brainstorm`, `/sprint-plan`, `/team-eda`, `/team-modeling`, `/team-deploy` |
| **Meta** | `/status`, `/help`, `/agent-roster` |

## Key Features

### Native Notebook Support
Agents create and edit Jupyter notebooks via the `NotebookEdit` tool. `/notebook-review` applies DS-specific quality standards.

### Experiment Tracking
`/experiment` integrates with MLflow for tracking parameters, metrics, and artifacts. `experimentation-lead` coordinates A/B tests and ML experiments.

### Data Governance
A complete framework with `data-governance-lead`, `data-quality-engineer`, and `metadata-engineer` agents ensuring quality, lineage, and compliance.

### Session State Management
`project/experiments/session-state/active.md` serves as persistent memory across compactions and crashes. Hooks auto-save before compression and auto-recover on startup. Conversations are ephemeral; files persist.

### Multi-Cloud Support
Stack specialists for AWS (SageMaker), GCP (Vertex AI), and Azure (Azure ML) provide cloud-native guidance while maintaining portability.

### Cost Optimization
The `cost-optimizer` agent monitors compute costs and recommends right-sizing, spot instances, and efficient query patterns.

## Project Structure

The `project/` directory is a standard data science project template:

```
project/
├── data/{raw,interim,processed,external,features}/   # Data (raw is immutable)
├── notebooks/{exploratory,modeling,evaluation,reporting}/   # Notebooks
├── src/{data,features,models,pipelines,serving,visualization,utils}/   # Production code
├── dbt/{models,seeds,macros,tests}/   # dbt transformations
├── dags/                              # Airflow DAGs
├── configs/                           # Externalized configs
├── tests/{unit,integration,data}/     # Tests
├── models/                            # Model artifacts
├── reports/figures/                   # Reports and charts
├── experiments/                       # Experiment tracking
└── docker/                            # Docker setup
```

## Collaboration Protocol

**User-driven collaboration, not autonomous execution.** Every task follows:

```
Question → Options → Decision → Draft → Approval
```

- Agents MUST ask before writing files
- Multi-file changes require full changeset approval
- No commits without user instruction
- Notebook changes require cell-by-cell or section approval

## Documentation

Full documentation in `.claude/docs/`:

| File | Content |
|------|---------|
| `quick-start.md` | Getting started guide |
| `agent-roster.md` | Complete agent list with roles and tiers |
| `coordination-map.md` | Delegation and workflow patterns |
| `coordination-rules.md` | 5 core coordination rules |
| `coding-standards.md` | Python, SQL, notebook standards |
| `context-management.md` | Context budget and recovery strategies |
| `mcp-integration-guide.md` | MCP server configuration |
| `skills-reference.md` | Skills reference |
| `stack-guides/` | Per-technology deep guides |

## Requirements

- [Claude Code](https://claude.com/claude-code) (latest version)
- Git
- Python 3.10+ (recommended)
- `jq` (for hooks — `brew install jq` / `apt install jq`)

</details>

---

## License

MIT
