# Access Control Policy

Owner: Security lead
Last review: <date>

## Principle
Least privilege, need-to-know, periodically reviewed.

## Provisioning
- New hires receive default access on first day per role template
- Privileged access requires named approval and is logged

## Review
- Quarterly access review by line managers (A.5.18)
- Inactive accounts disabled after 90 days

## Deprovisioning
- All access revoked within 24 hours of termination (A.5.11)
- Shared credentials rotated within 24 hours

## Technical controls
- Repository access via GitHub teams; CODEOWNERS for code review gating
- Branch protection: required reviews, signed commits, linear history
- Production access via short-lived tokens / SSO; no long-lived passwords
- MFA required for all accounts (A.5.17, A.8.5)

## Related controls
A.5.15, A.5.16, A.5.17, A.5.18, A.8.2, A.8.3
