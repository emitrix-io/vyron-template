# ADR-0002: Mandatory verification gate

Status: Accepted
Date: 2026-05-09

## Decision
A single `make verify` command must pass before commit and in CI.
Runs lint + type + test + security checks. Coverage minimum 80%.
