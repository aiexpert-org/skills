---
name: end-of-session-ritual
description: "Run the universal end-of-session ritual on any Claude work session. Composed skill that walks the operator through the six-step post-flight checklist in a single command: LIVING-NOTES update, DECISIONS log, HOARD entries, GLOSSARY additions, handoff (if pausing mid-task), and a top-3 tee-up for tomorrow. This is the ONE habit that makes Claude get smarter about the operator over time. Every glossary term captured, every hoard entry saved, every decision logged compounds into tomorrow's session. Trigger phrases include 'wrap up', 'close out this session', 'end session ritual', 'session close', 'shutting down for the day', 'end-of-session ritual', 'wrap this up', 'session hygiene', 'close the session', 'shut down cleanly', 'before I go', 'end of work ritual', 'run the ritual', 'post-flight checklist', 'close it out'. Use at the end of every work session, whether the session was 20 minutes or four hours. Do NOT trigger mid-task when the operator is still actively producing, when the operator explicitly says 'don't log this, I'm just stepping away', or when the session produced literally nothing worth capturing (rare)."
---

LAST-VERIFIED: 2026-07-06. Source of truth: composed from Brett K. Moore's `end-of-day-review`, `living-notes-hygiene`, `decision-log`, `glossary-builder`, `hoard`, and `handoff` skills in the Essential Bundle. The pilot's-briefing metaphor (pre-flight, mid-flight, post-flight) locks 2026-07-06 as the canonical framing for how operators use the Claude OS.

This skill is the elegant one-command close-out for any Claude session. Operators bleed context between sessions. They finish a chunk of work, close the laptop, and the next session Claude has forgotten every glossary term, every decision, every snippet worth keeping. This skill fixes the bleed in one move. It walks the six-step post-flight ritual so the operator does not have to remember which sub-skill fires when. The next session starts sharper than this one ended.

Positioning: this is the compounding move. Every time an operator runs it, Claude gets smarter about them. Skip it and tomorrow's session starts from zero.

Output:
- One dated entry appended to `LIVING-NOTES.md` (Source / Summary / Files produced / Decisions / Next).
- Any DECISIONS locked during the session, logged to `DECISIONS.md` (or the project's decision log).
- Any HOARD-worthy snippets captured to the operator's hoard vault.
- Any new terms of art added to the project GLOSSARY.
- A handoff doc IF the session paused mid-task (invokes `handoff`).
- A short chat digest naming tomorrow's top 3.

## When to use

- End of any work session, whether 20 minutes or four hours long.
- Before switching to a completely different project inside the same day.
- Before closing the laptop for the day, the weekend, or a vacation.
- Any time the operator says "wrap up," "close this out," or "before I go."

## When NOT to use

- The operator is mid-task and just took a break.
- The operator explicitly says "don't log this, I'm just stepping away."
- The session produced literally nothing worth capturing (rare, and usually a signal something went wrong upstream).
- The operator already ran this skill 10 minutes ago and nothing has changed.

## What you'll produce

```
SESSION CLOSE: [YYYY-MM-DD HH:MM]  |  Project: [name]

WHAT WE DID
- [1-line summary of the session's work]
- [Files produced, changed, shipped]

DECISIONS LOGGED (if any)
- [Decision, one line, with a link to the DECISIONS.md entry]

HOARD ENTRIES ADDED (if any)
- [Snippet or artifact worth keeping, one line]

GLOSSARY ADDITIONS (if any)
- [Term: brief definition]

HANDOFF (if paused mid-task)
- [Link to handoff doc]

LIVING-NOTES ENTRY WRITTEN
- Confirmed at [path].

TOMORROW'S TOP 3
1. [Highest-priority thing]
2. [Second highest]
3. [Third]

CLOSE MESSAGE
[Short encouraging line. The operator is closing. Do not be verbose.]
```

## Instructions

The ritual is six steps. Do them in order. Skip any step where the answer is "nothing happened."

**Step 0. Lock the basics.**
1. Run `date +%Y-%m-%d %H:%M` via bash. Do not infer.
2. Identify the project (which CLAUDE.md is loaded). If ambiguous, ask the operator.
3. Confirm session scope: what did we work on in this session? A one-sentence answer from the operator is enough.

**Step 1. LIVING-NOTES.md update.** Compose `living-notes-hygiene`. Write a dated entry with Source / Summary / Files produced / Decisions / Next. 3 to 5 bullets. Append to the project's `LIVING-NOTES.md`. If the file has a `## CURRENT STATE` block at the top, update it if anything material shifted.

**Step 2. DECISIONS log.** Compose `decision-log`. Ask: did we lock any decision this session? If yes, append to `DECISIONS.md` (or the project's decision log) using the standard dated-decision format. If no, skip.

**Step 3. HOARD entries.** Compose `hoard`. Ask: did anything worth keeping surface? A useful snippet, a prompt pattern that worked, a piece of research, a quote from a source, a link. If yes, save to the operator's hoard vault. If no, skip.

**Step 4. GLOSSARY additions.** Compose `glossary-builder`. Ask: did any new term of art come up this session that Claude will need to know next time? If yes, append to the project GLOSSARY. If no, skip. This is the highest-compounding step. Every glossary term captured today is a shortcut Claude has tomorrow.

**Step 5. HANDOFF (if paused mid-task).** Compose `handoff`. If the operator is closing mid-task with the intent to resume tomorrow or hand to a teammate, invoke handoff. Produce the handoff doc. If the task is fully wrapped, skip.

**Step 6. Tomorrow's top 3.** Ask the operator to name tomorrow's top 3. If they are stuck, offer a draft based on carry-overs, open commitments, and today's blockers. Operator picks.

**Step 7. Deliver the digest.** Output the SESSION CLOSE block per the shape above. Keep the close message short. The operator is closing for the day. Do not be verbose.

**Step 8. Confirm write to disk.** For every file touched (LIVING-NOTES, DECISIONS, HOARD, GLOSSARY, handoff doc), state the path and confirm the write succeeded.

## Examples

**Example 1.** Operator says "wrap up." Skill fires. Runs all six steps. Session produced two decisions, one hoard entry, no new glossary terms, no handoff needed. Digest delivered with tomorrow's top 3. Total elapsed: ~4 minutes.

**Example 2.** Operator says "close out this session, I'm heading to dinner." Skill fires. Detects mid-task pause. Runs steps 1-4, invokes handoff at step 5, skips glossary because nothing new surfaced. Delivers handoff doc path plus tomorrow's top 3.

**Example 3.** Operator says "run the ritual." Skill fires. Asks the one-sentence "what did we work on?" question. Operator answers. Skill runs the six steps. No decisions, no handoff. LIVING-NOTES updated with a light entry. Digest is one paragraph. Operator closes laptop.

**Example 4.** Operator says "before I go, wrap this up." Skill fires. Runs full ritual. Notices this session produced a new term of art the operator kept using. Adds it to the GLOSSARY at step 4. That term will now short-circuit Claude's context load next session. This is the compounding move in action.

## Composes with

- `end-of-day-review`. This skill is the per-session version. `end-of-day-review` is the whole-day version invoked once at the end of the work day. Both can fire in the same day. Multiple session-close rituals during the day plus one end-of-day review at 6 PM.
- `living-notes-hygiene`. Step 1. Non-optional.
- `decision-log`. Step 2. Skip if no decisions locked.
- `hoard`. Step 3. Skip if nothing worth keeping.
- `glossary-builder`. Step 4. Skip if no new terms.
- `handoff`. Step 5. Skip if task is fully wrapped.
- `weekly-review`. Fridays, on top of the daily and session-level rituals.
- `claude-md-hygiene`. Monthly. If enough session-close rituals have run that CLAUDE.md is drifting from reality, run this to reconcile.

## Why this is the ONE habit

Every glossary term captured today is a shortcut Claude has tomorrow. Every hoard entry is a piece of context Claude can reach for. Every decision logged is a fact that stops needing to be re-argued. Every LIVING-NOTES entry is the connective tissue between today's session and next week's session. The end-of-session ritual is the single move that separates operators who USE Claude from operators whose Claude gets smarter about them. Do it every time.
