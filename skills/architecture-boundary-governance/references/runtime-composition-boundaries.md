# Runtime and Composition Boundaries

Use this reference when code placement or refactoring crosses agent runtime, prompt, provider adapter, shared utility, application composition, or bounded-context ownership.

Core rule: composition may wire capabilities together, but it must not become the owner of product truth.

## Ownership Split

| Layer | Owns | Must not own |
| --- | --- | --- |
| Runtime | Agent loop, execution mechanics, message assembly, tool protocol, guards, retries, tracing, streaming, durable run state | Business truth, formulas, mutation legality, domain state transitions, provider quirks |
| Domain / bounded context | Ubiquitous language, business rules, formulas, invariants, state transitions, mutation legality, domain read models | Cross-domain orchestration, provider protocol translation, generic runtime policy |
| Composition / application | Use-case orchestration across multiple bounded contexts, context assembly, route/use-case wiring, dependency graph assembly | Canonical truth, recomputation of domain facts, hidden mutation rules, generic shared utilities |
| Provider / adapter | External API transport, protocol translation, model/provider profile adaptation, auth headers, retryable transport errors | Product semantics, domain policy, prompt business rules, cross-domain orchestration |
| Shared / kernel | Tiny domain-neutral primitives, IDs, clocks, serialization helpers, generic metadata | Convenient business helpers, cross-domain services, app-specific policy |

## Prompt Ownership

Prompts are hybrid ownership, not purely runtime or provider owned.

| Prompt concern | Owner |
| --- | --- |
| Message roles, prompt assembly, context packing, prompt version selection, trace IDs | Runtime |
| Business rules, semantic constraints, workflow boundaries, allowed decisions | Domain or product contract |
| Model-specific formatting, reasoning-model adaptation, token/caching strategy, provider message limitations | Provider/model profile |
| Regression evidence, prompt behavior drift, model upgrade safety | Eval / quality system |

Do not hide business rules inside provider adapters. Do not hide model-specific instructions inside domain logic. Runtime may assemble the prompt, but it should not invent domain truth.

## Composition Layer Rules

Allowed in composition:

- Orchestrate one named use case across multiple bounded contexts.
- Read domain-owned read models or call domain-owned application services.
- Translate route/API input into domain calls and aggregate output DTOs.
- Hold dependency wiring that would otherwise create domain cycles.

Forbidden in composition:

- Recompute domain truth that belongs to a bounded context.
- Decide mutation legality without a domain-owned policy.
- Become a generic `service.py`, `utils.py`, or `everything.py`.
- Contain provider-specific protocol logic.
- Become a permanent home for code whose owner is merely unclear.

Keep composition modules named by use case, not by vague technical role. Prefer `checkout_context.py`, `recommendation_turn.py`, or `billing_reconciliation.py` over `composition_service.py`.

## Placement Decision Table

| Symptom | Prefer |
| --- | --- |
| Needs two or more bounded contexts to answer one use case | Composition / application |
| Owns a formula, invariant, state transition, or legality decision | Domain |
| Operates the agent loop, tool protocol, trace, retry, or run state | Runtime |
| Translates external API/model protocol | Provider / adapter |
| Looks useful everywhere but carries business vocabulary | Domain or composition, not shared |
| Root facade import creates transitive dependency noise | Split facade or add domain-owned read/repository boundary |
| Prompt contains product semantics and model-specific workarounds together | Split domain prompt fragment from model profile adaptation |

## Anti-Patterns

| Anti-pattern | Correction |
| --- | --- |
| `shared` as dumping ground for convenient business helpers | Move to owning domain or use-case composition |
| `composition/service.py` grows many unrelated flows | Split by use case and set file-size guardrails |
| Provider adapter owns product routing or business policy | Move policy to domain/runtime contract; adapter only translates transport |
| Runtime imports domain implementation directly for convenience | Use stable tool/read-model/port contract or composition layer |
| Domain imports another domain implementation to finish a user journey | Move cross-domain flow to composition or introduce an explicit integration contract |
| Prompt rules hidden in model adapter | Split business instruction, runtime assembly, and model profile concerns |

## Refactor Sequence

1. Name the user-visible use case or system capability.
2. Identify the truth owner for each field, decision, and mutation.
3. Classify import violations as real cross-domain coupling, root-facade transitive noise, or acceptable composition wiring.
4. Move only real cross-domain orchestration into composition.
5. Replace domain-to-domain implementation imports with read models, DTOs, ports, events, or application contracts.
6. Keep provider/model adaptation isolated behind profile or transport seams.
7. Add architecture checks only after the intended boundary is represented in code.

## Verification

Use at least one concrete evidence source before claiming boundary safety:

- Dependency graph or import linter.
- Focused tests for the moved use case.
- Use-case trace showing the same truth owner before and after.
- Contract tests for ports, read models, or DTOs.
- Prompt evals when prompt assembly, model profile, or business instruction placement changed.

If the quickest fix only makes the linter green by hiding an import path while preserving the same ownership leak, stop and redesign the boundary.
