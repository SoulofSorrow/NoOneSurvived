---
date: 2026-11-25
type: docs
scope: docs, agent tooling
files: [AGENTS.md, CLAUDE.md, .claude/settings.json, .claude/skills/document-change/SKILL.md, docs/README.md, docs/architecture.md, docs/changes/2026-11-25-ai-ready-docs.md, README.md, README.de.md]
breaking: false
---
# Agent-ready documentation and project skills

## Context

- The repository had only READMEs and no instructions for AI coding agents.
- Goal: an agent understands both batch scripts and the repository rules
  without guessing.

## Change

- `AGENTS.md`: project summary, read order, `make` targets, definition of
  done, hard rules, language table, skill list.
- `CLAUDE.md`: imports `AGENTS.md` via `@AGENTS.md`.
- `.claude/settings.json`: allows `make help|info|check-git`; asks before
  `make setup|all|clean|set-git-local|install-hooks` and `git push`; denies
  reading `.env`.
- `.claude/skills/document-change/SKILL.md`: change record template.
- `docs/README.md`: index; `docs/architecture.md`: script flow, variables,
  known limitations.
- `README.md`, `README.de.md`: "Documentation" / "Dokumentation" section.

## Decisions

- Short docs sized to two scripts; no configuration or deployment docs.
- Only the `document-change` skill: no other recurring multi-step task exists.
- No script changed.

## Usage / Verification

```bash
python3 -m json.tool .claude/settings.json
ls AGENTS.md CLAUDE.md docs .claude/skills
```

## Follow-ups

- Missing standard files: `.editorconfig`, `CHANGELOG.md`, `CONTRIBUTING.md`,
  `.pre-commit-config.yaml`, `.gitignore` (the `Makefile` generates
  `.editorconfig` and `.gitignore` but they are not committed); `Makefile` has
  no build/test/tag targets. `LICENSE` exists as `LICENSE.md`.
- `README.md` says a Steam Web API key is required, but `SteamWebAPIKey` is
  not used by any command (SteamCMD logs in anonymously).
- No error handling in `nos-updatescript.bat`; date parsing is
  locale-dependent.
- `README.md` German badge links to GitHub, the repository lives on Gitea.
- `Makefile` `info` target prints emojis.
