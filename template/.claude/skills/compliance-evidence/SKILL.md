---
name: compliance-evidence
description: Use when an auditor or compliance lead needs evidence that a control is implemented. Generates the kind of artifact auditors expect: dated, traceable, signed-off records linking control IDs to code, configs, and decisions.
---

# Compliance Evidence Generation

## Evidence types and where they live
- **Configuration evidence**: snapshot the relevant repo config (e.g. branch protection JSON), commit, and link from `docs/compliance/evidence/<control>.md`.
- **Process evidence**: link to ADRs, PR templates, runbooks demonstrating the process is followed.
- **Operational evidence**: query CI logs, audit logs, or monitoring exports; redact and store.
- **Test evidence**: link to passing test suites that verify control behavior.

## Hard rules
1. Evidence files are dated and signed off (Git commit + author serves as signature).
2. Never include real secrets, real PII, or real customer data in evidence files. Use redacted samples.
3. One evidence file per control, named `A-X-Y.md`. Updated, not replaced.

## Output template
Evidence — A.8.8 Management of technical vulnerabilities
Last verified: 2026-05-10
Verified by: <name> (commit <sha>)
Control summary
[Restate the control in plain language.]
Implementation

Tooling: Dependabot, Trivy, CodeQL, Semgrep
Configuration: .github/workflows/verify.yml lines 60–95
Cadence: weekly Dependabot PRs; per-PR Trivy/CodeQL scans

Evidence

Dependabot config: .github/dependabot.yml
CI workflow: verify.yml
Latest scan results: [link to GH Actions run]
Sample finding handled: PR #123, fixed CVE-2025-XXXXX in 4 days
