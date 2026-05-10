# ADR-0001: Polyglot monorepo with strict per-package language boundaries

Status: Accepted
Date: 2026-05-09

## Decision
- Single git repository.
- One language per `apps/*` or `libs/*` package.
- Each language has its own toolchain manifest and lockfile.
- Workspace orchestrates via `make` targets.

## Consequences
+ Atomic changes across services; unified CI and security policy.
- CI matrix grows with languages; mitigated by language detection.
