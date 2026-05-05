# Tungskills

Personal Codex skill collection for reusable engineering governance, agent runtime architecture, eval design, UI/UX review, environment parity, and Windows/CJK text integrity.

The goal is to make Codex behave more like a careful senior engineer across projects: clear boundaries, narrow claims, explicit evidence, small mergeable slices, readable code, and safer agent-runtime decisions.

## Contents

This repository contains 19 custom skills under `skills/`.

### Agent Runtime Architecture

- `agent-runtime-architecture` - umbrella router for runtime skill selection.
- `agent-context-architecture` - memory, context continuity, scope, checkpoint vs memory.
- `agent-retrieval-architecture` - search, RAG, source routing, retrieval boundaries.
- `agent-durability-ops` - background work, crash recovery, job lifecycle, durable execution.
- `agent-proactive-architecture` - reminders, wake triggers, autonomy tiers, proactive behavior.
- `agent-fallback-eval` - retry, failover, degraded mode, trace/eval loops for failures.
- `agent-frictionless-design` - interaction friction, progress cues, correction paths.
- `agent-runtime-activation-ladder` - fake/live/shadow/canary/user-facing/mutation rollout gates.

### Agentic Eval And LLM Boundaries

- `agentic-eval-development` - eval-driven agent development, traces, graders, harness design.
- `llm-deterministic-boundary` - deciding whether LLM, deterministic code, guard, or verifier owns a decision.

### Engineering Governance

- `architecture-boundary-governance` - ownership, public API, dependency direction, runtime/data boundaries.
- `capability-dependency-build-order` - capability order, domain slicing, PRD/issue slicing.
- `code-excellence-dsa-hygiene` - readable code, DSA fit, hot-path efficiency, unnecessary abstraction, no-behavior refactor safety.
- `delivery-pipeline-governance` - CI/CD, merge gates, private/free GitHub limits, PR debt, merge queue fallback.
- `development-environment-parity` - Windows/macOS/Linux setup parity, devcontainers, Python/venv, local vs CI.
- `evidence-claim-integrity` - prevents overbroad done/ready/all-green/merge-safe/code-clean claims.

### Product And Interface Review

- `uiux-intent-designer` - user-facing UI/UX intent, interaction behavior, visual direction.
- `uiux-objective-review` - rendered UI/UX QA, screenshots, accessibility, responsive checks.

### Windows / Encoding

- `windows-cjk-text-integrity` - CJK mojibake, UTF-8/BOM policy, PowerShell/CP950 output safety.

## What This Repo Does Not Include

This repo intentionally does not include:

- local Codex config, sessions, logs, or secrets
- system skills or generated runtime files
- plugin cache skills
- third-party skill packs
- project-specific repo instructions such as `AGENTS.md`

Third-party or generated skills should be managed from their own source repos, installers, or plugin systems, not vendored into this collection.

## Install

Clone this repo, then run the installer for your machine.

Windows PowerShell:

```powershell
.\scripts\install-windows.ps1
```

macOS/Linux:

```bash
./scripts/install-macos.sh
```

Both scripts copy `skills/*` into `${CODEX_HOME}/skills` when `CODEX_HOME` is set, otherwise into the default Codex home:

- Windows: `%USERPROFILE%\.codex\skills`
- macOS/Linux: `$HOME/.codex/skills`

The installer replaces same-named target skill folders. It does not modify Codex config or install plugins.

## Updating From This Repo

To update another machine:

```bash
git pull
./scripts/install-macos.sh
```

or on Windows:

```powershell
git pull
.\scripts\install-windows.ps1
```

Restarting Codex is usually the cleanest way to ensure updated skill descriptions are rediscovered.

## Validation

Validate a skill with the Codex skill creator validator:

```powershell
python -X utf8 C:\Users\User\.codex\skills\.system\skill-creator\scripts\quick_validate.py C:\Users\User\.codex\skills\windows-cjk-text-integrity
```

For all skills in a local checkout, run:

```powershell
Get-ChildItem .\skills -Directory | ForEach-Object {
  python -X utf8 C:\Users\User\.codex\skills\.system\skill-creator\scripts\quick_validate.py $_.FullName
}
```

Encoding policy:

- `SKILL.md` should start with `---` and should not have a BOM.
- Reference markdown may use UTF-8 with BOM for Windows-heavy markdown workflows.
- Do not add a BOM to `SKILL.md` just to satisfy a locale-bound validator.

## Sync Boundary

When syncing from a local machine into this repo, use an explicit skill whitelist. Do not mirror the entire `.codex/skills` directory, because it may contain generated, plugin, system, or third-party skills that do not belong in this collection.
