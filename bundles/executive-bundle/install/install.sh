#!/usr/bin/env bash
# AI Expert Executive Bundle installer
# curl -sL install.aiexpert.org/executive | bash
#
# Author: Brett K. Moore
# Version: 1.0.0
# License: AI Expert commercial license (see LICENSE in the bundle)

set -euo pipefail

BUNDLE_NAME="aiexpert-executive"
BUNDLE_VERSION="1.0.0"
BUNDLE_ZIP_URL="https://install.aiexpert.org/executive/executive-bundle-v${BUNDLE_VERSION}.zip"
VERIFY_URL="https://verify.aiexpert.org/executive"
CLAUDE_HOME="${CLAUDE_HOME:-$HOME/.claude}"
SKILLS_DIR="${CLAUDE_HOME}/skills/${BUNDLE_NAME}"
CLAUDE_MD="${CLAUDE_HOME}/CLAUDE.md"
IMPORT_LINE="@import ${SKILLS_DIR}/"

info()  { printf "\n[install] %s\n" "$*"; }
warn()  { printf "\n[warn]    %s\n" "$*" >&2; }
error() { printf "\n[error]   %s\n" "$*" >&2; exit 1; }

check_prereqs() {
  info "Checking prerequisites."
  command -v curl >/dev/null 2>&1 || error "curl is required."
  command -v unzip >/dev/null 2>&1 || error "unzip is required."
  mkdir -p "${CLAUDE_HOME}/skills"
}

prompt_license_key() {
  info "Enter your AI Expert license key (from your purchase confirmation)."
  info "License key is required to fetch the bundle."
  printf "License key: "
  read -r LICENSE_KEY
  [ -n "${LICENSE_KEY}" ] || error "License key cannot be empty."
}

verify_license() {
  info "Verifying license key with ${VERIFY_URL}."
  HTTP_CODE=$(curl -s -o /tmp/aiexpert-verify.json -w "%{http_code}" \
    -X POST "${VERIFY_URL}" \
    -H "Content-Type: application/json" \
    -d "{\"license_key\":\"${LICENSE_KEY}\",\"bundle\":\"${BUNDLE_NAME}\",\"version\":\"${BUNDLE_VERSION}\"}")
  if [ "${HTTP_CODE}" != "200" ]; then
    error "License verification failed (HTTP ${HTTP_CODE}). Contact support@aiexpert.org."
  fi
  info "License verified."
}

download_bundle() {
  info "Downloading bundle from ${BUNDLE_ZIP_URL}."
  TMP_ZIP=$(mktemp -t "${BUNDLE_NAME}-XXXXXX.zip")
  HTTP_CODE=$(curl -sL -o "${TMP_ZIP}" -w "%{http_code}" \
    -H "X-License-Key: ${LICENSE_KEY}" \
    "${BUNDLE_ZIP_URL}")
  if [ "${HTTP_CODE}" != "200" ]; then
    error "Bundle download failed (HTTP ${HTTP_CODE})."
  fi
  info "Bundle downloaded to ${TMP_ZIP}."
}

install_skills() {
  info "Installing skills to ${SKILLS_DIR}."
  if [ -d "${SKILLS_DIR}" ]; then
    BACKUP_DIR="${SKILLS_DIR}.backup-$(date +%Y%m%d-%H%M%S)"
    warn "${SKILLS_DIR} exists. Backing up to ${BACKUP_DIR}."
    mv "${SKILLS_DIR}" "${BACKUP_DIR}"
  fi
  mkdir -p "${SKILLS_DIR}"
  unzip -q "${TMP_ZIP}" -d "${SKILLS_DIR}"
  # If the zip contains a top-level bundle folder, flatten one level.
  if [ -d "${SKILLS_DIR}/executive-bundle" ]; then
    mv "${SKILLS_DIR}/executive-bundle/"* "${SKILLS_DIR}/"
    rmdir "${SKILLS_DIR}/executive-bundle"
  fi
  rm -f "${TMP_ZIP}"
  info "Skills installed."
}

wire_claude_md() {
  info "Wiring import into ${CLAUDE_MD}."
  mkdir -p "$(dirname "${CLAUDE_MD}")"
  if [ ! -f "${CLAUDE_MD}" ]; then
    touch "${CLAUDE_MD}"
  fi
  if grep -Fxq "${IMPORT_LINE}" "${CLAUDE_MD}"; then
    info "Import line already present."
  else
    printf "\n# AI Expert Executive Bundle\n%s\n" "${IMPORT_LINE}" >> "${CLAUDE_MD}"
    info "Import line added."
  fi
}

verify_install() {
  info "Verifying install."
  EXPECTED_SKILLS=(
    five-stage-operator-lens
    dream-escalation
    board-deck-draft
    investor-update
    hiring-loop
    decision-quality-check
    hard-conversation
    hoard
    handoff
    weekly-executive-review
    quarterly-strategy-reset
    principle-check
    fractional-cxo-mode
    ghost-writer-me-exec
  )
  MISSING=0
  for skill in "${EXPECTED_SKILLS[@]}"; do
    if [ ! -f "${SKILLS_DIR}/skills/${skill}/SKILL.md" ]; then
      warn "Missing SKILL.md for ${skill}"
      MISSING=$((MISSING + 1))
    fi
  done
  if [ "${MISSING}" -gt 0 ]; then
    error "${MISSING} skill(s) failed verification. Rerun the installer or contact support@aiexpert.org."
  fi
  info "All 14 skills verified."
}

print_success() {
  cat <<EOF

============================================================
AI Expert Executive Bundle v${BUNDLE_VERSION} installed.

Skills location: ${SKILLS_DIR}
CLAUDE.md wired: ${CLAUDE_MD}

Next steps:
  1. Restart Claude Code so the skills load on next session boot.
  2. In a fresh session, type: "Run the operator lens on this."
     If the skill fires, install is working.

Docs: ${SKILLS_DIR}/README.md
License: ${SKILLS_DIR}/LICENSE
Support: brett@brettkmoore.com
============================================================
EOF
}

main() {
  check_prereqs
  prompt_license_key
  verify_license
  download_bundle
  install_skills
  wire_claude_md
  verify_install
  print_success
}

main "$@"
