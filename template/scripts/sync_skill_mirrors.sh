#!/usr/bin/env bash
set -euo pipefail
cd "$(dirname "$0")/.."

mkdir -p .cursor/rules

for skill_dir in .claude/skills/*/; do
  name=$(basename "$skill_dir")
  if [ -f "$skill_dir/SKILL.md" ]; then
    cp "$skill_dir/SKILL.md" ".cursor/rules/${name}.md"
  fi
done

cp CLAUDE.md .cursor/rules/00-operating-rules.md
cp CLAUDE.md AGENTS.md     # not symlink — Windows-safe
echo "✓ Mirrors synced"
