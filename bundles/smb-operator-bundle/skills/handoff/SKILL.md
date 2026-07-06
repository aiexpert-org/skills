---
name: handoff
description: "Write a handoff document summarizing the current session so a fresh agent, a teammate, or the operator's future self can continue the work. Saves to a temp scratch location by default (session-scoped, disposable) or a shared team folder if the operator specifies. Includes a purpose scope, what's been done, what's left, and suggested next skills. Trigger phrases include 'handoff', 'hand this off', 'context transfer', 'spawn a follow-up', 'start fresh on this', 'pass this to my assistant', 'brief my team', 'hand off to a fresh agent', 'save this context for later', 'hand this to [name]', 'brief a follow-up agent', 'transfer this work', 'summarize for handoff', 'context dump for'. Use when the operator wants to peel off a slice of the current work to a separate agent, teammate, or their future self. Do NOT trigger for the current in-session close (route to `end-of-day-review`), for a permanent decision (route to `decision-log`), or when the operator wants a full status report of everything they've ever done."
---

LAST-VERIFIED: 2026-07-06. Source of truth: Matt Pocock's `/handoff` skill design, MIT licensed at github.com/mattpocock/skills. Credit: Matt Pocock, aihero.dev. This SMB adaptation extends Matt's engineering-scoped pattern for small-business owners who hand off to teammates rather than to fresh coding agents.

This skill turns a scattered mid-work session into a clean handoff. Small business owners lose context every time they switch tasks, close a laptop, or hand something to their assistant. Matt Pocock's original `/handoff` solves this for engineers running parallel Claude Code sessions. This SMB version solves the same problem for operators handing off to teammates, future selves, and other agents.

Output: a Markdown handoff file at `/tmp/handoff-YYYY-MM-DD-slug.md` (session-scoped, disposable) or the operator's shared team folder if specified.

## When to use

- The operator is peeling off a sub-task to work on separately.
- The operator is handing a slice of work to a teammate, assistant, or contractor.
- The operator wants their Monday-morning self to be able to pick up Friday's thread.
- The operator wants a specific slice of the current session summarized before it grows into 20 more topics.

## When NOT to use

- The operator is closing the whole day (route to `end-of-day-review`).
- The operator is making a permanent business decision (route to `decision-log`).
- The operator is capturing a reusable snippet (route to `hoard`).
- The operator wants a full status report of the whole business (that is a different, longer artifact).

## What you'll produce

```
HANDOFF: [Purpose in one line]
[Date] [Time]

FOR: [Recipient: fresh agent, teammate, future self]
FROM: [Operator]
SCOPE: [The specific slice being handed off. Be tight.]

CONTEXT
[What the recipient needs to know to continue. Point at existing files by path when possible. Don't re-quote them.]

WHAT'S BEEN DONE
- [Done, one line]
- [Done, one line]

WHAT'S LEFT
- [Task, one line, owner-to-be]
- [Task, one line, owner-to-be]

DECISIONS ALREADY MADE
- [Decision that's locked; do not re-litigate]

OPEN QUESTIONS
- [Question the recipient needs to answer]

SUGGESTED NEXT SKILLS
- [Skill name and why the recipient might reach for it]

FILES / LINKS
- [Path or URL], one line on what's in it

REDACTED
- [Anything scrubbed from this doc for security]
```

## Instructions

**Step 0. Lock four things (per Matt Pocock's design).**
1. **The purpose.** In one sentence, what specifically is being handed off? Get this from the operator; do not guess. If the operator invokes `handoff` without a purpose, ask: "What specifically are you handing off?"
2. **The recipient.** Fresh agent (Claude, Codex, another Claude session), teammate (name), or future-self (which date).
3. **The output location.** Default: `/tmp/handoff-YYYY-MM-DD-slug.md` for session-scoped disposable handoffs. Override: `handoffs/YYYY-MM-DD-slug.md` in a shared team folder for team handoffs.
4. **Today's date and time.** Run `date +%Y-%m-%d-%H%M`.

**Step 1. Scope tightly.** The handoff document covers ONE specific slice. If the operator is trying to hand off five topics at once, ask them to pick one and run `handoff` again for the others. Diffuse handoffs produce diffuse work.

**Step 2. Do not re-quote existing artifacts.** If the context lives in a file, reference the file by path. If it lives in an email thread, reference the thread. The handoff is a pointer document, not a re-do of the work.

**Step 3. Redact sensitive data.** Scan for API keys, passwords, PII, financials that shouldn't leave the operator's system. Replace with placeholders. Add a REDACTED section listing what was scrubbed.

**Step 4. Draft the doc.** Use the shape above. Keep sections short. The recipient scans this; they do not read it end-to-end like a novel.

**Step 5. Add suggested next skills.** From this bundle: what would the recipient likely reach for next? Name the skills. (Matt Pocock's original pattern.)

**Step 6. Write the file.** Save to the target location. Deliver the file path in the chat response so the operator can grab it, forward it, or point the next agent at it.

**Step 7. Confirm.** Short chat message: "Handoff written to [path]. Recipient can pick up with [suggested first move]."

## Examples

**Example 1.** Operator says "handoff, my assistant needs to run the Buddy follow-up while I'm at the retreat." Skill fires. Scopes to just the Buddy thread. Points at the Buddy dossier in the HQ. Lists what's been sent, what's owed. Writes to `handoffs/2026-07-06-buddy-followup.md` in the shared team Drive folder.

**Example 2.** Operator says "hand this off to a fresh agent, I want to start a clean session on the pricing model." Skill fires. Scopes to pricing model work only. Writes to `/tmp/handoff-2026-07-06-pricing-model.md`. Delivers path so operator opens fresh session and points it at the file.

**Example 3.** Operator says "context transfer for future me, I'm going on vacation for 10 days." Skill fires. Scopes to open loops only. Writes to a shared file the operator will re-read on return.

## Composes with

- `end-of-day-review`. the daily close ritual; handoff is orthogonal and can co-exist with the daily log.
- `decision-log`. decisions locked in the current session get logged separately.
- `meeting-prep`. the handoff can be a meeting brief for the recipient.
- `weekly-review`. closed handoffs get counted in the weekly retro.
