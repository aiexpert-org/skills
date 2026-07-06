#!/usr/bin/env bash
#
# AI Expert Author-Speaker-Coach Bundle installer
# Version 1.0.0
# Usage: curl -sL https://install.brettkmoore.com/author-speaker-coach | bash
#
# Installs 12 skills to ~/.claude/skills/aiexpert-author-speaker-coach/ and imports them
# into the user's root CLAUDE.md so Claude Code picks them up.
#
# Safe to run more than once. Existing installs are backed up before overwrite.
#
# Prerequisite: install the free Essential Bundle first for the foundational skills
# every Claude user needs. See https://brettkmoore.com/skills

set -euo pipefail

BUNDLE_NAME="aiexpert-author-speaker-coach"
INSTALL_DIR="${HOME}/.claude/skills/${BUNDLE_NAME}"
CLAUDE_MD="${HOME}/.claude/CLAUDE.md"
IMPORT_LINE="@~/.claude/skills/${BUNDLE_NAME}/"
BUNDLE_URL="${AIEXPERT_BUNDLE_URL:-https://install.brettkmoore.com/author-speaker-coach-bundle-v1.0.0.zip}"
TMP_DIR="$(mktemp -d)"

echo ""
echo "==============================================================="
echo "  AI Expert Author-Speaker-Coach Bundle installer v1.0.0"
echo "==============================================================="
echo ""

# Ensure ~/.claude/skills/ exists
mkdir -p "${HOME}/.claude/skills"

# Backup existing install if it exists
if [ -d "${INSTALL_DIR}" ]; then
  BACKUP_DIR="${INSTALL_DIR}.backup-$(date +%Y%m%d-%H%M%S)"
  echo "  Existing install found at ${INSTALL_DIR}"
  echo "  Backing up to ${BACKUP_DIR}"
  mv "${INSTALL_DIR}" "${BACKUP_DIR}"
fi

# Check for Essential Bundle prerequisite
ESSENTIAL_DIR="${HOME}/.claude/skills/aiexpert-essential"
if [ ! -d "${ESSENTIAL_DIR}" ]; then
  echo "  Note: the free Essential Bundle is a prerequisite."
  echo "  Not detected at ${ESSENTIAL_DIR}."
  echo "  Get it at https://brettkmoore.com/skills"
  echo ""
  echo "  Continuing with Author-Speaker-Coach install anyway ..."
  echo ""
fi

# Download the bundle
echo "  Downloading bundle from ${BUNDLE_URL} ..."
if command -v curl >/dev/null 2>&1; then
  curl -sL "${BUNDLE_URL}" -o "${TMP_DIR}/bundle.zip"
elif command -v wget >/dev/null 2>&1; then
  wget -q "${BUNDLE_URL}" -O "${TMP_DIR}/bundle.zip"
else
  echo "  Error: need curl or wget installed. Aborting."
  exit 1
fi

# Unzip
echo "  Extracting ..."
if command -v unzip >/dev/null 2>&1; then
  unzip -q "${TMP_DIR}/bundle.zip" -d "${TMP_DIR}/extracted"
else
  echo "  Error: need unzip installed. Aborting."
  exit 1
fi

# Move skills into place
mkdir -p "${INSTALL_DIR}"
if [ -d "${TMP_DIR}/extracted/author-speaker-coach-bundle/skills" ]; then
  cp -R "${TMP_DIR}/extracted/author-speaker-coach-bundle/skills/"* "${INSTALL_DIR}/"
elif [ -d "${TMP_DIR}/extracted/skills" ]; then
  cp -R "${TMP_DIR}/extracted/skills/"* "${INSTALL_DIR}/"
else
  echo "  Error: could not find skills/ folder in bundle. Aborting."
  exit 1
fi

# Import line in root CLAUDE.md
if [ ! -f "${CLAUDE_MD}" ]; then
  touch "${CLAUDE_MD}"
fi

if ! grep -qF "${IMPORT_LINE}" "${CLAUDE_MD}"; then
  echo "" >> "${CLAUDE_MD}"
  echo "# AI Expert Author-Speaker-Coach Bundle" >> "${CLAUDE_MD}"
  echo "${IMPORT_LINE}" >> "${CLAUDE_MD}"
  echo "  Added import line to ${CLAUDE_MD}"
else
  echo "  Import line already present in ${CLAUDE_MD}"
fi

# Cleanup
rm -rf "${TMP_DIR}"

# Confirm
INSTALLED_SKILLS=$(ls -1 "${INSTALL_DIR}" | wc -l | tr -d ' ')
echo ""
echo "  Installed ${INSTALLED_SKILLS} skills to ${INSTALL_DIR}"
echo ""
echo "  Next steps:"
echo "    1. Restart any active Claude Code sessions."
echo "    2. Try triggering a skill: 'help me shape my book outline'"
echo "    3. Verify: /skills list"
echo ""
echo "  Free newsletter and updates: https://brettkmoore.com/skills"
echo "  Paid upgrade (Fractional CAIO): https://aiexpert.org/fractional-caio"
echo "==============================================================="
echo ""
