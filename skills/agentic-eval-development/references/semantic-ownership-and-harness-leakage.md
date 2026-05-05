# Semantic Ownership And Harness Leakage

Use this reference when an eval, runner, fixture, verifier, guardrail, or seed dataset may accidentally become the semantic owner for an agentic product decision.

Core principle: eval infrastructure observes and validates product behavior. It must not invent, infer, or overwrite the semantic decision that the agent/model, product rule, or human owner is supposed to make.

## Ownership Split

| Layer | Owns | Does Not Own |
| --- | --- | --- |
| Agent/model | Ambiguous language judgment, user intent, route/action choice, synthesis, explanation, tool-selection reasoning when no deterministic oracle exists. | Persistence legality, schema validity, target existence, exact invariants. |
| Deterministic verifier | Schema checks, bounds, target existence/uniqueness, action legality, accepted evidence, final state invariants. | Missing intent, route, action, mutation disposition, workflow outcome, or subjective meaning. |
| Guardrail | Block, constrain, require approval, or reject unsafe/illegal actions. | Choosing semantic route or fabricating the intended action. |
| Fixture/seed data | Test inputs, candidate evidence, provenance, and known facts for the case. | Product semantics, workflow route, user intent, or whether an action should commit. |
| Runner/harness | Execution, observation, trace capture, deterministic validation, report assembly. | Filling in absent agent decisions or using raw text keywords as product truth. |
| Human/product oracle | Approved deterministic product truth, acceptance standards, labeled decisions, policy. | Hidden assumptions that only exist because a fixture was convenient. |

## Leakage Patterns

| Pattern | Symptom | Safer Shape |
| --- | --- | --- |
| Raw-input oracle | The test maps user text directly to route, intent, action, or mutation outcome. | Require an agent structured decision or product-approved oracle, then validate it. |
| Keyword route oracle | A substring such as `cancel`, `refund`, `book`, or `search` forces a workflow. | Treat keywords as candidates, priors, or negative checks unless product rules define exact routing. |
| Fixture-shaped eval | Test payload fields become the product contract because the runner expects them. | Name product truth first; make fixture fields mirror the product contract, not define it. |
| Seed-data semantic ownership | Seed data labels decide category, action, or disposition without agent/product ownership. | Use seed data as evidence or expected facts; require a decision owner for semantics. |
| Verifier-as-router | Validation code repairs or replaces a semantic decision to make the case pass. | Verifier can accept/reject/constrain; missing or invalid semantics should fail, ask, or require repair. |
| Guardrail-as-semantic-owner | Safety or policy guard starts choosing normal business route/action. | Guard can block or require approval; route/action choice belongs to agent/model or product rule. |
| Self-confirming tests | Agent writes tests that mirror its implementation assumptions, then claims broad correctness. | Review oracle quality, coverage, negative cases, and product-truth alignment before broad claims. |
| Trace as conclusion | Trace existence is treated as proof the decision was correct. | Trace is evidence; evaluate the decision path and outcome against the oracle/rubric. |
| Strict harness overfitting | Architecture is made heavier to pass one runner or weak-model scaffold. | Add holdout cases, model-tier comparison, and product-truth review before hardening the scaffold. |

## Eval Case Shape

Prefer this separation:

```yaml
case:
  raw_input: ...
  decision_source:
    kind: agent_trace | structured_agent_output | human_label | product_oracle
    runner_inferred_semantics: false
  decision_under_test:
    intent_or_route: ...
    action_or_tool_choice: ...
    mutation_or_no_mutation: ...
  deterministic_validation:
    schema_valid: ...
    target_exists: ...
    target_unique: ...
    action_allowed: ...
    evidence_accepted: ...
  expected_state_or_output:
    observable_contract: ...
    state_invariant: ...
negative_checks:
  - runner_does_not_infer_semantics_from_raw_input
  - verifier_does_not_fill_missing_decision
  - guard_does_not_choose_normal_route
  - seed_data_does_not_decide_action
  - tests_do_not_only_assert_implementation_details
```

Avoid this shape:

```yaml
bad:
  raw_input_contains: cancel
  expected_route: cancellation
  expected_action: close_account
```

The bad shape may be valid only if `cancel` has an explicit product-approved deterministic oracle. Otherwise it trains the harness to own intent.

## Stop Conditions

Stop and resolve ownership when:

- the runner derives intent, route, action, mutation disposition, or workflow outcome from raw input text
- a deterministic verifier changes an agent decision instead of rejecting or requesting repair
- a guardrail blocks one class of unsafe action and then chooses the safe business route
- a fixture label or seed row becomes the reason a semantic outcome is correct
- trace existence is used as the conclusion instead of evidence for a conclusion
- green agent-written tests are treated as independent product-truth evidence

## Good Questions

- Who owns the semantic decision: agent/model, deterministic product oracle, human, or hybrid?
- Is the deterministic layer validating an existing decision, or inferring the decision itself?
- Does the eval test agent behavior, runner behavior, final state, or all three mixed together?
- What negative or holdout case would catch fixture leakage or keyword routing?
- Would a stronger model still need this scaffold, or did the eval overfit the runner?
