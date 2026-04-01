---
name: agent-roster
description: "Displays the full agent roster with tiers, roles, and when to use each agent. Helps pick the right agent for a task."
argument-hint: "[tier|department|search-term]"
user-invocable: true
allowed-tools: Read, Glob, Grep
---

# Agent Roster

Display the agent roster to help pick the right agent for a task.

## Usage
- `/agent-roster` — Show all 62 agents organized by tier
- `/agent-roster tier1` — Show only directors
- `/agent-roster ml` — Search for ML-related agents
- `/agent-roster data` — Search for data-related agents

## How to Choose an Agent

Ask: "What role would handle this in a real data science team?"

Read the full roster at `.claude/docs/agent-roster.md` for detailed descriptions
of each agent's capabilities, responsibilities, and when to use them.
