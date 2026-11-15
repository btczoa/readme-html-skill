#!/usr/bin/env bash
set -euo pipefail

SKILL_NAME="html-readme-architect"
REPO_RAW_URL="https://raw.githubusercontent.com/btczoa/readme-html-skill/main/SKILL.md"
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

TMP_DIR=""
cleanup() {
  if [[ -n "${TMP_DIR}" && -d "${TMP_DIR}" ]]; then
    rm -rf "${TMP_DIR}"
  fi
}
trap cleanup EXIT

if [[ -f "${SCRIPT_DIR}/SKILL.md" ]]; then
  SRC_SKILL="${SCRIPT_DIR}/SKILL.md"
else
  TMP_DIR="$(mktemp -d)"
  SRC_SKILL="${TMP_DIR}/SKILL.md"
  echo "Downloading SKILL.md from GitHub..."
  curl -fsSL "${REPO_RAW_URL}" -o "${SRC_SKILL}"
fi

declare -A AGENT_SKILL_DIRS=(
  ["antigravity"]="${HOME}/.gemini/antigravity-cli/skills/${SKILL_NAME}"
  ["gemini"]="${HOME}/.gemini/skills/${SKILL_NAME}"
  ["claude"]="${HOME}/.claude/skills/${SKILL_NAME}"
  ["codex"]="${HOME}/.codex/skills/${SKILL_NAME}"
)

declare -A AGENT_RULE_FILES=(
  ["antigravity"]="${HOME}/.gemini/AGENTS.md"
  ["gemini"]="${HOME}/.gemini/GEMINI.md"
  ["claude"]="${HOME}/.claude/CLAUDE.md"
  ["codex"]="${HOME}/.codex/AGENTS.md"
)

RULE_START="<!-- readme-html-skill:start -->"
RULE_END="<!-- readme-html-skill:end -->"

read -r -d '' RULE_BLOCK << 'EOF' || true
<!-- readme-html-skill:start -->
## html-readme-architect Standard (`html-readme-architect`)
When handling tasks matching `html-readme-architect` (Create standalone light-mode HTML technical specifications and README.html without Mermaid/external CDNs.), you MUST read and strictly follow `${SKILL_NAME}/SKILL.md` before writing any output.
<!-- readme-html-skill:end -->
EOF

upsert_rule() {
  local rule_file="$1"
  mkdir -p "$(dirname "${rule_file}")"
  if [[ ! -f "${rule_file}" ]]; then
    printf "%s\n" "${RULE_BLOCK}" > "${rule_file}"
    echo "  + Created rule file: ${rule_file}"
    return
  fi

  python3 - "$rule_file" "$RULE_START" "$RULE_END" "$RULE_BLOCK" << 'PYEOF'
import sys
from pathlib import Path

path = Path(sys.argv[1])
start, end, block = sys.argv[2], sys.argv[3], sys.argv[4]
text = path.read_text(encoding="utf-8")

if start in text and end in text:
    s_idx = text.index(start)
    e_idx = text.index(end, s_idx) + len(end)
    new_text = text[:s_idx] + block + text[e_idx:]
else:
    sep = "\n\n" if text and not text.endswith("\n\n") else ("\n" if text and not text.endswith("\n") else "")
    new_text = text + sep + block + "\n"

path.write_text(new_text, encoding="utf-8")
PYEOF
  echo "  + Updated rule file: ${rule_file}"
}

installed=0
for agent in antigravity gemini claude codex; do
  skill_dir="${AGENT_SKILL_DIRS[$agent]}"
  agent_root="$(dirname "$(dirname "${skill_dir}")")"

  if [[ -d "${agent_root}" ]]; then
    mkdir -p "${skill_dir}"
    cp "${SRC_SKILL}" "${skill_dir}/SKILL.md"
    echo "[${agent}] Installed skill -> ${skill_dir}/SKILL.md"
    upsert_rule "${AGENT_RULE_FILES[$agent]}"
    installed=$((installed + 1))
  fi
done

if [[ "${installed}" -eq 0 ]]; then
  echo "No supported agent directories found under ${HOME} (.gemini, .claude, .codex)."
  exit 1
fi

echo "Done! Installed html-readme-architect skill & rules to ${installed} agent(s)."
