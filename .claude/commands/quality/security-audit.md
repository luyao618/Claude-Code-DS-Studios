---
name: security-audit
description: "Audits data science code and infrastructure for security issues — credential exposure, PII handling, access control, and compliance."
argument-hint: "[code|infra|data]"
user-invocable: true
allowed-tools: Read, Glob, Grep, Bash
---

# Security Audit

Comprehensive security review for data science projects.

## Checks
- Hardcoded credentials and secrets
- PII in code, notebooks, and data files
- .env files in version control
- Overly permissive file permissions
- Insecure data transfer methods
- Missing encryption
- Access control gaps
