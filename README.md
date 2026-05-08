# Tungskills

Personal Codex skill collection for reusable engineering governance, agent runtime architecture, eval design, UI/UX review, environment parity, and Windows/CJK text integrity.

The goal is to make Codex behave more like a careful senior engineer across projects: clear boundaries, narrow claims, explicit evidence, small mergeable slices, readable code, and safer agent-runtime decisions.

## Design Model

Tungskills uses an action-protocol model inspired by Superpowers:

- skill names are actions, not domains
- `description` is trigger-only and should not summarize the workflow
- `SKILL.md` starts with the smallest executable protocol
- each skill has `Default Output`, `Stop Signals`, and `Verification`
- heavy framework notes, examples, and rubrics stay in `references/`

The intended flow is: recognize the task action, load the matching skill, run the protocol, produce the output contract, and hand off instead of answering from a loose checklist.

## Contents

This repository contains 21 custom skills under `skills/`.

### Agent Runtime Architecture

- `route-agent-runtime-design` - umbrella router for runtime skill selection.
- `design-agent-context` - memory, context continuity, scope, checkpoint vs memory.
- `design-agent-retrieval` - search, RAG, source routing, retrieval boundaries.
- `design-agent-durability` - background work, crash recovery, job lifecycle, durable execution.
- `design-proactive-agents` - reminders, wake triggers, autonomy tiers, proactive behavior.
- `design-agent-fallbacks` - retry, failover, degraded mode, trace/eval loops for failures.
- `reduce-agent-friction` - interaction friction, progress cues, correction paths.
- `gate-agent-activation` - fake/live/shadow/canary/user-facing/mutation rollout gates.

### Agentic Eval And LLM Boundaries

- `design-agentic-evals` - eval-driven agent development, traces, graders, harness design.
- `assign-decision-ownership` - deciding whether LLM, deterministic code, guard, or verifier owns a decision.

### Engineering Governance

- `check-architecture-boundaries` - ownership, public API, dependency direction, runtime/data boundaries.
- `sequence-capability-work` - capability order, domain slicing, PRD/issue slicing.
- `review-code-excellence` - readable code, DSA fit, hot-path efficiency, unnecessary abstraction, no-behavior refactor safety.
- `gate-delivery-readiness` - CI/CD, merge gates, private/free GitHub limits, PR debt, merge queue fallback.
- `align-development-environments` - Windows/macOS/Linux setup parity, devcontainers, Python/venv, local vs CI.
- `challenge-slice-direction` - contrarian preflight for next-slice direction, mainline/detour, why-now, and smallest-safe-scope decisions.
- `narrow-evidence-claims` - prevents overbroad done/ready/all-green/merge-safe/code-clean claims.

### Security

- `red-team-application-security` - authorized AppSec and red-team workflow for web apps, APIs, auth, storage, agentic surfaces, and post-fix regression.

### Product And Interface Review

- `define-uiux-intent` - user-facing UI/UX intent, interaction behavior, visual direction.
- `review-rendered-uiux` - rendered UI/UX QA, screenshots, accessibility, responsive checks.

### Windows / Encoding

- `verify-windows-cjk-text` - CJK mojibake, UTF-8/BOM policy, PowerShell/CP950 output safety.

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
python -X utf8 C:\Users\User\.codex\skills\.system\skill-creator\scripts\quick_validate.py C:\Users\User\.codex\skills\verify-windows-cjk-text
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

Acceptance checks for this repo:

- all `SKILL.md` files validate with `quick_validate.py`
- all `SKILL.md` files start with `---` and have no BOM
- every skill includes `Action Protocol`, `Default Output`, `Stop Signals`, and `Verification`
- no legacy noun-style Tungskills names remain in references or handoffs
- pressure tests cover positive triggers and near-miss routing for direction, delivery, evidence, runtime, UI, security, environment, and code-quality workflows

## Sync Boundary

When syncing from a local machine into this repo, use an explicit skill whitelist. Do not mirror the entire `.codex/skills` directory, because it may contain generated, plugin, system, or third-party skills that do not belong in this collection.
