# Security Policy

## Reporting
Email: <SECURITY_CONTACT>. Do not file public issues for security bugs.
Acknowledgment within 48 hours; triage within 7 days.

## Supported versions
Latest minor of `main` only.

## Controls in this repository
- Pre-commit: AgentShield, detect-secrets, gitleaks, language-specific lint+security rules
- CI: SAST (Semgrep), SCA (Trivy), CodeQL, dependency review, secrets scan
- Branch protection: required reviews, signed commits, linear history
- Access: least-privilege via CODEOWNERS

## Threat model
See `docs/security/threat-model.md`.
