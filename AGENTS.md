# AGENTS.md

Instructions for AI coding agents working in this repository. Tool-agnostic;
`CLAUDE.md` imports this file.

## Project

Two Windows batch scripts for a "No One Survived" dedicated game server:

| File | Purpose |
| --- | --- |
| `nos-startscript.bat` | Starts `WRSHServer.exe` and restarts it when the process disappears |
| `nos-updatescript.bat` | Backs up save games and config, updates the server with SteamCMD, restores the config |

Plus a repository setup `Makefile` and bilingual READMEs. License GPL-3.0
(`LICENSE.md`).

## Read first

| Area | Doc |
| --- | --- |
| Index | `docs/README.md` |
| Script flow, variables, paths | `docs/architecture.md` |
| User documentation | `README.md` (English), `README.de.md` (German) |

## Commands

There is no build, lint or test command. The scripts only run on Windows
(`cmd.exe`) against a real server installation.

| Command | Effect |
| --- | --- |
| `make help` | List targets |
| `make info` | Show which setup files exist |
| `make check-git` | Show current vs. expected git identity |
| `make setup` | Writes `.editorconfig`, `.gitignore`, `.dockerignore` and a `.git/hooks/pre-commit` identity check |
| `make set-git-local` | Sets repo-local `user.name` / `user.email` |
| `make clean` | Deletes `.editorconfig`, `.gitignore`, `.dockerignore`, the pre-commit hook |

## Definition of done

- Script changes keep both READMEs in sync (`README.md`, `README.de.md`),
  including the configuration variable lists.
- `docs/architecture.md` updated when variables, paths or flow change.
- New file `docs/changes/YYYY-MM-DD-<slug>.md` (template in
  `.claude/skills/document-change/SKILL.md`), listed in `docs/README.md`.

## Hard rules

- Keep the batch files Windows `cmd.exe` compatible; do not convert them to
  PowerShell or shell without a request.
- `SteamWebAPIKey` in `nos-updatescript.bat` stays empty in the repository.
  Never commit a key.
- The update script must back up save games and `game.ini` /
  `gameusersettings.ini` before running SteamCMD and restore the config
  after it. Do not reorder these steps.
- Do not run `make setup`, `make clean` or `make set-git-local` unless the
  user asks: they write or delete files and change git config.
- No emojis in scripts or docs.

## Language

| Artifact | Language |
| --- | --- |
| Scripts, comments, `README.md`, `docs/`, `AGENTS.md`, commit messages | English |
| `README.de.md`, `Makefile` messages | German |

## Project skills

Located in `.claude/skills/<name>/SKILL.md`.

| Skill | Use for |
| --- | --- |
| `document-change` | Writing the `docs/changes/` record |
