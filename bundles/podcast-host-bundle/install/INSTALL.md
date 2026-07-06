# Install Guide, AI Expert Author-Speaker-Coach Bundle

**Version.** 1.0.0
**Time to install.** 5 to 10 minutes.
**Difficulty.** Non-technical. Follow the click path.

**Prerequisite.** Install the free **Essential Bundle** first. It ships the foundational skills every Claude user needs (voice-corpus-builder, end-of-day-review, decision-log, handoff, hoard-essential, project-scaffold, etc.). Get it at https://brettkmoore.com/skills. The Author-Speaker-Coach Bundle assumes the Essential Layer is already installed.

The bundle works in three Anthropic surfaces: the Claude desktop app, Claude Code (CLI), and Claude.ai on a paid plan. Pick the surface you use most and follow the matching section below. You only have to install once per surface; skills persist across chat sessions.

---

## Option A: Claude desktop app (recommended for most authors)

This is the easiest path. If you use Claude via the desktop app on Mac or Windows, follow these steps.

**Step 1.** Open the Claude desktop app.

**Step 2.** Click the settings gear icon in the top right corner (or use the menu bar: Claude > Settings on Mac, File > Settings on Windows).

**Step 3.** In the left sidebar of the Settings panel, click **Skills** (also sometimes labeled **Capabilities** in older versions).

**Step 4.** Click the **Add Skill** button (top right of the Skills panel). You will see two options: **Upload a folder** or **Import from URL**.

**Step 5.** Pick **Upload a folder**. A file browser window opens.

**Step 6.** Navigate to the `author-speaker-coach-bundle/skills/` folder from the bundle you downloaded. Select the folder.

**Step 7.** Claude imports all twelve skills. You will see them listed one by one as they load:
- `book-outline-shaper`
- `chapter-draft`
- `podcast-guest-prep`
- `keynote-script`
- `coaching-call-prep`
- `thought-leadership-post`
- `launch-runway`
- `testimonial-request`
- `evergreen-pipeline`
- `brand-voice-consistency`
- `handoff`
- `hoard`

**Step 8.** Click **Enable All** or toggle each skill individually.

**Step 9.** Start a new chat. Try typing "help me shape my book outline". the `book-outline-shaper` skill should fire automatically.

Done.

---

## Option B: Claude Code (CLI)

If you use Claude Code from the terminal, follow these steps.

**Step 1.** Open a terminal window.

**Step 2.** Run the install script:

```bash
curl -sL https://install.brettkmoore.com/author-speaker-coach | bash
```

The script clones the bundle to `~/.claude/skills/aiexpert-author-speaker-coach/` and adds an import line to your root `CLAUDE.md`.

**Step 3.** Restart any active Claude Code sessions so they pick up the new skills.

**Step 4.** Confirm install by typing `/skills list` in Claude Code. You should see the twelve Author-Speaker-Coach skills.

Done.

**Alternative manual method for Claude Code.** If you prefer to install without a script:

```bash
mkdir -p ~/.claude/skills/aiexpert-author-speaker-coach
cp -R /path/to/author-speaker-coach-bundle/skills/* ~/.claude/skills/aiexpert-author-speaker-coach/
```

Then add this line to your root `CLAUDE.md`:

```
@~/.claude/skills/aiexpert-author-speaker-coach/
```

---

## Option C: Claude.ai (browser, paid plan)

**Step 1.** Log in to claude.ai on the paid plan that supports skills.

**Step 2.** Click your account name in the bottom left, then **Settings**.

**Step 3.** In the left sidebar, click **Capabilities** and then **Skills**.

**Step 4.** Click **Add Custom Skill**.

**Step 5.** Upload the `author-speaker-coach-bundle-v1.0.0.zip` file. Claude.ai imports the twelve skills.

**Step 6.** Toggle each skill to **Enabled**.

**Step 7.** Start a new chat and try triggering one of them.

Done.

---

## Option D: Cowork (AI Expert clients only)

If you are inside a Cowork session already, tell the AI Expert plugin loader to install the Author-Speaker-Coach Bundle. The plugin loader knows how to pick up the `.plugin` file and register the skills for the current organization.

---

## Verify the install worked

Try one of these prompts in a fresh chat:

- "Help me shape my book outline.". should fire `book-outline-shaper`.
- "Draft chapter 3 from the outline.". should fire `chapter-draft`.
- "Prep me for the Ryan Deiss podcast next week.". should fire `podcast-guest-prep`.
- "20-minute talk for the conference.". should fire `keynote-script`.
- "Prep my 2pm with Michele.". should fire `coaching-call-prep`.
- "Hot take on AI in publishing, for LinkedIn.". should fire `thought-leadership-post`.
- "Plan an 8-week runway for the October 15 launch.". should fire `launch-runway`.
- "Ask Buddy for a testimonial for the sales page.". should fire `testimonial-request`.
- "Repurpose the keynote into short-form content.". should fire `evergreen-pipeline`.
- "Voice check this newsletter draft.". should fire `brand-voice-consistency`.

If none of them fire, the skills may not be enabled. Return to Settings > Skills and toggle each skill on.

---

## Uninstall

**Claude desktop.** Settings > Skills > find each Author-Speaker-Coach skill > Remove.

**Claude Code.** Delete the `~/.claude/skills/aiexpert-author-speaker-coach/` directory. Remove the import line from your root `CLAUDE.md`.

**Claude.ai.** Settings > Capabilities > Skills > find each Author-Speaker-Coach skill > Remove.

---

## The paid upgrade

The bundle is free forever. It teaches the author-speaker-coach persona how to work with Claude across every recurring surface of the practice.

The paid upgrade is the **Fractional CAIO retainer at $5,000 per month**. Brett K. Moore installs the Claude OS custom for the author's practice: voice corpus builds from books, podcasts, and stage recordings; the four-file HQ scaffold; scheduled tasks (daily brief, weekly review, launch cadence); custom skills for the author's specific programs and coaching frameworks; and the monthly cadence that keeps the operating model compounding.

Details: https://aiexpert.org/fractional-caio

---

## Support

Newsletter and updates: https://brettkmoore.com/skills
Fractional CAIO: https://aiexpert.org/fractional-caio
Certification: https://aiexpert.org/certification

If a skill is not firing on a phrase you expect it to fire on, that is a trigger-phrase gap. Send the phrase and the skill name via the newsletter reply; the next version will add the trigger.
