# MCP Integration Guide

## What is MCP?

Model Context Protocol (MCP) allows Claude Code to connect to external tools
and services through standardized server integrations. DS Studios leverages MCP
to connect agents with databases, experiment trackers, cloud services, and more.

## Available MCP Integrations

### Database Connections

Connect agents directly to data warehouses for SQL exploration:

| MCP Server | Use Case | Configuration |
|-----------|----------|--------------|
| PostgreSQL | Direct SQL queries | Connection string in settings |
| BigQuery | BigQuery access | Service account credentials |
| Snowflake | Snowflake queries | Account + credentials |
| DuckDB | Local analytics | Database file path |

### Cloud Services

| MCP Server | Use Case | Configuration |
|-----------|----------|--------------|
| AWS | S3, SageMaker access | AWS credentials |
| GCP | GCS, Vertex AI access | Service account |
| Azure | ADLS, Azure ML access | Azure credentials |

### Development Tools

| MCP Server | Use Case | Configuration |
|-----------|----------|--------------|
| GitHub | Issue tracking, PRs | GitHub token |
| Linear | Project management | Linear API key |
| Slack | Team communication | Slack token |

## Configuration

MCP servers are configured in `.claude/settings.json` under the `mcpServers` key
or in the user's global Claude Code settings.

Example configuration:
```json
{
  "mcpServers": {
    "database": {
      "command": "mcp-server-postgres",
      "args": ["postgresql://user:pass@host:5432/db"]
    }
  }
}
```

## Agent MCP Usage

Agents can use MCP tools when they are listed in their `tools` field.
The tools become available alongside built-in tools like Read, Write, and Bash.

## Security Considerations

- Never store credentials in the settings.json that's committed to git
- Use environment variables for sensitive connection strings
- Use `.claude/settings.local.json` for personal MCP configurations
- MCP servers should use read-only credentials where possible
- Audit MCP server access in production environments

## Setup with /configure-mcp

Run `/configure-mcp` to interactively set up MCP integrations. The command will:
1. List available MCP server types
2. Help configure connection details
3. Validate connectivity
4. Update settings files
