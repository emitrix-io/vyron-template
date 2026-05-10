# Threat Model

## Method
STRIDE per component, reviewed quarterly and on architectural changes.

## Trust boundaries
- External clients ↔ API gateway
- Service ↔ Service (mTLS required)
- Service ↔ Database (network-isolated)
- Developer machines ↔ CI ↔ Production

## Top risks
1. Secret leakage — pre-commit + CI scans
2. Dependency supply chain — SCA, pinned versions, signed releases
3. Authn/authz bypass — central auth, contract tests
4. SQL injection — ORM-only, banned raw SQL
5. SSRF/RCE — allow-lists, sandboxing, output encoding
