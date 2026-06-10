# Tungskills

Personal Codex skill collection for reusable engineering governance, agent runtime architecture, UI/product review, agentic capability proof, local execution alignment, application abuse review, and manual wide research.

The goal is to make Codex behave more like a careful senior engineer across projects: clear ownership boundaries, evidence-backed claims, right-sized next slices, runtime-aware agent design, fresh UI/product judgment, and safer verification before delivery claims.

## Design Model

Tungskills uses a small action-skill model:

- skill names are actions or judgment protocols, not project names
- `description` is trigger-focused and should not summarize the full workflow
- `SKILL.md` starts with the smallest useful decision frame
- each skill states ownership boundaries so it does not absorb adjacent jobs
- each skill includes stop signals and verification expectations
- heavy references stay out of core skills unless they are needed at runtime

The intended flow is: recognize the task class, load the matching skill, make the ownership/verification decision, and hand off to the next tool or implementation workflow only when needed.

## Naming Contract

Skill names are treated as stable command names. Rename only when the current name blocks discovery or points agents toward the wrong behavior. A good Tungskills name should:

- start with a verb or action phrase
- describe the decision or protocol, not a project or incident
- stay generic across repositories
- be searchable from natural user phrases and neighboring skill handoffs
- avoid promising automation that the skill body cannot perform

Long names are acceptable only when they buy important trigger behavior. The current collection prefers short names because the old skill pool was intentionally compressed.

## Contents

This repository contains 8 custom skills under `skills/`.

### Engineering And Runtime

- `assign-system-boundaries` - ownership boundaries across modules, APIs, data, runtime, LLM/deterministic truth, validators, guards, and repair loops.
- `choose-next-slice` - next-work selection when proposal fixation, fake progress, over-engineering, blockers, or wrong-layer work may derail product capability.
- `design-agent-runtime` - agent runtime design for memory/context, retrieval, durability, fallbacks, proactive triggers, prompt assembly, freshness, and source evidence.
- `align-local-execution` - local execution evidence alignment for CI/local drift, OS/runtime/env mismatch, Windows encoding, UTF-8 BOM/no-BOM, CJK mojibake, and byte-vs-terminal confusion.

### Product Proof And Review

- `prove-agentic-capability` - EDD, golden sets, fake-pass diagnosis, trace replay, browser evaluator loops, holdouts, pre-live gates, stale evidence, activation stages, and delivery-readiness claims.
- `raise-product-ui-quality` - UI/UX and product-surface critique for AI-slop, hierarchy, card sprawl, product proof, text rhythm/wrapping, meaningful motion, feedback animation, and interaction friction.
- `application-abuse-review` - defensive product/business-logic abuse review for workflow abuse, tenant/action misuse, prompt/tool/memory/RAG abuse, and user-visible trust boundary risk.

### Manual Research

- `wide-research` - manual-only wide research helper. It must only activate when the user includes the exact token `$wide-research`.

## What This Repo Does Not Include

This repo intentionally does not include:

- local Codex config, sessions, logs, or secrets
- system skills or generated runtime files
- plugin cache skills
- third-party skill packs
- project-specific repo instructions such as `AGENTS.md`

Third-party or generated skills should be managed from their own source repos, installers, or plugin systems, not vendored into this collection. `wide-research` is included because this repo carries the local manual-only trigger wrapper and metadata used by this Codex setup.

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
python -X utf8 C:\Users\User\.codex\skills\.system\skill-creator\scripts\quick_validate.py C:\Users\User\.codex\skills\assign-system-boundaries
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
- every skill has a clear owner, stop signals, and verification guidance
- no legacy pre-compression Tungskills names remain in `skills/`
- `wide-research` stays manual-only and does not trigger from generic research/reference requests

## Sync Boundary

When syncing from a local machine into this repo, use an explicit skill whitelist. Do not mirror the entire `.codex/skills` directory, because it may contain generated, plugin, system, or third-party skills that do not belong in this collection.
