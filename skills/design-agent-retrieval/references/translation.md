# Translation

Use this file to extract retrieval capabilities instead of jumping straight to RAG.

## Architecture order

1. deterministic state
2. durable memory
3. session state
4. targeted retrieval
5. document-read fallback

## Capability: reliable grounding

- Runtime pattern:
  - hard facts live outside retrieval
- Product capability:
  - the agent answers from trusted current state instead of hallucinating from stale documents
- Surface shape:
  - grounding should read like status or configuration truth, not like a search result
- Keep deterministic:
  - user identity
  - current settings
  - current goals and flags
- Make agentic:
  - how to use those facts in response generation
- Failure mode if missing:
  - RAG is forced to answer questions that should have been state lookups

## Capability: selective recall

- Runtime pattern:
  - retrieval is bounded to explicit source classes
- Product capability:
  - the agent can pull in the right evidence without searching everything
- Surface shape:
  - retrieval should expose source classes and freshness rules clearly enough to debug misses
- Keep deterministic:
  - source classes and access policy
  - maximum result count and freshness policy
- Make agentic:
  - which sources are relevant for the current task
- Failure mode if missing:
  - search feels random, expensive, and low precision

## Capability: mode-aware retrieval

- Runtime pattern:
  - retrieval supports distinct query modes such as local search, global search, and exploratory drift-style search
- Product capability:
  - the agent can choose between precise neighborhood lookup, corpus-wide synthesis, and broader exploratory discovery instead of forcing one search style onto every task
- Surface shape:
  - search mode should be explainable in operator tooling and debuggable from the returned evidence
- Keep deterministic:
  - mode definitions
  - source eligibility
  - escalation order
- Make agentic:
  - which query mode fits the current task and when to escalate to a broader one
- Failure mode if missing:
  - retrieval either misses broad patterns or over-expands simple lookups

## Capability: retrieval-ready indexing

- Runtime pattern:
  - indexing and transformation pipelines are treated as part of retrieval design rather than hidden preprocessing
- Product capability:
  - search quality improves because the system prepares knowledge for the query types it actually needs to support
- Surface shape:
  - indexing state should be inspectable enough that teams can tell whether a miss came from ingestion or search
- Keep deterministic:
  - indexing workflow
  - source-to-index mapping
  - refresh rules
- Make agentic:
  - almost nothing; the agent should consume a well-shaped index rather than invent one at runtime
- Failure mode if missing:
  - prompt tweaks get blamed for failures caused by poor indexing

## Capability: routed retrieval stack

- Runtime pattern:
  - retrieval uses distinct indices, retrievers, query engines, and routers instead of one undifferentiated search step
- Product capability:
  - the system can choose the right retrieval path for the question and keep indexing, fetching, and synthesis responsibilities legible
- Surface shape:
  - operator tooling should show which retrieval path or router decision produced the final evidence
- Keep deterministic:
  - component boundaries
  - router eligibility rules
  - index-to-retriever mapping
- Make agentic:
  - choosing among the available retrieval paths for the current task
- Failure mode if missing:
  - retrieval grows into a tangled black box where misses are hard to localize

## Capability: indexed memory recall

- Runtime pattern:
  - one lightweight index plus per-topic memory files
- Product capability:
  - the agent can cheaply discover what it knows before deciding what to load
- Surface shape:
  - memory lookup should behave like a directory or catalog, not an opaque magic blob
- Keep deterministic:
  - index format
  - indexing rules
- Make agentic:
  - which indexed memories to expand for the current turn
- Failure mode if missing:
  - either every memory is always loaded or memory recall becomes guessy and expensive

## Capability: freshness-aware recall

- Runtime pattern:
  - retrieved memory carries modification-time metadata plus model-friendly age and stale-warning text
- Product capability:
  - the system can treat memory as evidence with age, not timeless truth
- Surface shape:
  - stale evidence should produce visible caution or revalidation behavior, not silent misuse
- Keep deterministic:
  - freshness metadata capture
  - warning thresholds
- Make agentic:
  - when stale memories should be revalidated before acting on them
- Failure mode if missing:
  - outdated memories are treated like current facts

## Capability: fallback document reading

- Runtime pattern:
  - docs are read when targeted retrieval or structured state is not enough
- Product capability:
  - the agent can still handle rare or long-form knowledge tasks without making docs the whole system
- Surface shape:
  - document-read escalation should feel deliberate and auditable rather than the default answer path
- Keep deterministic:
  - allowed doc sources
- Make agentic:
  - when to escalate from state/memory/retrieval to full doc read
- Failure mode if missing:
  - either document overuse or inability to answer long-tail questions
