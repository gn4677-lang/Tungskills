# Code Excellence Rubric

Use this reference to review AI-assisted code without turning review into subjective taste policing.

## Source Basis

- Andrej Karpathy's Software 3.0 / agentic engineering framing: programmers increasingly orchestrate agents that perform larger macro-actions, so setup, context, review, and evaluation become first-class engineering work.
- Karpathy-inspired guardrail projects distill common LLM coding pitfalls into four reusable norms: think before coding, simplicity first, surgical changes, and goal-driven execution.
- Google Engineering Practices: code review should improve overall code health over time, and reviewers should examine design, functionality, complexity, tests, naming, comments, style, and documentation.
- Google Small CL guidance: small changes are easier to review, less risky to merge, and easier to roll back.
- Python PEP 20: readability and simplicity matter; simple is preferred over complex, and complex is preferred over complicated.
- Python profiling docs: performance work should use profiling or equivalent measurement rather than intuition alone.

## Review Order

1. Behavior boundary: is this no-behavior refactor, behavior change, or unclear?
2. Human readability: can a new maintainer name the purpose of each function/module quickly?
3. Algorithm/data shape: are the chosen data structures aligned with the actual lookup, scan, grouping, and update patterns?
4. Hot-path evidence: is this on a request path, loop, batch, DB path, provider call, file scan, or startup path?
5. Abstraction value: does each abstraction hide real complexity or merely rename pass-through behavior?
6. Verification: does the evidence prove behavior, complexity, and performance claims at the right scope?

## AI Code Failure Patterns

| Failure pattern | Symptom | Review response |
| --- | --- | --- |
| Wrong assumptions | Code silently chooses intent, data shape, or edge behavior | Ask for explicit assumption, product rule, or test. |
| Over-complication | Many classes/helpers/config paths for one caller | Simplify to the current variation; wait for a real second consumer. |
| Orthogonal damage | Unrelated formatting, comments, imports, or APIs change | Require surgical diff or split cleanup PR. |
| Unvalidated execution | Agent says done without proving result | Require targeted command, artifact, or reviewer-inspected evidence. |
| Sloppy performance | Full scans, repeated parsing, repeated I/O, repeated DB reads | Measure or bound cost, then index/cache/batch/pool. |
| Shallow abstraction | Wrapper exposes almost the same complexity as the wrapped code | Delete or fold into a deeper owner module. |

## DSA Hygiene

Use DSA review for code where scale or repeated execution matters:

- request/response paths
- search, retrieval, routing, ranking
- DB reads/writes and query composition
- file/artifact scans
- batch processors and ETL
- provider/client loops
- cache/index construction
- deduplication, grouping, joins, graph walks

Ask:

```text
Input size: ...
Dominant operation: scan | lookup | sort | join | graph walk | parse | I/O | network | DB
Current data structure: ...
Better data structure, if any: ...
Time complexity: ...
Space complexity: ...
Why this matters at expected scale: ...
```

Do not require Big-O prose for ordinary glue code unless it is confusing or on a hot path.

## Hot-Path Evidence

Acceptable evidence includes:

- profiler output (`cProfile`, sampling profiler, flamegraph, trace)
- query count or query plan
- benchmark before/after
- operation count from a bounded fixture
- latency or memory measurement
- log or trace showing repeated I/O/client construction

If no measurement exists, allowed claim:

```text
This looks like a potential hot-path issue; optimization is not proven until measured.
```

Forbidden claim:

```text
This is faster / optimized / efficient.
```

## Abstraction Test

Keep an abstraction when it:

- hides change-prone complexity behind a stable interface
- has multiple real consumers or a strong boundary need
- gives callers a smaller vocabulary
- centralizes an invariant that would otherwise duplicate
- improves testability without hiding product truth

Delete or inline an abstraction when it:

- has one caller and no real variability
- only forwards arguments
- creates a second vocabulary for the same concept
- hides a simple operation behind a generic framework
- makes debugging require more jumps without reducing caller complexity

## PR Slicing

Prefer this order:

1. Baseline/gate PR: lint, complexity report, fat-file report, dependency check, benchmark harness, no product behavior change.
2. Targeted refactor PR: one responsibility boundary, tests prove behavior unchanged.
3. Hot-path optimization PR: before/after evidence, limited scope, rollback path.
4. Architecture migration PR: only after contracts, tests, and ownership are clear.

Avoid PRs that combine feature work, broad formatting, refactor, performance, and behavior changes.

## Reviewer Comments

Good review comments should name:

- the specific readability, DSA, abstraction, or hot-path problem
- why it matters for future maintainers or runtime cost
- whether it blocks merge or is a nit
- the smallest acceptable fix

Example:

```text
Important: This builds a list and scans it for every lookup in the request path. The caller needs key-based access, so a dict built once at load time would reduce repeated O(n) scans. Please either add an operation-count test or keep the current structure and mark it non-hot-path with evidence.
```
