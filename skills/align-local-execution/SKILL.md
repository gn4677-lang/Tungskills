---
name: align-local-execution
description: "Use when local execution evidence may be wrong because of environment drift: CI/local mismatch, Windows/macOS/Linux/Docker differences, runtime paths, env/secrets, shell encoding, UTF-8 BOM/no-BOM, CJK mojibake, or byte-vs-terminal confusion."
---

# Align Local Execution

## Core

Use this when the run path or text evidence may differ between local, CI, OS, shell, or encoded files.

Primary owner: repo-owned execution path and trustworthy local evidence.

Does not own: semantic CJK entity ownership, architecture placement, or product readiness claims.

## Decision Rules

- Prefer the repo-owned command, runtime, and environment over whatever happens to work locally.
- Verify Windows/PowerShell/CMD output when non-ASCII text matters.
- Do not trust terminal rendering for CJK or mojibake; inspect bytes or UTF-8-safe reads before editing.
- Treat encoding cleanup as evidence repair, not permission to rewrite content.
- Env/secrets differences should be named before claiming local/CI parity.
- If a deterministic CJK helper rewrites semantic fields, hand off to `assign-system-boundaries`; that is not an encoding problem.

## Workflow

1. Identify the claimed evidence or command path.
2. Name the environment dimension: OS, shell, runtime, path, env/secrets, CI, Docker, encoding.
3. Verify the repo-owned source of truth: scripts, CI config, lockfile, tool version, bytes, or documented policy.
4. Run or cite the smallest command that proves the local evidence is trustworthy.
5. State the remaining environment gap if parity is not proven.

## Stop Signals

Stop when:

- PowerShell shows `??` or garbled CJK
- local passes but CI uses a different runtime/path
- a tool reads a different `.env` or config than deployment
- output is copied from terminal without byte verification
- encoding policy is inferred from display, not file bytes

## Verification

Before claiming parity or clean text, name:

- command/path used
- runtime/OS/shell
- CI or repo-owned source checked
- encoding evidence when relevant
- remaining gap
