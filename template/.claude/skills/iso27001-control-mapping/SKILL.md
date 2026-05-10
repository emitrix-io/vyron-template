---
name: iso27001-control-mapping
description: Use whenever a feature, change, or design decision touches authn/authz, logging, data handling, encryption, access control, change management, or anything else that maps to an ISO 27001 Annex A control. Helps tag PRs, ADRs, and code with the relevant control IDs and update the SoA.
---

# ISO 27001 Control Mapping

## When to invoke
- Designing a new feature → identify which Annex A controls it implements or affects
- Writing an ADR → tag it with control IDs
- Code review → flag missing control coverage (e.g. an authn endpoint with no logging = A.8.15 gap)
- Quarterly review → diff implementation against `docs/compliance/soa/iso27001-2022.md`

## Hard rules
1. Every PR description must include `Affects controls: A.8.x, A.5.y` if any apply.
2. Every ADR must include a "Controls" section listing relevant Annex A IDs.
3. New authn/authz code MUST log auth decisions (A.8.15) and apply least privilege (A.8.2).
4. New data-handling code MUST identify the data classification (A.5.12) and apply matching controls.

## Common control mappings (quick reference)
- New login/auth feature → A.5.16, A.8.5, A.8.15
- New data field with PII → A.5.12, A.5.34, A.8.10, A.8.11
- New external API integration → A.5.19, A.5.23, A.8.21
- New cron job / scheduled task → A.8.16, A.8.32
- New environment variable / secret → A.8.12, A.8.24
- New microservice → A.8.22, A.8.27, A.8.31
- Change to access roles/permissions → A.8.2, A.8.3
- Logging change → A.8.15, A.8.16

## Output format when invoked
Produce a checklist:
- [ ] Control IDs identified
- [ ] SoA entries updated (or confirmed already covered)
- [ ] Evidence path written under `docs/compliance/evidence/`
- [ ] PR description updated
