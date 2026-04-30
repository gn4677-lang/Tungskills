# Repo Intake Rubric

Use this file before promoting any new runtime repo into the skill set.

## Confidence classes

- `code-confirmed`
  - verified from targeted source reads in the repo itself
- `doc-confirmed`
  - verified from official repo docs, README, or maintained architecture references
- `example-confirmed`
  - shown mainly in demos, examples, or notebooks; useful as weak evidence only
- `marketing-only / discard`
  - landing-page framing without enough implementation or architectural backing

Only `code-confirmed` and `doc-confirmed` patterns should enter skill references by default.
`example-confirmed` patterns may appear in coverage notes or cautions, but should not be the main authority for a skill.

## Extraction template

For each repo, capture:

- repo thesis
- strongest runtime layers
- strongest candidate skill mappings
- confidence level
- what is genuinely new versus `cc-haha-main` and `openclaw-main`
- what should be rejected as duplicate, too weak, or too framework-specific

## Ownership test

Before adding a pattern, confirm:

1. the pattern maps to one primary skill owner
2. it improves that skill more than the existing anchor sources do
3. it does not collapse two skill boundaries together
4. it can be stated without overstating repo-wide guarantees

## Wave policy

- Wave 1:
  - `openai-agents-python-main.zip`
  - `langfuse-main.zip`
  - `letta-main.zip`
  - `graphrag-main.zip`
  - `mem0-main.zip`
- Wave 2:
  - `pydantic-ai-main.zip`
  - `llama_index-main.zip`
- Wave 3 / mostly optional:
  - `langgraph-main.zip`
  - `smolagents-main.zip`
  - `dify-main.zip`
  - `claw-code-main.zip`

Use Wave 1 to strengthen `agent-retrieval-architecture`, `agent-fallback-eval`, `agent-runtime-architecture`, and `agent-durability-ops` first.

## Rejection bar

Reject or demote a repo when:

- the useful pattern is already covered materially better elsewhere
- the claim depends mostly on examples or notebooks
- the repo is strong as a platform or workflow product but weak as a runtime source-of-truth
- the repo teaches a framework-specific API habit rather than a reusable runtime pattern
