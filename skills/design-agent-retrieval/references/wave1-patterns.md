# Wave 1 Patterns

Use this file to strengthen retrieval beyond the current two-source baseline.

## `graphrag-main.zip`

- Confidence:
  - `doc-confirmed`
- Keep:
  - retrieval as an indexed query engine over transformed knowledge
  - indexing workflows as part of retrieval design
  - local search, global search, and DRIFT search as distinct query modes
- Use it to answer:
  - when one retrieval mode is not enough
  - how to separate neighborhood lookup, corpus-wide synthesis, and exploratory search
  - why indexing architecture matters as much as prompt architecture
- Do not overstate:
  - framework-specific pipeline details unless rechecked from source

## `mem0-main.zip`

- Confidence:
  - `doc-confirmed`
- Keep:
  - memory search as a named product surface
  - history and feedback as retrieval-adjacent quality signals
  - organization and project memory scopes as explicit source classes
- Use it to answer:
  - how search over memory should expose scopes and inspectable results
  - when memory search should stay separate from deterministic current state

## Boundary reminder

- `design-agent-retrieval` now owns:
  - query-mode choice
  - indexing and source-class design
  - search-versus-doc-read escalation
- It still does not own:
  - active-session identity routing
  - background memory maintenance
  - provider failover or eval loops
