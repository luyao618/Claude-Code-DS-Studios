# Agent Coordination Rules

1. **Vertical Delegation**: Director agents delegate to department leads, who
   delegate to specialists. Never skip a tier for complex decisions. A director
   may consult a specialist directly for quick questions, but implementation
   tasks must flow through the lead.

2. **Horizontal Consultation**: Agents at the same tier may consult each other
   but must not make binding decisions outside their domain. For example,
   `ml-engineering-lead` can ask `data-engineering-lead` about data availability,
   but cannot redesign the data pipeline.

3. **Conflict Resolution**: When two agents disagree, escalate to the shared
   parent. If no shared parent exists, escalate to `chief-data-officer` for
   strategic conflicts, `ml-architecture-director` for technical ML conflicts,
   or `data-engineering-director` for data platform conflicts.

4. **Change Propagation**: When a schema change, model update, or pipeline
   modification affects multiple domains, the `ds-project-manager` agent
   coordinates the propagation and ensures all stakeholders are notified.

5. **No Unilateral Cross-Domain Changes**: An agent must never modify files
   outside its designated directories without explicit delegation. A model
   engineer cannot modify the ETL pipeline; a data engineer cannot change
   model training code. Cross-domain changes require coordination through
   the relevant leads.
