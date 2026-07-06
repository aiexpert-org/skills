# Install. Real Estate Operator Bundle

**Version.** 1.0.0
**Date.** 2026-07-06.
**Estimated install time.** 3 minutes.

## Choose your install path

### Path 1. Claude Code plugin marketplace (recommended)

For real estate agents already using Claude Code as their primary Claude surface.

```
/plugin marketplace add aiexpert-org/skills
/plugin install real-estate-operator@aiexpert
```

The plugin marketplace registers the bundle globally. Skills appear in your `/skills` list automatically. No file copying required.

### Path 2. Curl-installable script

For real estate agents using Claude.ai in a browser or Claude Code without the plugin marketplace enabled.

```
curl -sL install.aiexpert.org/real-estate | bash
```

The script:
1. Clones the bundle into `~/.claude/skills/aiexpert-real-estate/`.
2. Adds an import line to your root `CLAUDE.md`.
3. Runs a post-install verification listing every skill installed.

The install script asks for your marketplace license key on first run. Get your key from your AI Expert Marketplace order confirmation email or from your BNB AI Solutions Agent AI Native subscriber dashboard.

### Path 3. Manual copy

For real estate agents who want to inspect the bundle before running anything.

1. Download `real-estate-operator-bundle-v1.0.0.zip` from your order confirmation or subscriber dashboard.
2. Unzip to `~/.claude/skills/aiexpert-real-estate/`.
3. Add this line to your root `CLAUDE.md`:

   ```
   ## AI Expert Real Estate Operator Bundle skills
   See `~/.claude/skills/aiexpert-real-estate/skills/` for the 13 real estate operator skills. Fire on the trigger phrases in each SKILL.md description.
   ```

4. Restart your Claude session so the skills load.

## Verify install

After any install path, run this in your Claude session to confirm the skills are loaded:

```
Which real estate operator skills are installed?
```

Claude will list every skill it can see. Expected output: 13 skills named `showing-prep`, `mls-follow-up`, `deal-doc-review`, `referral-tracking`, `transaction-milestones`, `listing-presentation`, `buyer-consultation`, `open-house-plan`, `neighborhood-brief`, `agent-weekly-review`, `fsbo-outreach`, `handoff`, `hoard`.

If any skill is missing, re-run the install script or check that `~/.claude/skills/aiexpert-real-estate/` contains all 13 skill folders.

## First run

Try one of these to see the bundle in action:

- "Prep me for a showing at [address] at [time], buyer is [name]."
- "Run the buyer consultation intake for the [name] family."
- "Review this purchase agreement." (Paste the contract text.)
- "Friday agent review."
- "Hoard this, [something worth remembering]."

The skill auto-invokes when your language matches the description. No slash command needed.

## Integrations (optional)

The bundle works standalone with no external integrations. Optional integrations enhance specific skills:

- **GHL, BoldTrail, Follow Up Boss.** `mls-follow-up` and `referral-tracking` can read your CRM contacts and push nurture cadences.
- **Google Calendar.** `transaction-milestones` can drop deadline reminders directly.
- **MLS export.** `showing-prep`, `listing-presentation`, `neighborhood-brief`, and `fsbo-outreach` can read a CSV MLS export for accurate comps and neighborhood data.
- **AI Sphere vault (BNB AI Solutions subscribers).** `hoard` writes to the vault with tagged, retrieval-friendly schema.

To connect any integration, follow the runbook at `install/integrations/`.

## Uninstall

```
/plugin uninstall real-estate-operator@aiexpert
```

Or delete the bundle folder:

```
rm -rf ~/.claude/skills/aiexpert-real-estate/
```

Skills stop firing immediately. Any files written to your HQ by the skills (buyer profiles, transaction logs, referral tracker, sphere entries) remain untouched.

## Support

- Docs: [aiexpert.org/marketplace/real-estate-operator](https://aiexpert.org/marketplace/real-estate-operator).
- Bugs: [github.com/aiexpert-org/skills/issues](https://github.com/aiexpert-org/skills/issues).
- Direct: brett@brettkmoore.com.

## BNB AI Solutions integration note

If you are a BNB AI Solutions Agent AI Native subscriber, this bundle installs automatically as part of your subscription onboarding. No separate install needed. Your Agent AI Native dashboard shows the skills as installed under "AI Sphere Skills." The bundle updates automatically when new versions ship.
