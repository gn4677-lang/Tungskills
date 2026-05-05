---
name: windows-cjk-text-integrity
description: Use when Windows text encoding, CJK mojibake, 亂碼, 中文變問號, 中文顯示壞掉, Markdown/YAML frontmatter, UTF-8 BOM/no-BOM policy, PowerShell output, CP950, UnicodeEncodeError, charmap encode, stdout encoding, console code page, PowerShell cannot print Unicode, ASCII escape, JSON-safe output, CSV/Excel garbling, JSON/YAML parsing, or terminal-rendered corruption may affect file integrity. Use when Codex encounters suspicious garbled text mid-task; terminal rendering is not byte evidence.
---

# Windows CJK Text Integrity

## Overview

Use this before editing or diagnosing text that may be misread by Windows tools, terminals, parsers, or agents.

Core principle: terminal rendering is not encoding evidence; bytes and consumers decide.

## Default Output

Keep the answer compact:

```text
Surface: ...
Encoding evidence: byte-level | tool-rendered | unknown
BOM policy: preserve | add | remove | forbid | inspect first
Risk: mojibake | parser break | terminal rendering issue | data loss
Minimum check: ...
Decision: proceed | inspect bytes | stop
```

## Decision Rules

1. Inspect bytes before changing content when corruption is suspected.
2. Treat PowerShell `Get-Content`, `type`, console output, and copied terminal text as rendering evidence only.
3. Preserve existing encoding unless byte evidence and a real consumer compatibility need justify changing it.
4. Do not apply a universal BOM rule. UTF-8 BOM is optional and can help old Windows consumers detect UTF-8, but it can break parsers or tools that treat it as content.
5. Prefer UTF-8 without BOM for code, JSON, YAML, and parser-sensitive files unless the repo or tool explicitly requires BOM.
6. Consider UTF-8 with BOM for Windows PowerShell 5.1 scripts, Excel-oriented CSV, or Windows-heavy Markdown workflows only when the consumer needs an encoding signature.
7. If YAML frontmatter, JSON parse, shebang, or strict headers are involved, treat BOM as parser risk until proven safe.
8. When stdout or a terminal cannot encode Unicode, switch to byte-level checks, ASCII-safe JSON summaries, or UTF-8 artifacts; do not infer file corruption from the stdout failure.
9. For machine-readable evidence in Windows-heavy sessions, prefer `ensure_ascii=True` for stdout summaries and write full Unicode content to a UTF-8 artifact.

## Heuristics

| If you see | Prefer |
| --- | --- |
| Chinese/Japanese/Korean looks garbled only in terminal | Classify as terminal rendering issue until byte check fails. |
| Markdown appears corrupted after `Get-Content` | Verify bytes and editor decoding before editing. |
| CSV opens garbled in Excel | Consider UTF-8 BOM or Excel import settings. |
| JSON/YAML parser fails at first character | Check for BOM or invisible prefix. |
| PowerShell 5.1 misreads non-ASCII script text | Consider UTF-8 with BOM or run under PowerShell 7+. |
| `print(..., ensure_ascii=False)` fails under CP950 stdout | Print an ASCII-safe summary with `ensure_ascii=True`, or write UTF-8 output to a file and print only the artifact path. |
| `UnicodeEncodeError` or `charmap` appears while printing | Treat as console/stdout encoding failure until byte evidence proves file corruption. |

## Verification

Before claiming text is fixed, name the evidence: byte prefix, decoder result, parser result, repo encoding check, editor encoding, or consumer roundtrip.
