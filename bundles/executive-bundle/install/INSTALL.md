# AI Expert Executive Bundle, Install Runbook

Three install paths. Choose the one that fits your Claude surface.

---

## Path 1: Claude Code, plugin marketplace (recommended)

Requires Claude Code with the plugin marketplace enabled.

**Step 1.** Open a Claude Code session.

**Step 2.** Add the AI Expert marketplace:
```
/plugin marketplace add aiexpert-org/skills
```

**Step 3.** Install the Executive Bundle:
```
/plugin install executive@aiexpert
```

**Step 4.** Restart Claude Code so the skills are picked up on the next session boot.

**Step 5.** Verify install. In a fresh session, type:
```
"Run the operator lens on this conversation."
```
If the skill fires and returns a stage read, the install is working. If it does not fire, run `/plugin list` and confirm `aiexpert-executive` appears in the enabled list.

---

## Path 2: curl bash install

Requires a Unix-like environment (macOS, Linux, WSL on Windows).

**Step 1.** Run the install script:
```
curl -sL install.aiexpert.org/executive | bash
```

The script:
1. Downloads the bundle zip.
2. Confirms the bundle version.
3. Unpacks the skill files into `~/.claude/skills/aiexpert-executive/`.
4. Adds an import line to your root `~/.claude/CLAUDE.md` so the skills auto-load on session boot.
5. Runs a post-install verification checking that all 14 skill folders exist and each has a valid SKILL.md.

**Step 2.** Restart Claude Code.

**Step 3.** Verify install same as Path 1 Step 5.

---

## Path 3: Manual install

For anyone who wants to see the files before running any script.

**Step 1.** Download `executive-bundle-v1.0.0.zip` from https://github.com/aiexpert-org/skills/releases.

**Step 2.** Unzip.

**Step 3.** Move the `skills/` directory contents into `~/.claude/skills/aiexpert-executive/`.

**Step 4.** Add the following line to your root `~/.claude/CLAUDE.md` (create the file if it does not exist):
```
@import ~/.claude/skills/aiexpert-executive/
```

**Step 5.** Restart Claude Code.

**Step 6.** Verify install same as Path 1 Step 5.

---

## Claude.ai install

Claude.ai does not have a plugin marketplace. Install per-skill through the Claude.ai personal skills UI.

**Step 1.** Open the bundle folder locally after download.

**Step 2.** For each skill folder in `skills/`, open the `SKILL.md` file.

**Step 3.** In Claude.ai, navigate to Settings > Skills > New Skill and paste the SKILL.md contents.

**Step 4.** Repeat for each of the 14 skills.

**Step 5.** Verify install: start a fresh Claude.ai conversation and type "run the operator lens on this." If the skill fires, install is complete.

---

## Troubleshooting

**A skill does not fire when you expect it to.**
The description string is the make-or-break. Read the skill's SKILL.md frontmatter description block to see the trigger phrases the skill listens for. Add the phrase you actually use into your root CLAUDE.md as a personal note. Skills are matched by the model against the description; if your phrasing does not match, the skill will not fire.

**Two skills fire at once when you only wanted one.**
Some skills are designed to co-fire (for example, `five-stage-operator-lens` locks the stage and a stage-appropriate skill runs inside it). If unwanted co-fire happens, tell Claude to only run one and it will hold off. If a specific pair fires unwantedly on every session, open a bug report at `github.com/aiexpert-org/skills/issues`.

**Skills fire on the wrong intent (over-triggering).**
Each SKILL.md has a `Do NOT trigger when...` clause in the description. If the skill fires when the clause says it should not, that is a bug; report at the same issues page.

**Install verification failed.**
Run `ls ~/.claude/skills/aiexpert-executive/skills/` and confirm 14 folders exist. Each folder should contain a SKILL.md file. If a folder is missing or a SKILL.md is missing, rerun the install script or extract manually per Path 3.

## Uninstall

**Plugin marketplace path.**
```
/plugin uninstall executive@aiexpert
```

**Manual path.**
Remove `~/.claude/skills/aiexpert-executive/` and remove the `@import` line from your root CLAUDE.md.

**Claude.ai path.**
Delete each of the 14 skills from Claude.ai Settings > Skills.

---

## Support

- Bug reports: `github.com/aiexpert-org/skills/issues`
- License questions: `brett@brettkmoore.com` (bundle is CC BY-NC 4.0)
- Certified Practitioner tier (redistribution rights): `aiexpert.org/certified-practitioner`
- Bundle upgrades and adjacent bundles: `aiexpert.org/marketplace`

---

## What good looks like after install

Within the first week of use, a well-installed Executive Bundle produces:

- A weekly executive review appended to your `REVIEWS.md`.
- At least one hoard entry captured mid-session.
- A first-pass board deck or investor update drafted for the coming month.
- A decision-quality check run on a call you were about to lock.
- A pre-session stage lock via the operator lens on at least one strategic conversation.

If none of the above happen in the first week, the bundle is not integrated into your rhythm yet. The most common cause is a personal CLAUDE.md that does not signal the operator's HQ shape; add a short block naming your `LIVING-NOTES.md`, `DECISIONS.md`, and `HOARD.md` file locations so the skills know where to write.
