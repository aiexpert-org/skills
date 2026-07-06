#!/usr/bin/env bash
set -euo pipefail

# AI Expert Real Estate Operator Bundle installer
# Version 1.0.0 , 2026-07-06
# Author: Brett K. Moore

BUNDLE_NAME="real-estate-operator"
BUNDLE_VERSION="1.0.0"
INSTALL_DIR="${HOME}/.claude/skills/aiexpert-real-estate"
CLAUDE_MD="${HOME}/.claude/CLAUDE.md"
LICENSE_ENDPOINT="https://verify.aiexpert.org/license"
BUNDLE_ARCHIVE_URL="https://install.aiexpert.org/bundles/${BUNDLE_NAME}-v${BUNDLE_VERSION}.tar.gz"

echo ""
echo "AI Expert Real Estate Operator Bundle v${BUNDLE_VERSION}"
echo "Installing to ${INSTALL_DIR}"
echo ""

# Ask for license key
if [ -z "${AIEXPERT_LICENSE_KEY:-}" ]; then
  read -p "License key (from your order confirmation or subscriber dashboard): " AIEXPERT_LICENSE_KEY
fi

# Verify license against the AI Expert license server
echo "Verifying license..."
LICENSE_STATUS=$(curl -sS -o /dev/null -w "%{http_code}" \
  -H "Content-Type: application/json" \
  -X POST \
  -d "{\"key\":\"${AIEXPERT_LICENSE_KEY}\",\"bundle\":\"${BUNDLE_NAME}\",\"version\":\"${BUNDLE_VERSION}\"}" \
  "${LICENSE_ENDPOINT}" || echo "000")

if [ "${LICENSE_STATUS}" != "200" ]; then
  echo ""
  echo "License verification failed (HTTP ${LICENSE_STATUS})."
  echo "Check your license key. If the problem persists, contact brett@brettkmoore.com."
  echo ""
  exit 1
fi

echo "License verified."
echo ""

# Create install directory
mkdir -p "${INSTALL_DIR}"

# Download and extract bundle
echo "Downloading bundle archive..."
TMP_ARCHIVE=$(mktemp -t aiexpert-bundle.XXXXXX.tar.gz)
curl -sSL "${BUNDLE_ARCHIVE_URL}?key=${AIEXPERT_LICENSE_KEY}" -o "${TMP_ARCHIVE}"

echo "Extracting bundle..."
tar -xzf "${TMP_ARCHIVE}" -C "${INSTALL_DIR}"
rm -f "${TMP_ARCHIVE}"

# Add import line to root CLAUDE.md if it exists
if [ -f "${CLAUDE_MD}" ]; then
  if ! grep -q "AI Expert Real Estate Operator Bundle" "${CLAUDE_MD}"; then
    echo "Adding import line to ${CLAUDE_MD}..."
    cat >> "${CLAUDE_MD}" <<'MARKDOWN'

## AI Expert Real Estate Operator Bundle skills
See `~/.claude/skills/aiexpert-real-estate/skills/` for the 13 real estate operator skills. Fire on the trigger phrases in each SKILL.md description.
MARKDOWN
  fi
else
  echo "No ${CLAUDE_MD} found. Skills will still fire when Claude reads the skill folder directly."
fi

# Verify install
echo ""
echo "Verifying install..."
INSTALLED_SKILLS=$(find "${INSTALL_DIR}/skills" -mindepth 1 -maxdepth 1 -type d 2>/dev/null | wc -l | tr -d ' ')

echo ""
echo "Installed ${INSTALLED_SKILLS} skills to ${INSTALL_DIR}/skills:"
find "${INSTALL_DIR}/skills" -mindepth 1 -maxdepth 1 -type d 2>/dev/null | while read -r d; do
  echo "  - $(basename "${d}")"
done

echo ""
echo "Install complete."
echo ""
echo "First run: open a Claude session and try one of these:"
echo "  - Prep me for a showing at [address] at [time], buyer is [name]."
echo "  - Run the buyer consultation intake for the [name] family."
echo "  - Friday agent review."
echo ""
echo "Docs: https://aiexpert.org/marketplace/real-estate-operator"
echo "Support: brett@brettkmoore.com"
echo ""
