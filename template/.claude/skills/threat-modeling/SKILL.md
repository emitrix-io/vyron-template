---
name: threat-modeling
description: Use when designing a new service, adding a trust boundary, integrating an external system, or before any architecturally significant change. Produces a STRIDE-based threat model with mitigations mapped to Annex A controls.
---

# STRIDE Threat Modeling

## When required
- New service or microservice
- New trust boundary (auth domain, network segment, data classification level)
- New external integration (API, file upload, OAuth provider)
- Changes to authn/authz logic
- Changes to data flows crossing trust boundaries

## Method (STRIDE per element)
For each component, asset, or data flow, ask:
- **S** Spoofing — can an attacker impersonate?
- **T** Tampering — can an attacker modify in transit or at rest?
- **R** Repudiation — can an actor deny their action?
- **I** Information disclosure — can data leak?
- **D** Denial of service — can the system be made unavailable?
- **E** Elevation of privilege — can a low-priv actor gain high-priv?

## Output goes in docs/architecture/<feature>-threat-model.md
Format:
Threat Model — <feature>
In scope
[Components and data flows this model covers]
Trust boundaries
[List each boundary and its trust delta]
Threats and mitigations
IDThreatSTRIDEMitigationControlResidual riskT1Stolen JWT replaySShort TTL + refresh + JTI revocationA.8.5LowT2SQL injection in searchTParameterized queries, input validationA.8.28, A.8.29LowT3Audit log tamperingRAppend-only ledger, signed recordsA.8.15, A.5.33Low

## Hard rules
1. Every new trust boundary requires a threat model linked from the ADR.
2. Each threat must have either a mitigation OR an explicit "accepted risk" with sign-off.
3. Threats with residual risk = High require explicit approval recorded in ADR.
