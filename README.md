# Tungskills

Personal Codex skill collection for agent architecture, evals, UI/UX, CJK text integrity, and engineering workflow guardrails.

## Contents

This repository contains 18 custom skills under `skills/`:

- `agent-context-architecture`
- `agent-durability-ops`
- `agent-fallback-eval`
- `agent-frictionless-design`
- `agentic-eval-development`
- `agent-proactive-architecture`
- `agent-retrieval-architecture`
- `agent-runtime-activation-ladder`
- `agent-runtime-architecture`
- `architecture-boundary-governance`
- `capability-dependency-build-order`
- `delivery-pipeline-governance`
- `development-environment-parity`
- `evidence-claim-integrity`
- `llm-deterministic-boundary`
- `uiux-intent-designer`
- `uiux-objective-review`
- `windows-cjk-text-integrity`

This repo intentionally does not include local Codex config, sessions, logs, plugins, plugin caches, Superpowers, or `.system` skills.

## Install

Clone this repo, then run one of:

```powershell
.\scripts\install-windows.ps1
```

```bash
./scripts/install-macos.sh
```

Both scripts copy `skills/*` into `${CODEX_HOME}/skills` when `CODEX_HOME` is set, otherwise into the default Codex home:

- Windows: `%USERPROFILE%\.codex\skills`
- macOS/Linux: `$HOME/.codex/skills`

## Validation

On Windows, validate skills that contain Chinese text with Python UTF-8 mode:

```powershell
$env:PYTHONUTF8='1'
python C:\Users\User\.codex\skills\.system\skill-creator\scripts\quick_validate.py C:\Users\User\.codex\skills\windows-cjk-text-integrity
```

or:

```powershell
python -X utf8 C:\Users\User\.codex\skills\.system\skill-creator\scripts\quick_validate.py C:\Users\User\.codex\skills\windows-cjk-text-integrity
```

Do not add a BOM to `SKILL.md` just to satisfy a locale-bound validator. `SKILL.md` should start with `---`.
