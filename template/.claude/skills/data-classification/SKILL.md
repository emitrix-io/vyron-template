---
name: data-classification
description: Use whenever a new data field, new database column, new log message, or new API response is being designed. Classifies data, enforces handling rules, and maps to ISO 27001 A.5.12 / A.8.10 / A.8.11 controls.
---

# Data Classification and Handling

## Classes
1. **Public** — published on website, no restriction
2. **Internal** — non-sensitive but not for general distribution (architecture docs, runbooks)
3. **Confidential** — business sensitive (customer data, employee records, source code)
4. **Restricted** — regulated (PII, payment data, health records, secrets)

## Hard rules per class
- **Restricted**:
  - Never logged. Log a stable hash or pseudonym instead.
  - Encrypted at rest (DB column-level or transparent disk encryption).
  - Encrypted in transit (TLS 1.3 minimum).
  - Access requires named justification logged for audit.
  - Retention policy explicit; deletion testable (A.8.10).
  - Masked in non-prod environments (A.8.11, A.8.33).
- **Confidential**:
  - Logging allowed only when needed; no sensitive subset (e.g. password, token) ever.
  - Encrypted in transit. At rest by default unless explicitly excepted.
  - Access via role, not individual.
- **Internal/Public**: standard care.

## Required tags
Every new struct/model/schema field annotation must include data class:
- Python (Pydantic): `Field(..., metadata={"data_class": "restricted"})`
- TypeScript: JSDoc `@dataClass restricted`
- Go: struct tag `dataclass:"restricted"`
- Protobuf: option annotation

## Linter integration (planned)
A custom check that fails the build if a "restricted" field appears in:
- Log statements
- HTTP response bodies returning to non-authorized clients
- Error messages
- Test fixtures with real values

Until that lint exists, code reviewers enforce manually using this skill.
