# Wave 2 Patterns

Use this file only when runtime quality depends on stable public contracts, not just retries and traces.

## `pydantic-ai-main.zip`

- Confidence:
  - `doc-confirmed`
- Keep:
  - minimize accidental public surface expansion
  - preserve backward compatibility through aliases and keyword-only evolution
  - distinguish stable interfaces from internal implementation detail
- Use it to answer:
  - what run-state, error, or trace fields should be treated as stable contracts
  - how reliability surfaces can evolve without breaking operators and integrators
- Do not use it to answer:
  - provider failover strategy
  - retrieval design
  - memory architecture
