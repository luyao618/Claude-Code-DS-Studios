# Context Management

Context is the most critical resource in a Claude Code session. Manage it actively.

## File-Backed State (Primary Strategy)

**The file is the memory, not the conversation.** Conversations are ephemeral and
will be compacted or lost. Files on disk persist across compactions and session crashes.

### Session State File

Maintain `experiments/session-state/active.md` as a living checkpoint. Update it
after each significant milestone:

- Dataset loaded and profiled
- Feature engineering decisions made
- Model training completed with metrics
- Pipeline deployed or updated
- Architecture decision recorded

The state file should contain: current task, progress checklist, key decisions
made, files being worked on, and open questions.

### Status Line Block

When the project is in active development, include a structured status block in
`active.md` that the status line script can parse:

```markdown
<!-- STATUS -->
Phase: Modeling
Task: Train gradient boosting classifier
Dataset: customer_churn_v3
<!-- /STATUS -->
```

- All fields are optional — include only what applies
- Update this block when switching focus areas
- The status line displays it as a breadcrumb: `Modeling > GBM Classifier > customer_churn_v3`
- Remove or empty the block when no active work focus exists

After any disruption (compaction, crash, `/clear`), read the state file first.

### Incremental File Writing

When creating multi-section documents (EDA reports, model cards, pipeline docs):

1. Create the file immediately with a skeleton (all section headers, empty bodies)
2. Discuss and draft one section at a time in conversation
3. Write each section to the file as soon as it's approved
4. Update the session state file after each section
5. After writing a section, previous discussion about that section can be safely
   compacted — the decisions are in the file

This keeps the context window holding only the *current* section's discussion
(~3-5k tokens) instead of the entire document's conversation history (~30-50k tokens).

## Proactive Compaction

- **Compact proactively** at ~60-70% context usage, not reactively at the limit
- **Use `/clear`** between unrelated tasks, or after 2+ failed correction attempts
- **Natural compaction points:** after writing a section to file, after committing,
  after completing a task, before starting a new topic
- **Focused compaction:** `/compact Focus on [current task] — EDA complete,
  training in progress with XGBoost`

## Context Budgets by Task Type

- Light (read/review): ~3k tokens startup
- Medium (implement feature/model): ~8k tokens
- Heavy (multi-system refactor/pipeline): ~15k tokens
- Notebook work: ~10k tokens (notebooks consume more context)

## Subagent Delegation

Use subagents for research and exploration to keep the main session clean.
Subagents run in their own context window and return only summaries:

- **Use subagents** when investigating across multiple files, exploring unfamiliar
  datasets, or doing research that would consume >5k tokens of file reads
- **Use direct reads** when you know exactly which 1-2 files to check
- Subagents do not inherit conversation history — provide full context in the prompt

## Notebook Context Tips

Notebooks can consume a lot of context. Strategies:

- Read only the cells you need, not the entire notebook
- For large notebooks, read the markdown headers first to understand structure
- When editing notebooks, use NotebookEdit for targeted cell changes
- Save notebook outputs to separate files for later reference
- Prefer `.py` scripts for production code, notebooks for exploration only

## Compaction Instructions

When context is compacted, preserve the following in the summary:

- Reference to `experiments/session-state/active.md` (read it to recover state)
- List of files modified in this session and their purpose
- Any architectural decisions made and their rationale
- Active sprint tasks and their current status
- Agent invocations and their outcomes (success/failure/blocked)
- Model training results (metrics, parameters, comparisons)
- Unresolved blockers or questions awaiting user input
- The current task and what step we are on
- Which sections of the current document are written to file vs. still in progress

**After compaction:** Read `experiments/session-state/active.md` and any files being
actively worked on to recover full context. The files contain the decisions; the
conversation history is secondary.

## Recovery After Session Crash

If a session dies ("prompt too long") or you start a new session to continue work:

1. The `session-start.sh` hook will detect and preview `active.md` automatically
2. Read the full state file for context
3. Read the partially-completed file(s) listed in the state
4. Continue from the next incomplete section or task
