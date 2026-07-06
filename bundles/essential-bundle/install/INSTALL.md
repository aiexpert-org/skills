# Install Guide, Claude OS for Operators: Essential Bundle

**Version.** 1.0.0
**Time to install.** 5 minutes.
**Difficulty.** Non-technical. Follow the click path.

The Essential Bundle works in four Anthropic surfaces: Claude Code (plugin marketplace), Claude Desktop, Claude.ai, and Cowork. Pick the surface you use most and follow the matching section below. You install once per surface; the skills persist across chat sessions.

---

## Option A: Claude Code plugin marketplace (recommended for power users)

From any Claude Code session:

```
/plugin marketplace add aiexpert-org/skills
/plugin install essential-bundle@aiexpert
```

That's it. All twelve skills load. Restart the session if the skills do not appear in `/skills list` within 30 seconds.

---

## Option B: Claude Desktop app (recommended for non-technical operators)

**Step 1.** Signup at https://brettkmoore.com/skills to get the download link via email.

**Step 2.** Download `essential-bundle-v1.0.0.zip` from the link. Unzip.

**Step 3.** Open the Claude Desktop app.

**Step 4.** Click the settings gear icon in the top right corner (or use the menu bar: Claude > Settings on Mac, File > Settings on Windows).

**Step 5.** In the left sidebar, click **Skills** (labeled **Capabilities** in older versions).

**Step 6.** Click the **Add Skill** button. You will see two options: **Upload a folder** or **Import from URL**.

**Step 7.** Pick **Upload a folder**. Navigate to the `essential-bundle/skills/` folder inside the unzipped bundle. Select the folder.

**Step 8.** Claude imports all twelve skills:

- `handoff`
- `hoard`
- `dream-escalation`
- `end-of-day-review`
- `weekly-review`
- `decision-log`
- `context-management`
- `project-scaffold`
- `voice-corpus-builder`
- `voice-input-protocol`
- `claude-md-hygiene`
- `living-notes-hygiene`

**Step 9.** Click **Enable All** or toggle each skill individually.

**Step 10.** Start a new chat. Try typing "hand this off to a fresh agent" and the `handoff` skill should fire.

Done.

---

## Option C: Curl script (recommended for CLI users)

Open a terminal and run:

```bash
curl -sL https://install.aiexpert.org/essential | bash
```

The script clones the bundle to `~/.claude/skills/aiexpert-essential/` and adds an import line to your root `CLAUDE.md`. Restart any active Claude Code sessions. Confirm with `/skills list`.

Manual alternative:

```bash
mkdir -p ~/.claude/skills/aiexpert-essential
cp -R /path/to/essential-bundle/skills/* ~/.claude/skills/aiexpert-essential/
```

Then add this line to your root `CLAUDE.md`:

```
@~/.claude/skills/aiexpert-essential/
```

---

## Option D: Claude.ai (browser, paid plan)

**Step 1.** Log in to claude.ai on a paid plan that supports skills.

**Step 2.** Click your account name in the bottom left, then **Settings**.

**Step 3.** In the left sidebar, click **Capabilities** and then **Skills**.

**Step 4.** Click **Add Custom Skill**.

**Step 5.** Upload `essential-bundle-v1.0.0.zip`. Claude.ai imports the twelve skills.

**Step 6.** Toggle each skill to **Enabled**.

**Step 7.** Start a new chat and try triggering one.

Done.

---

## Option E: Cowork (AI Expert clients only)

If you are inside a Cowork session already, tell the AI Expert plugin loader to install the Essential Bundle. The plugin loader picks up the `.plugin` file and registers the skills for the current organization.

---

## Verify the install worked

Try one of these prompts in a fresh chat:

- "Hand this off to a fresh agent." should fire `handoff`.
- "Save this snippet for later." should fire `hoard`.
- "What's the 10x version of this idea?" should fire `dream-escalation`.
- "End of day, log it." should fire `end-of-day-review`.
- "Set up a new project." should fire `project-scaffold`.
- "Start me on Whisper Flow." should fire `voice-input-protocol`.

If none of them fire, the skills may not be enabled. Return to Settings > Skills and toggle each skill on.

---

## After the install

Pick a Persona Layer bundle. The Essential Bundle is the foundation; the Persona Layer is what makes Claude a partner for your specific role.

- **SMB Operator Bundle** for solopreneurs through 25-employee businesses.
- **Executive Bundle** for VP through C-suite at $5M+ revenue.
- **Real Estate Agent Bundle** for solo agents through 5-agent teams.
- **Author-Speaker-Coach Bundle** for solo authority-based service businesses.

All Persona Layer bundles are free and newsletter-gated at brettkmoore.com/skills.

---

## Uninstall

**Claude Desktop.** Settings > Skills > find each Essential skill > Remove.

**Claude Code.** Delete the `~/.claude/skills/aiexpert-essential/` directory. Remove the import line from your root `CLAUDE.md`. Or run `/plugin uninstall essential-bundle@aiexpert`.

**Claude.ai.** Settings > Capabilities > Skills > find each Essential skill > Remove.

---

## Support

Email: brett@brettkmoore.com
Web: https://brettkmoore.com/skills

If a skill is not firing on a phrase you expect it to fire on, send the phrase and the skill name to brett@brettkmoore.com. Trigger-phrase gaps ship in the next monthly update.
