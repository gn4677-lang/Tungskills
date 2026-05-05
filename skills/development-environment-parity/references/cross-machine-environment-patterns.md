# Cross-Machine Environment Patterns

Use this reference when a project behaves differently across Windows, macOS, Linux, local shells, containers, or CI.

## Source Anchors

- OpenAI Codex guidance: improve the development environment iteratively; environment variables, startup scripts, and persistent repo context reduce repeated agent errors.
- Dev Container Spec: a development container defines the development environment before deployment; dev containers can be used for local coding and CI/testing, including Docker Compose integration.
- Docker Compose: a Compose file defines services, networks, and volumes for an application stack and can be used in development, testing, staging, production, and CI workflows.
- Python Packaging User Guide: use `venv` for isolated project installs; `requirements.txt` can declare dependencies; `pip freeze` can help recreate exact installed versions.
- Repo-owned setup docs and verification scripts outrank ad hoc machine fixes.
- Terminal rendering is not byte evidence for CJK or encoding integrity.

## Authority Taxonomy

| Runtime | Usually Proves | Usually Does Not Prove |
| --- | --- | --- |
| Dev Container | Checked-in development environment shape, tools, and editor setup. | Production readiness unless explicitly tied to production image. |
| Docker Compose dev service | Containerized local parity and service wiring. | Cloud deploy behavior or branch merge authority. |
| Native venv | Fast local iteration on one machine. | OS-level parity or container parity. |
| CI runner | Merge/check authority for configured jobs. | Local developer ergonomics or every manual setup path. |
| Manual shell command | The command worked in that shell. | Reproducibility across machines. |

## Docker CLI vs Daemon Boundary

Docker CLI / Compose installation is not container readiness. Treat these as separate facts:

```yaml
docker_cli_available: docker --version and docker compose version return successfully
docker_daemon_available: docker info returns successfully
container_parity_allowed: docker_daemon_available
```

If Docker CLI exists but the daemon is unavailable, narrow the claim to `Docker CLI without daemon`. Do not claim Compose runtime, container parity, or Docker build/run readiness. Use a documented native fallback only when the repo allows it, for example Python 3.12 local verification.

## Windows Docker Desktop WSL2 Ladder

When Docker Desktop reports `Virtualization support not detected`:

1. Verify the symptom with `docker info`, Docker Desktop status, and `wsl --status`.
2. Check Windows features: `Microsoft-Windows-Subsystem-Linux`, `VirtualMachinePlatform`, and when needed `HypervisorPlatform`.
3. Check boot config from elevated PowerShell: `bcdedit /enum | findstr -i hypervisorlaunchtype`; expected recovery is `bcdedit /set hypervisorlaunchtype Auto`.
4. Restart after changing optional features or boot config.
5. If WSL2 still reports unsupported, check BIOS/UEFI hardware virtualization. On AMD boards this is often `SVM Mode`; on Intel boards it is usually VT-x. SLAT must be exposed to Windows.

Do not treat this failure as a Dockerfile, Compose, or product-code problem until the daemon can start.

## Discovery Order

Prefer repo-owned facts before inventing setup:

1. `AGENTS.md` for bootstrap order, hard rules, and conditional reads.
2. `README.md` for documented install/run path.
3. `.devcontainer/devcontainer.json` for containerized development entry.
4. `compose.yaml` / `docker-compose.yml` for service wiring and test services.
5. `Dockerfile` for image/runtime version and OS package needs.
6. `.env.example` and readiness checks for secret names, never secret values.
7. `requirements.txt`, lock files, `pyproject.toml`, `.python-version`, or tool version files for dependency authority.
8. Verify scripts such as `scripts/verify_environment.py` or project wrappers.
9. CI workflow files for merge/check runtime.

## Cross-Machine Diagnosis Pattern

```yaml
target_machine:
  os:
  shell:
  architecture:
authoritative_runtime:
  local:
  ci:
  container:
setup_path:
  documented:
  selected:
local_vs_ci_parity:
  same_python:
  same_dependency_source:
  same_env_names:
  same_verification_command:
blockers:
  - missing_tool
  - wrong_version
  - missing_secret_name
  - path_or_shell_difference
  - encoding_or_line_ending_risk
```

## Decision Rules

- If Docker/Dev Container is documented as the cross-platform route, prefer it for Windows/Mac/Linux parity.
- If native setup is allowed, bind it to an explicit runtime version and verification command.
- If local Python is older than the repo target, do not change product behavior to make that local runtime pass.
- If `.env` is missing, ask for setup of named variables, not the values.
- If CI fails but local passes, compare command scope, Python version, OS, dependency source, environment variables, and artifacts before changing code.
- If text looks garbled only in PowerShell or terminal output, classify as rendering risk until byte-level evidence says otherwise.

## Claim Boundaries

| Evidence | Allowed Claim | Forbidden Claim |
| --- | --- | --- |
| `docker compose run test` passed | The Compose test path passed. | Native macOS setup works. |
| `docker --version` and `docker compose version` passed, but `docker info` failed | Docker CLI / Compose are installed, but daemon-backed container parity is not available. | Docker works, Compose runtime is ready, or container parity is proven. |
| Native venv tests passed | The native venv path passed. | Container or CI parity is proven. |
| `verify_environment.py` blocked | No authoritative local runtime found under repo policy. | Product code is broken. |
| `.env.example` lists secret names | Required variable names are known. | Secret values are present or valid. |
| Dev Container opens | Development environment boots. | Production deploy is ready. |
| Terminal CJK is garbled | Rendering may be broken. | File bytes are corrupted. |

## Agentic-Calorie-Assistant Pattern To Reuse

This project is a useful generalized pattern:

- README names Docker/Mac as the preferred cross-platform path.
- Dev Container points to the same Compose app service.
- Dockerfile uses Python 3.12.
- Compose sets `PYTHONUTF8=1`, `PYTHONPATH`, service env names, and test profile.
- `verify_environment.py` classifies Docker as preferred, Python 3.12 as fallback, and older Python as not authoritative.
- CI remains final merge authority even when local setup passes.

Use this as a pattern, not as a hardcoded repo-specific rule.

## Sources

- https://openai.com/business/guides-and-resources/how-openai-uses-codex/
- https://containers.dev/overview
- https://docs.docker.com/compose/
- https://packaging.python.org/en/latest/guides/installing-using-pip-and-virtual-environments/
- https://learn.microsoft.com/powershell/module/microsoft.powershell.core/about/about_character_encoding
