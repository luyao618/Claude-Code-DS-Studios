---
paths:
  - "project/configs/**"
  - "**/*.yaml"
  - "**/*.yml"
  - "**/*.json"
  - "**/*.toml"
---

# Configuration and Parameters Rules

- All hyperparameters MUST be in config files, never hardcoded in code
- Config files MUST have comments explaining each parameter
- Include default values and valid ranges for all parameters
- Sensitive values (credentials, tokens) MUST NOT be in config files — use env vars
- Config files MUST be version controlled (except secrets)
- Use YAML for human-readable configs, JSON for machine-generated configs
- Environment-specific configs: use config overlays (base + env-specific)
- Include a config validation step that runs before any pipeline or training
- Parameters that affect model behavior MUST be logged to experiment tracker
- Config changes MUST be documented in commit messages
