#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
REPO_ROOT="$(cd "$SCRIPT_DIR/.." && pwd)"
SOURCE_SKILLS="$REPO_ROOT/skills"

if [[ ! -d "$SOURCE_SKILLS" ]]; then
  echo "Cannot find skills directory: $SOURCE_SKILLS" >&2
  exit 1
fi

CODEX_HOME="${CODEX_HOME:-$HOME/.codex}"
TARGET_SKILLS="$CODEX_HOME/skills"

mkdir -p "$TARGET_SKILLS"
target_root="$(cd "$TARGET_SKILLS" && pwd)"

for skill_dir in "$SOURCE_SKILLS"/*; do
  [[ -d "$skill_dir" ]] || continue
  skill_name="$(basename "$skill_dir")"
  target_dir="$target_root/$skill_name"
  case "$target_dir" in
    "$target_root"/*) ;;
    *) echo "Refusing to install outside target skills directory: $target_dir" >&2; exit 1 ;;
  esac
  rm -rf "$target_dir"
  cp -R "$skill_dir" "$target_dir"
  echo "Installed skill: $skill_name"
done

echo "Installed Tungskills into $target_root"
