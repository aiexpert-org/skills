---
name: weekly-review
description: "Run the operator's Friday weekly review across the week's ships, decisions logged, hoard entries captured, top 3 outcomes, and next week's priorities. Umbrella skill that reads from `daily-log/`, `DECISIONS.md`, and `hoard/playbook.md`. Trigger phrases include 'weekly review', 'Friday review', 'week wrap', 'how did this week go', 'plan next week', 'weekly retro', 'week in review', 'weekly close-out', 'end of week', 'weekly rhythm', 'Friday close', 'week summary', 'weekly reset', 'reset for next week', 'run the weekly'. Use at the end of the operator's work week (Friday afternoon, weekend morning) as the operating rhythm anchor. Do NOT trigger for a daily close-out (route to `end-of-day-review`), for a single-topic review (route to the specific Persona Layer skill), or for a quarterly review (that is a heavier artifact)."
---

LAST-VERIFIED: 2026-07-06. Source of truth: operating rhythm consensus from Brett K. Moore's Essential Bundle design; composes with the other bundle skills as data sources.

This skill is the operator's Friday operating rhythm anchor. Operators work hard all week and then blur through the weekend without a clean stop. The weekly review is the stop. It reviews the week's ships, the decisions logged, the snippets hoarded, and drafts next week's priorities. The operator walks into Monday with a plan instead of a memory of last Friday.

Output: a dated weekly review doc at `weekly-reviews/YYYY-Www.md` plus a chat digest.

## When to use

- Friday afternoon or evening.
- Saturday morning if Friday got busy.
- Before a weekly one-on-one with a business partner or coach.
- Before a quarter close, as the last of 12-13 weeklies.

## When NOT to use

- The operator is running a daily close (route to `end-of-day-review`).
- The operator only wants a specific business function review (route to the Persona Layer skill).
- The operator has no daily logs from the week (the review will be thin; scaffold the daily habit first).

## What you'll produce

```
WEEKLY REVIEW: [Week ending YYYY-MM-DD]

TOP 3 OUTCOMES SHIPPED
1. [What shipped, why it mattered]
2. [What shipped, why it mattered]
3. [What shipped, why it mattered]

WHAT DIDN'T SHIP (AND WHY)
- [Item, blocker, next step]

DECISIONS LOGGED THIS WEEK
- [Decision title, date]

HOARD ENTRIES THIS WEEK
- [Snippet title, tag]

HANDOFFS ISSUED THIS WEEK
- [Handoff title, recipient, status]

NEXT WEEK'S TOP 3
1. [Priority]
2. [Priority]
3. [Priority]

BLOCKERS TO CLEAR OVER THE WEEKEND
- [Blocker, owner]

FRIDAY REFLECTION
[One or two sentences: how did the week feel? What's the operator noticing?]

SUGGESTED NEXT SKILLS
- Any locked decisions to add? Run `decision-log`.
- CLAUDE.md need an update? Run `claude-md-hygiene`.
- LIVING-NOTES.md need its CURRENT STATE block refreshed? Run `living-notes-hygiene`.
```

## Instructions

**Step 0. Lock five things.**
1. **The week ending date.** Run `date +%Y-%m-%d`. Confirm.
2. **The week's daily logs.** Read `daily-log/` for the week if it exists.
3. **The week's decisions.** Read `DECISIONS.md` for entries dated this week.
4. **The week's hoard entries.** Read `hoard/playbook.md` for entries dated this week.
5. **The operator's coach or partner cadence.** Is this review going to be shared with anyone? Adjust tone accordingly.

**Step 1. Compose the data.** Pull daily logs, decision entries, hoard entries, and any handoffs issued this week by date filter.

**Step 2. Ask the operator for the human parts.**
- Top 3 outcomes shipped (they know what mattered; the log is just evidence)
- Next week's top 3 priorities (only they can name these)
- Friday reflection (a couple of sentences, honest)

**Step 3. Draft the doc.** Use the shape above. Keep each section tight; the details live in the underlying dated files.

**Step 4. Show and confirm.** Operator approves or adjusts.

**Step 5. Write to disk.** Save to `weekly-reviews/YYYY-Www.md`.

**Step 6. Deliver the digest.** Short chat message with the week's headline and next Monday's top 3.

## Examples

**Example 1.** Operator says "Friday review, let's close the week out." Skill fires. Pulls 5 daily logs, 3 decisions, 8 hoard entries. Asks for top 3 ships and next week priorities. Delivers full weekly review doc.

**Example 2.** Operator says "how did this week go?" Skill fires. Pulls all data. Delivers the retro digest. Operator adjusts and signs off.

**Example 3.** Operator says "plan next week." Skill fires. Runs the retro first to inform planning, then focuses the digest on the next-week section.

## Composes with

- `end-of-day-review`. daily logs feed the weekly.
- `decision-log`. decisions logged this week get rolled up.
- `hoard`. snippets captured this week get surfaced.
- `handoff`. handoffs issued this week get counted.
- `living-notes-hygiene`. LIVING-NOTES.md CURRENT STATE block gets refreshed on Friday.
