# Interface and Deep Module Patterns

Use this reference when architecture work needs module/API interface options, deep-module review, deletion tests, or codebase-level architecture improvement. It adapts selected Matt Pocock patterns without replacing this skill's boundary language.

## Source Mapping

- `design-an-interface`: generate multiple radically different module/API interface designs before choosing one.
- `improve-codebase-architecture`: find deepening opportunities informed by domain language and ADRs.

## Routing Boundary

`Interface` can mean two different things:

- User-facing UI or interaction surface: route to `define-uiux-intent`.
- Module/API/type/method/caller contract: stay in architecture boundary work and use this reference.

Do not mix the two in one answer unless the user is explicitly designing both product UI and code API.

## Design-It-Twice for Module Interfaces

Use this when the user asks for API shape, module interface, public contract, type shape, hook signature, or "design it twice".

Before proposing options, gather:

- module responsibility
- callers and consumers
- key operations
- invariants and error modes
- compatibility or performance constraints
- what should be hidden versus exposed

Generate at least three meaningfully different interface shapes:

- minimal method surface
- flexible/general-purpose surface
- common-case optimized surface

For each option, show:

- interface signature or method/type shape
- caller usage example
- complexity hidden inside the module
- trade-offs

Compare in prose on simplicity, depth, ease of correct use, ease of misuse, implementation efficiency, and future change cost. Do not implement during this step.

## Deep Module Review

A deep module gives callers a small stable interface while hiding substantial behavior. A shallow module exposes nearly as much complexity as it contains.

Use these checks:

- Deletion test: if deleting the module only moves complexity to callers, it was earning its keep; if complexity vanishes, it may be pass-through.
- Interface as test surface: tests should exercise external behavior and invariants, not incidental internals.
- Two real consumers before introducing a broad seam or adapter.
- Prefer locality: keep change, bugs, and knowledge concentrated behind the interface that owns them.
- Use project domain language for names; do not let technical helper names replace business concepts.

## Architecture Review Output

When exploring codebase architecture, return candidates instead of a patch:

- files or modules involved
- problem causing friction
- plain-English solution direction
- benefits for locality, leverage, and testability
- evidence from code, tests, dependency graph, or ADRs
- whether an ADR conflict is material enough to reopen

Ask which candidate to explore before proposing detailed interfaces or implementation steps.

## Failure Modes

- Do not use this for rendered UI design or visual interaction choices.
- Do not propose interfaces before naming the module responsibility and callers.
- Do not create abstractions from hypothetical variability.
- Do not list every theoretical ADR conflict; surface only conflicts tied to real friction.
- Do not let "deep module" become permission for large, opaque modules without a small stable interface.
