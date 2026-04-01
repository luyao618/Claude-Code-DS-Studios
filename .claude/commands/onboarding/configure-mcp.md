---
name: configure-mcp
description: "Configures MCP (Model Context Protocol) server integrations — connects external tools, databases, and services to the Claude Code environment."
argument-hint: "[list|add|remove]"
user-invocable: true
allowed-tools: Read, Glob, Grep, Write, Edit, Bash, AskUserQuestion
---

# MCP Integration Configuration

Configure MCP servers to extend agent capabilities with external tool access.

## Available MCP Integrations

| MCP Server | Capabilities | Use Case |
|-----------|-------------|----------|
| Database | SQL queries, schema inspection | Direct data exploration |
| Cloud Storage | File listing, read/write | Data access |
| Experiment Tracker | MLflow API | Experiment management |
| Monitoring | Metrics, alerts | Model monitoring |
| CI/CD | Pipeline triggers | Deployment automation |

## Workflow

1. List available MCP integrations
2. Help user configure selected integrations
3. Validate connectivity
4. Update project configuration
