# Domain Language and Product Slicing Patterns

Use this reference when capability build order depends on shared domain language, PRD shape, or issue slicing. It adapts selected patterns from Matt Pocock's engineering skills without importing those skills wholesale.

## Source Mapping

- `ubiquitous-language`: extract domain terms, ambiguous language, canonical terms, aliases to avoid, relationships, and example dialogue.
- `grill-with-docs`: challenge a plan against `CONTEXT.md`, context maps, and ADRs; resolve terminology as decisions crystallize.
- `to-prd`: synthesize current context into a product requirement without stale file paths or code snippets.
- `to-issues`: split an approved plan or PRD into vertical tracer-bullet issues, with HITL/AFK labels and dependency order.

## Domain Language Rules

- Read existing `CONTEXT.md`, `CONTEXT-MAP.md`, `UBIQUITOUS_LANGUAGE.md`, and nearby `docs/adr/` before inventing new terms.
- Use glossary terms for business capabilities and bounded contexts.
- Flag overloaded words explicitly. Example: if `account` can mean `Customer` or `User`, ask or recommend the canonical split.
- Prefer one canonical term and list aliases to avoid.
- Include only domain-expert terms. Skip generic programming words unless they have a project-specific meaning.
- Do not rewrite a whole context document for a small terminology update. Propose a section-level patch.

## PRD Guardrails

- Synthesize from existing conversation and repo context before asking new questions.
- State unresolved assumptions separately instead of hiding them in requirements.
- Use domain glossary vocabulary and respect ADRs in the affected area.
- Include problem, solution, user stories, implementation decisions, testing decisions, out of scope, and notes when a PRD is requested.
- Do not include brittle file paths, code snippets, or implementation details likely to become stale.
- Do not publish to an issue tracker without explicit user approval.

## Vertical Issue Slicing

Use issue slicing only after there is an approved plan, spec, or PRD.

Each slice should:

- deliver a thin complete path through the relevant layers
- be demoable or independently verifiable
- include acceptance criteria
- identify blockers
- identify whether it is `HITL` or `AFK`
- use domain language from the glossary

`HITL` means the slice requires human interaction, such as a design review, architecture decision, product call, or approval. `AFK` means the slice can be implemented and verified without human interaction once accepted.

Prefer many thin slices over a few thick slices. Do not publish issues until the user approves the slice list and dependency order.

## Output Shapes

For terminology work, return:

- candidate canonical terms
- ambiguity or conflict list
- aliases to avoid
- glossary patch target
- ADR note if the terminology decision is hard to reverse, surprising, and trade-off driven

For PRD or issue slicing, return:

- source context used
- unresolved assumptions
- vertical slices with HITL/AFK labels
- dependency order
- acceptance criteria
- publish approval boundary

## Failure Modes

- Do not turn this skill into a general interview flow; use `superpowers:brainstorming` for broad design alignment.
- Do not turn implementation plans into issue tickets without preserving capability dependency order.
- Do not let issue tracker workflow override the user's approval gate.
- Do not create a separate PRD pipeline skill unless dry-run validation shows this owner cannot reliably handle the workflow.
