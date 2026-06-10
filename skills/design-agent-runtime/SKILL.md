---
name: design-agent-runtime
description: "Use when agent runtime behavior is being designed or changed: memory/context, retrieval/RAG, long-running durability, retries/fallbacks, proactive triggers, control state, prompt assembly, freshness, source evidence, or user-visible degraded behavior."
---

# Design Agent Runtime

## Core

Use this for runtime mechanism design, not for tests or delivery claims.

Primary owner: how an agent stores, retrieves, survives, fails, wakes, and uses context.

Does not own: eval proof, UI design, environment setup, or architecture ownership disputes that should go to `assign-system-boundaries`.

## First Classify The Runtime Mode

Choose one primary mode:

- Context: memory, session state, compaction, identity scope, prompt assembly, stale/cross-user leakage.
- Retrieval: RAG/search, source attribution, evidence spans, freshness, GraphRAG/LightRAG/hybrid choice, relation lookup.
- Durability: retries, crashes, queues, progress files, budget limits, operator handoff, long-running recovery.
- Fallbacks: timeout, rate limit, provider failover, tool failure, degraded mode, false success prevention.
- Proactive: reminders, wake triggers, scheduled work, event triggers, autonomy tier, notification timing, suppression, undo.

If more than two modes apply, pick the mode that owns user-visible truth first.

## Runtime Design Rules

- State that affects behavior must have scope, freshness, provenance, and invalidation rules.
- Retrieval must cite source/evidence ownership; do not let retrieval become semantic truth without an owner.
- Long-running work needs durable progress and recovery before autonomy increases.
- Failure handling must not produce a success message unless the mutation or user-visible action actually succeeded.
- Proactive behavior needs permission, suppression, undo, and false-positive controls.
- Runtime changes that move truth ownership go to `assign-system-boundaries`.

## Mechanism Output

For substantial runtime work, provide:

```text
Runtime mode:
State/evidence owner:
Read path:
Write path:
Failure path:
User-visible behavior:
Verification case:
```

Use prose for small decisions.

## Stop Signals

Stop when:

- memory is injected without scope or freshness
- retrieval evidence is treated as final semantic proof
- retry/fallback hides a failed mutation
- proactive behavior can wake the user without control state
- a runtime packet/report is produced but never consumed

## Verification

Verify through the smallest executable loop: write/read/consume for memory, query/cite/use for retrieval, fail/recover for durability, fail/degrade for fallbacks, trigger/suppress/undo for proactive behavior.
