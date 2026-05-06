---
name: development-environment-parity
description: Use when diagnosing or designing reproducible development environments across Windows, macOS, Linux, Docker, Dev Containers, Docker Compose, Docker Desktop WSL2, "Virtualization support not detected", Docker CLI without daemon, Python versions, virtualenv/venv, dependency install, PATH/toolchain setup, .env secrets, local vs CI parity, or moving Codex/project setup to another machine. Route encoding or terminal mojibake to windows-cjk-text-integrity.
---

# Development Environment Parity

## Overview

Use this to diagnose whether a project can be reproduced across machines without turning local setup drift into product changes.

Core principle: the authoritative runtime, local convenience path, and CI/merge authority must be named separately.

## Read First

Read `references/cross-machine-environment-patterns.md` when setup differs across Windows/macOS/Linux, Docker or Dev Containers are present, Python/venv/toolchain versions disagree, `.env` or secrets are involved, or local pass conflicts with CI.

## Default Output

```text
target_machine: ...
authoritative_runtime: ...
setup_path: ...
local_vs_ci_parity: ...
required_tools: ...
dependency_source: ...
env_and_secret_boundary: ...
encoding_or_line_ending_risk: ...
verification_command: ...
blockers: ...
claim_boundary: ...
handoff_skills: ...
decision: proceed | narrow | stop
```

## Decision Rules

1. Prefer repo-owned setup paths before inventing commands: `README`, `AGENTS.md`, `.devcontainer`, `compose.yaml`, `Dockerfile`, `.env.example`, lock/dependency files, and verify scripts.
2. Separate "works locally" from "authoritative for CI, merge, deploy, or readiness".
3. Do not change product behavior, prompts, schemas, tests, or runtime contracts just to satisfy an old Python, missing local tool, or one-machine setup issue.
4. Never ask the user to paste secret values. Inspect secret names, `.env.example`, readiness checks, and missing-variable errors instead.
5. Treat terminal mojibake, BOM/no-BOM questions, CSV garbling, and byte-level text integrity as `windows-cjk-text-integrity`.
6. Separate Docker CLI / Compose availability from Docker daemon availability. Require `docker info` before claiming container parity or selecting a Compose runtime.
7. For Docker Desktop `Virtualization support not detected`, diagnose machine virtualization first: WSL2 status, Windows optional features, hypervisor boot config, restart state, then BIOS/UEFI SVM or VT-x / SLAT exposure.
8. Use `delivery-pipeline-governance` when the environment issue changes CI/CD gates, workflow permissions, deployment, or merge claims.
9. Use `evidence-claim-integrity` before saying an environment is ready, parity is proven, or setup is complete.

## Heuristics

| If you see | Prefer |
| --- | --- |
| Windows -> Mac setup drift | Look for Docker, Dev Container, Compose, or documented native fallback. |
| Docker CLI without daemon | Treat as no container parity; use Python 3.12 fallback only if repo policy allows it. |
| Docker Desktop says `Virtualization support not detected` | Check WSL2, `VirtualMachinePlatform`, `HypervisorPlatform`, `hypervisorlaunchtype Auto`, restart need, then BIOS/UEFI `SVM Mode` or VT-x. |
| Local Python differs from CI Python | Use CI/runtime version as authority unless repo says otherwise. |
| `.env` missing or placeholders remain | Report missing secret names only; do not request values in chat. |
| Local pass but CI fail | Narrow the claim; compare runtime, OS, dependency source, and command scope. |
| Terminal shows broken CJK | Verify bytes or route to `windows-cjk-text-integrity`. |

## Stop Signals

Stop or narrow when:

- a local setup workaround changes product behavior, prompts, schemas, runtime contracts, or CI authority
- local pass is used to claim CI, merge, deploy, or cross-machine readiness
- secret values are requested in chat instead of checking names, examples, or readiness diagnostics
- terminal mojibake or line-ending display is treated as file corruption without byte evidence

## Verification

Before finalizing, name the evidence: setup docs, devcontainer config, Compose file, Dockerfile, dependency file, Python version, `gh`/CI output, verify script result, `.env.example`, byte/line-ending check, or explicit not-run status.
