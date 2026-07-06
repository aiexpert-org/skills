# Install

Three install paths. Pick the one that matches your Claude surface.

## Path 1: Claude Code plugin marketplace (recommended)

From inside Claude Code, run:

```
/plugin marketplace add aiexpert-org/skills
```

Then install any of the three bundles:

```
/plugin install smb-operator@aiexpert-org
/plugin install executive@aiexpert-org
/plugin install real-estate-operator@aiexpert-org
```

Restart Claude Code. Skills fire automatically when your language matches the skill description.

## Path 2: Claude.ai or Claude Desktop (zip upload)

1. Download the bundle zip from https://github.com/aiexpert-org/skills/releases.
2. In Claude.ai or Claude Desktop, open Settings.
3. Skills > Add.
4. Select the zip file.
5. Enable each skill in the bundle.

Start a new chat. Try a skill trigger like "who should I reach out to this week?" (SMB) or "prep me for Wednesday's board" (Executive) or "prep me for a showing at 1247 Oak" (Real Estate).

## Path 3: Manual clone

For engineers or advanced users who want the skills in a specific location:

```
git clone https://github.com/aiexpert-org/skills.git ~/.aiexpert-skills
```

Then either copy the individual skill folders into `~/.claude/skills/` or add an import line to your root `CLAUDE.md`:

```
@~/.aiexpert-skills/bundles/smb-operator-bundle/skills/
```

Restart Claude Code.

## Verify install

Try one of these prompts in a fresh chat:

- SMB Operator: "Who should I reach out to this week?" fires `weekly-network-review`.
- Executive: "Escalate this before I commit." fires `dream-escalation`.
- Real Estate: "Prep me for a showing at 1247 Oak at 2pm." fires `showing-prep`.

If a skill does not fire, confirm it is enabled in Settings > Skills. If the trigger phrase is not one the skill listens for, read the skill's `SKILL.md` frontmatter to see the phrases it matches.

## Support

brett@brettkmoore.com
https://aiexpert.org/marketplace
