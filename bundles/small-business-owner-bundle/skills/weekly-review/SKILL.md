---
name: weekly-review
description: "Run the operator's Friday weekly review across pipeline hygiene, network review, decisions logged, top-3 outcomes shipped, and priorities for next week. Umbrella skill that composes `sales-pipeline-hygiene`, `weekly-network-review`, and reads from `decision-log` and daily logs. Trigger phrases include 'weekly review', 'Friday review', 'week wrap', 'how did this week go', 'plan next week', 'weekly retro', 'week in review', 'weekly close-out', 'end of week', 'weekly rhythm', 'Friday close', 'week summary', 'weekly reset', 'reset for next week'. Use at the end of the operator's work week (Friday afternoon, weekend morning) as the operating rhythm anchor. Do NOT trigger for a single business function review (route to the specific skill: `sales-pipeline-hygiene`, `weekly-network-review`), for a daily close-out (route to `end-of-day-review`), or for a quarterly review (that is a heavier artifact)."
---

LAST-VERIFIED: 2026-07-06. Source of truth: SMB operating rhythm consensus from AI Expert client playbook; composes with the other bundle skills.

This skill is the operator's Friday operating rhythm anchor. Small business owners work hard all week and then blur through the weekend without a clean stop. The weekly review is the stop. It reviews the week's ships, the pipeline, the network, the decisions, and drafts next week's priorities. The operator walks into Monday with a plan instead of a memory of last Friday.

Output: a dated weekly review doc at `weekly-reviews/YYYY-Www.md` plus a chat digest.

## When to use

- Friday afternoon or evening.
- Saturday morning if Friday got busy.
- Before a weekly one-on-one with a business partner or coach.
- Before a quarter close, as the last of 12-13 weeklies.

## When NOT to use

- The operator is running a daily close (route to `end-of-day-review`).
- The operator only wants pipeline or only wants network review (route to the specific skill).
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

PIPELINE STATE
[Rollup from `sales-pipeline-hygiene`: stuck deals, forecast, kills.]

NETWORK STATE
[Rollup from `weekly-network-review`: reach-outs done, reach-outs missed, red-bucket count.]

DECISIONS LOGGED THIS WEEK
- [Decision title, date]

HOARD ENTRIES THIS WEEK
- [Snippet title, tag]

NEXT WEEK'S TOP 3
1. [Priority]
2. [Priority]
3. [Priority]

BLOCKERS TO CLEAR OVER THE WEEKEND
- [Blocker, owner]

FRIDAY REFLECTION
[One or two sentences: how did the week feel? What's the operator noticing?]

SUGGESTED NEXT SKILLS
- Want to draft next week's opening message to the team? Run `ghost-writer-me`.
- Any locked decisions to add? Run `decision-log`.
```

## Instructions

**Step 0. Lock five things.**
1. **The week ending date.** Run `date +%Y-%m-%d`. Confirm.
2. **The week's daily logs.** Read `daily-log/` for the week if it exists.
3. **The week's decisions.** Read `DECISIONS.md` for entries dated this week.
4. **The pipeline and network sources.** Same as `sales-pipeline-hygiene` and `weekly-network-review`.
5. **The operator's coach or partner cadence.** Is this review going to be shared with anyone? Adjust tone accordingly.

**Step 1. Compose the sub-skill outputs.** Run `sales-pipeline-hygiene` as a rollup (not full detail). Run `weekly-network-review` as a rollup. Pull hoard entries and decision entries by date filter.

**Step 2. Ask the operator for the human parts.**
- Top 3 outcomes shipped (they know what mattered; the log is just evidence)
- Next week's top 3 priorities (only they can name these)
- Friday reflection (a couple of sentences, honest)

**Step 3. Draft the doc.** Use the shape above. Keep the pipeline and network sections tight; the full details live in their own weekly review files.

**Step 4. Show and confirm.** Operator approves or adjusts.

**Step 5. Write to disk.** Save to `weekly-reviews/YYYY-Www.md`.

**Step 6. Deliver the digest.** Short chat message with the week's headline and next Monday's top 3.

## Examples

**Example 1.** Operator says "Friday review, let's close the week out." Skill fires. Runs pipeline hygiene rollup (2 stuck deals, $80K weighted, on target). Runs network review (5 reach-outs done, 2 missed). Pulls 1 decision logged (moved pricing to $1,497). Asks for top 3 ships and next week priorities. Delivers full weekly review doc.

**Example 2.** Operator says "how did this week go?" Skill fires. Pulls all data. Delivers the retro digest. Operator adjusts and signs off.

**Example 3.** Operator says "plan next week." Skill fires. Runs the retro first to inform planning, then focuses the digest on the next-week section.

## Composes with

- `sales-pipeline-hygiene`. pipeline data source.
- `weekly-network-review`. network data source.
- `decision-log`. decisions logged this week.
- `hoard`. snippets captured this week.
- `end-of-day-review`. daily logs feed the weekly.
- `ghost-writer-me`. drafts the Monday opening message to the team.
