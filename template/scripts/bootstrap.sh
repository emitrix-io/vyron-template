#!/usr/bin/env bash
set -euo pipefail
echo "→ Installing pre-commit hooks..."
pre-commit install
echo "→ Run 'make install' next, then 'make verify'."
