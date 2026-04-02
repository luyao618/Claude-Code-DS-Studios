# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## What This Repo Is

A **meta-framework**, not a traditional codebase. There is no application to build, test, or run.
This repo provides 62 Claude Code subagent definitions, 45 slash commands, and 10 hooks that
together form a virtual data science organization. Users clone/copy the `.claude/` directory
into their own DS project to get coordinated AI assistance across the full ML lifecycle.

**First session?** Run `/start` — it detects project state and guides onboarding.

## Architecture Overview

```
CLAUDE.md (this file — master config, loaded automatically)
  ├── @.claude/docs/directory-structure.md    # project/ layout conventions
  ├── @.claude/docs/coordination-rules.md     # agent delegation & conflict rules
  ├── @.claude/docs/coding-standards.md       # Python, SQL, notebook, pipeline standards
  ├── @.claude/docs/context-management.md     # session state, compaction, recovery
  └── @.claude/docs/agent-roster.md           # all 62 agents with tiers & domains
```

The `@` includes above are the canonical references. The sections below provide
the cross-cutting architectural knowledge that requires reading multiple files.

## How the Agent System Works

**3-tier hierarchy** — Director (Opus) → Lead (Sonnet) → Specialist (Sonnet/Haiku):

- **5 Directors** make strategic decisions (chief-data-officer, ml-architecture-director, etc.)
- **12 Leads** own domains and coordinate teams
- **45 Specialists + Stack Experts** do hands-on implementation

**Delegation flows downward.** Directors delegate to leads, leads to specialists.
Never skip a tier for implementation tasks. Horizontal consultation between same-tier
agents is allowed but binding decisions stay within each agent's domain.

**Agent definitions** live in `.claude/agents/*.md`. Each file is a standalone prompt
with YAML frontmatter (`name`, `model`, `tools`, `maxTurns`) and role instructions.

## Hook System

Hooks in `.claude/settings.json` run automatically at lifecycle events. They enforce
guardrails and maintain state without agent intervention:

| Hook | Trigger | Purpose |
|------|---------|---------|
| `session-start.sh` | SessionStart | Load branch/data/model context, recover `active.md` |
| `detect-gaps.sh` | SessionStart | Flag missing requirements, stack config, tests, model cards |
| `pre-tool-use.sh` | PreToolUse (Bash) | Block raw data deletion, credential exposure |
| `validate-commit.sh` | PreToolUse (Bash) | Catch large files, .env staging, notebook bloat |
| `validate-push.sh` | PreToolUse (Bash) | Block force-push, warn on main branch pushes |
| `post-tool-use.sh` | PostToolUse (Write/Edit) | Detect hardcoded credentials and paths |
| `notebook-save.sh` | PostToolUse (Write/Edit) | Validate notebook quality on save |
| `pre-compact.sh` | PreCompact | Dump session state to survive context compression |
| `stop.sh` | Stop | Archive `active.md`, log session summary |
| `log-agent.sh` | SubagentStart | Audit trail of agent invocations |

All hooks require `jq` for JSON parsing (falls back to regex without it).

## Session State & Recovery

The file `project/experiments/session-state/active.md` is the **primary memory** across
compactions and crashes. The conversation is ephemeral; the file persists.

- Hooks auto-save state before compaction and auto-recover it on session start
- After any disruption: read `active.md` first, then read files listed in it
- Session logs accumulate in `project/experiments/session-logs/`

The status line (`.claude/statusline.sh`) reads a `<!-- STATUS -->` block from `active.md`
to show phase/task/dataset as a breadcrumb in the Claude Code UI.

## Slash Commands

Commands live in `.claude/commands/<category>/<name>.md`. Key workflows:

| Start Here | Data Work | Modeling | Production |
|-----------|-----------|----------|------------|
| `/start` | `/ingest` | `/train` | `/deploy` |
| `/setup-stack` | `/eda` | `/evaluate` | `/serve` |
| `/configure-mcp` | `/data-quality` | `/hyperopt` | `/monitor` |
| | `/data-catalog` | `/experiment` | `/pipeline` |
| | `/feature-engineer` | `/compare-models` | `/retrain` |

Team orchestration: `/team-eda`, `/team-modeling`, `/team-deploy` coordinate
multiple agents for end-to-end workflows.

## Collaboration Protocol

**User-driven collaboration, not autonomous execution.**
Every task follows: **Question → Options → Decision → Draft → Approval**

- Agents MUST ask "May I write this to [filepath]?" before using Write/Edit tools
- Agents MUST show drafts or summaries before requesting approval
- Multi-file changes require explicit approval for the full changeset
- No commits without user instruction
- Notebooks require explicit cell-by-cell or section approval

## Key Data Conventions

- `project/data/raw/` is **immutable** — hooks block deletion of raw data
- Write transformations to `data/interim/` or `data/processed/`
- Feature store lives in `data/features/` with versioned feature sets
- Production code goes in `project/src/`, notebooks are for exploration only
- All configs externalized to `project/configs/` (no hardcoded paths or magic numbers)
- Model artifacts in `project/models/` with model cards

## Requirements

- Claude Code (latest), Git, Python 3.10+, `jq` (for hooks)
- Stack not yet chosen: Cloud and warehouse are configured per-project via `/setup-stack`

## Included References

@.claude/docs/directory-structure.md

@.claude/docs/coordination-rules.md

@.claude/docs/coding-standards.md

@.claude/docs/context-management.md

@.claude/docs/agent-roster.md
