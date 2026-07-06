# Install Guide, AI Expert SMB Operator Bundle

**Version.** 1.0.0
**Time to install.** 5 to 10 minutes.
**Difficulty.** Non-technical. Follow the click path.

The Bundle works in three Anthropic surfaces: the Claude desktop app, Claude Code (CLI), and Claude.ai on a paid plan. Pick the surface you use most and follow the matching section below. You only have to install once per surface; skills persist across chat sessions.

---

## Option A: Claude desktop app (recommended for non-technical buyers)

This is the easiest path. If you use Claude via the desktop app on Mac or Windows, follow these steps.

**Step 1.** Open the Claude desktop app.

**Step 2.** Click the settings gear icon in the top right corner (or use the menu bar: Claude > Settings on Mac, File > Settings on Windows).

**Step 3.** In the left sidebar of the Settings panel, click **Skills** (also sometimes labeled **Capabilities** in older versions).

**Step 4.** Click the **Add Skill** button (top right of the Skills panel). You will see two options: **Upload a folder** or **Import from URL**.

**Step 5.** Pick **Upload a folder**. A file browser window opens.

**Step 6.** Navigate to the `smb-operator-bundle/skills/` folder from the bundle you downloaded. Select the folder.

**Step 7.** Claude imports all twelve skills. You will see them listed one by one as they load:
- `weekly-network-review`
- `sales-pipeline-hygiene`
- `cold-outreach-discipline`
- `brand-voice-consistency`
- `ghl-workflow-templates`
- `meeting-prep`
- `end-of-day-review`
- `decision-log`
- `hoard`
- `handoff`
- `weekly-review`
- `ghost-writer-me`

**Step 8.** Click **Enable All** or toggle each skill individually.

**Step 9.** Start a new chat. Try typing "who should I reach out to this week?". the `weekly-network-review` skill should fire automatically.

Done.

---

## Option B: Claude Code (CLI)

If you use Claude Code from the terminal, follow these steps.

**Step 1.** Open a terminal window.

**Step 2.** Run the install script:

```bash
curl -sL https://install.aiexpert.org/smb | bash
```

The script clones the bundle to `~/.claude/skills/aiexpert-smb/` and adds an import line to your root `CLAUDE.md`.

**Step 3.** Restart any active Claude Code sessions so they pick up the new skills.

**Step 4.** Confirm install by typing `/skills list` in Claude Code. You should see the twelve SMB Operator skills.

Done.

**Alternative manual method for Claude Code.** If you prefer to install without a script:

```bash
mkdir -p ~/.claude/skills/aiexpert-smb
cp -R /path/to/smb-operator-bundle/skills/* ~/.claude/skills/aiexpert-smb/
```

Then add this line to your root `CLAUDE.md`:

```
@~/.claude/skills/aiexpert-smb/
```

---

## Option C: Claude.ai (browser, paid plan)

**Step 1.** Log in to claude.ai on the paid plan that supports skills.

**Step 2.** Click your account name in the bottom left, then **Settings**.

**Step 3.** In the left sidebar, click **Capabilities** and then **Skills**.

**Step 4.** Click **Add Custom Skill**.

**Step 5.** Upload the `smb-operator-bundle.zip` file. Claude.ai imports the twelve skills.

**Step 6.** Toggle each skill to **Enabled**.

**Step 7.** Start a new chat and try triggering one of them.

Done.

---

## Option D: Cowork (AI Expert clients only)

If you are inside a Cowork session already, tell the AI Expert plugin loader to install the SMB Operator Bundle. The plugin loader knows how to pick up the `.plugin` file and register the skills for the current organization.

---

## Verify the install worked

Try one of these prompts in a fresh chat:

- "Who should I reach out to this week?". should fire `weekly-network-review`.
- "Check my pipeline for stuck deals.". should fire `sales-pipeline-hygiene`.
- "Prep me for my 2 PM call with Buddy.". should fire `meeting-prep`.
- "Draft a follow-up email in my voice.". should fire `ghost-writer-me`.

If none of them fire, the skills may not be enabled. Return to Settings > Skills and toggle each skill on.

---

## Uninstall

**Claude desktop.** Settings > Skills > find each SMB skill > Remove.

**Claude Code.** Delete the `~/.claude/skills/aiexpert-smb/` directory. Remove the import line from your root `CLAUDE.md`.

**Claude.ai.** Settings > Capabilities > Skills > find each SMB skill > Remove.

---

## Support

Email: brett@brettkmoore.com
Web: https://aiexpert.org/marketplace/smb-operator

If a skill is not firing on a phrase you expect it to fire on, that is a trigger-phrase gap. Send the phrase and the skill name; the next version will add the trigger.
