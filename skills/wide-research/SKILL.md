---
name: wide-research
description: "Manual-only. Use only when the current user request contains the exact token $wide-research. Otherwise do not use."
---

# Wide Research

## Core Rule

Use the upstream `grapeot/codex_wide_research` method as the primary workflow.

Activation is manual-only. Wide Research is a heavy fan-out workflow, not the
default way to look up references.

Hard activation gate:

- Use this skill only when the current user request contains the exact token
  `$wide-research`.
- If `$wide-research` is absent, stop using this skill immediately and continue
  with normal search, repo inspection, or ordinary research tools.

Do not activate from intent inference. These are not enough:

- "wide research", "deep research", "research", "reference", "best practice".
- "GitHub examples", "code references", "look this up", "many sources".
- broad corpus, lane manifests, gap maps, or parallel research needs.
- asking whether Wide Research should be used.

Do not use it for:

- ordinary "find references", "check best practice", or "look up examples".
- one repo or a few code references.
- a normal web search with citation links.
- a quick decision that only needs 1-5 strong sources.
- any task that does not include `$wide-research` in the user's current request.

If this skill triggers but the task is only ordinary reference lookup, say that
Wide Research is manual-only and was not explicitly invoked, then continue with
normal search or repo inspection without following the Wide Research workflow.

Before executing a Wide Research run, read:

- `references/wide_research_prompt_en.md`

If the user asks for Chinese workflow wording or the task is primarily Chinese-language, also read:

- `references/wide_research_prompt_cn.md`

Do not replace the upstream prompt with an improvised summary. Treat this `SKILL.md` as the trigger and routing layer; the upstream prompt is the operational playbook.

## Workflow Boundary

Wide Research is for tasks that benefit from breadth and independent subtasks:

- many URLs, people, sources, papers, products, pages, archive records, or local files.
- source acquisition and citation-readiness audits.
- coverage maps, gap analysis, taxonomy building, and corpus triage.
- broad desk research where child outputs can be merged programmatically.

Do not use Wide Research for a single quick lookup, a small direct code edit, or a task where parallel child agents would add coordination overhead.

## Required Pre-Run

Follow the upstream prompt's mandatory reconnaissance step:

1. Personally inspect the task and source surface before delegating.
2. Gather at least one real sample or source reference.
3. Build a provisional manifest or lane map.
4. State the plan, subtasks, outputs, permissions, and evidence gaps.
5. Wait for explicit user approval before launching a long parallel run, unless the user has already clearly said to proceed.

## Execution Preference

Use the current Codex environment first:

- local files and repo scripts.
- built-in web research tools.
- available browser/MCP/connectors.
- `codex exec` child runs when a large fan-out is warranted.

Keep child runs bounded and auditable:

- use a fresh run directory.
- write prompts, logs, child outputs, raw cache, aggregate output, and final polished report.
- use `-c model_reasoning_effort="low"` for child runs by default, as the upstream prompt recommends.
- preserve raw child outputs separately from polished deliverables.
- aggregate with scripts where possible instead of asking one model to remember everything.

## Output Standard

For source acquisition work, produce artifacts rather than only chat summaries:

- source/lane manifest.
- acquisition queue.
- blocked/user-help queue with attempted AI-native methods.
- raw child output cache if parallel children were used.
- polished synthesis or handoff report.

Every final claim must name its evidence boundary: planning artifact, inspected source, child output, local manifest, command result, or explicit not-run status.

## Upstream References

- `references/codex_wide_research_README.md`
- `references/wide_research_prompt_en.md`
- `references/wide_research_prompt_cn.md`
