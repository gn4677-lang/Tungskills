# Attack Family Catalog

Choose one primary family first. If you start with four families at once, probe design, evidence quality, and remediation routing all get sloppy.

## Authentication and session failures

- Trigger symptoms:
  - account takeover concern
  - weak login or MFA flow
  - reset/recovery loopholes
  - cookie, token, or CSRF confusion
- Evidence expectations:
  - auth flow diagram
  - session/token handling trace
  - request/response capture
  - code path for token issuance/validation if available
- Typical containment:
  - tighten auth checks
  - rotate or scope tokens
  - add CSRF/session controls
  - reduce overly broad session authority

## Authorization failures: IDOR, BOLA, BOPLA, function-level auth

- Trigger symptoms:
  - object IDs from one user can touch another user's data
  - hidden fields or API properties can be overwritten
  - internal/admin functions are reachable from lower-privilege callers
- Evidence expectations:
  - before/after request pair
  - object/property/function authorization trace
  - role and policy mapping
- Typical containment:
  - enforce object/property/function checks server-side
  - remove trust in client role claims
  - constrain exposed fields and methods

## Browser/client trust failures

- Trigger symptoms:
  - rendered content may execute attacker-controlled input
  - redirects, DOM logic, or client-only controls carry security assumptions
- Evidence expectations:
  - rendered surface
  - request/response pair
  - output encoding or template path
  - CSP or client trust assumptions
- Typical containment:
  - proper output encoding
  - server-side validation
  - tighter redirect and CSP policy
  - removal of security assumptions from client-only logic

## Server/API input handling failures

- Trigger symptoms:
  - input reaches query, path, parser, command, URL fetch, or deserializer unsafely
  - server may be tricked into outbound access
- Evidence expectations:
  - request/response pair
  - source-to-sink path
  - parser or outbound-call trace
- Typical containment:
  - parameterization
  - strict validation/allowlisting
  - safer path handling
  - SSRF/network egress controls

## Business-logic abuse and resource consumption

- Trigger symptoms:
  - valid features can be abused in the wrong order or volume
  - no obvious injection bug exists, but the workflow is unsafe
- Evidence expectations:
  - state transition or quota model
  - timing/order of operations
  - abuse path that stays within nominal product features
- Typical containment:
  - server-side invariants
  - stronger approval gates
  - per-user or per-action limits
  - clearer state machine boundaries

## File upload and storage boundary failures

- Trigger symptoms:
  - upload type confusion
  - public bucket or listing exposure
  - stored content becomes executable or overexposed
- Evidence expectations:
  - upload path and access path
  - bucket/object ACL or policy
  - content-type and processing path
- Typical containment:
  - stricter upload validation
  - private-by-default storage
  - signed access paths
  - safer media processing isolation

## Data access and database policy failures

- Trigger symptoms:
  - database or API exposure does not match least privilege
  - RLS is disabled, missing, or too permissive
  - service-role or secret use leaks into untrusted surfaces
- Evidence expectations:
  - role/policy definition
  - exposed query path
  - client/server key boundary
- Typical containment:
  - enable and tighten RLS
  - split trusted and untrusted roles
  - move privileged access server-side

## Deployment, CI, secrets, and supply-chain failures

- Trigger symptoms:
  - secrets, env vars, workflow permissions, dependencies, or build artifacts are overexposed
  - runtime config diverges from expected posture
- Evidence expectations:
  - deployment/env workflow
  - permissions/config snapshot
  - artifact exposure path
- Typical containment:
  - least-privilege workflow tokens
  - secret rotation
  - dependency pinning/review
  - tighter environment and artifact controls

## Agentic/LLM failures inside an application

- Trigger symptoms:
  - prompt injection
  - tool misuse
  - memory or RAG poisoning
  - MCP/tool metadata abuse
- Evidence expectations:
  - untrusted ingress path
  - dangerous sink/action
  - trace or tool transcript
  - isolation of the affected decision surface
- Typical containment:
  - constrain actions and permissions
  - separate semantic ownership from validation
  - add replay/regression coverage
  - bound data egress and approval surfaces

## Family selection rule

If more than one family seems plausible, start with the family that:

1. touches the highest-value sink
2. has the clearest trust-boundary crossing
3. can produce bounded evidence fastest

Do not escalate to a second family until the first one is either validated, blocked, or explicitly ruled out.
