---
name: decision-log
description: "Capture a decision the operator just made with full context, alternatives considered, rationale, expected outcome, and a review date. Appends to a canonical `DECISIONS.md` in the operator's HQ. Trigger phrases include 'record this decision', 'log this call', 'we decided to', 'make this a decision', 'capture this', 'log the decision', 'add to decisions', 'record we decided', 'lock this in', 'this is decided', 'we're going with', 'let's log this', 'decision made', 'record my choice', 'lock the decision'. Use when the operator has actually decided something worth remembering (a pricing lock, a hiring call, a partner selection, a product direction). Do NOT trigger for provisional ideas the operator is still thinking through, for tactical notes that belong in a to-do list, or when no DECISIONS.md exists and the operator doesn't want one scaffolded."
---

LAST-VERIFIED: 2026-07-06. Source of truth: DECISIONS.md convention from Brett K. Moore HQ router; adapted from `System/skills/end-of-work-checklist` DECISIONS append flow.

This skill turns fleeting agreements into durable memory. Small business owners re-litigate the same decisions every quarter because they never wrote them down. Six months later they wonder why they changed direction. This skill fixes that. It captures the decision, the alternatives, the rationale, and the review date, then appends to a single canonical file the operator can search.

Output: an appended entry in `DECISIONS.md` at the operator's HQ root.

## When to use

- The operator just made a real decision: a pricing point, a hire, a partner, a product direction, a market to enter, a market to exit.
- After a meeting where a call got made.
- When the operator says "we're going with X" or "we're not doing Y."

## When NOT to use

- The idea is still being explored ("let's think about this").
- The item is tactical ("send Buddy the ROI worksheet"). That's a to-do, not a decision.
- The operator has no HQ file structure yet. Offer to scaffold DECISIONS.md first.
- The operator explicitly says "I'll write it up myself later."

## What you'll produce

An appended entry in this shape:

```
## YYYY-MM-DD: [Decision title]

**Decision:** [One sentence stating what was decided.]

**Alternatives considered:** 
- [Option A]
- [Option B]
- [Option C]

**Rationale:** [Why this and not the alternatives.]

**Expected outcome:** [What we expect to see if this decision was right.]

**Review date:** [When we'll re-check this.]

**Source:** [The conversation, meeting, or LIVING-NOTES entry this came from.]
```

Also delivers a short chat confirmation with the entry title.

## Instructions

**Step 0. Lock four things.**
1. **The decision.** In one sentence, what was decided?
2. **Alternatives.** What options were on the table? At least two.
3. **Today's date.** Run `date +%Y-%m-%d`.
4. **The DECISIONS.md location.** Default: `DECISIONS.md` at the HQ root. Confirm.

**Step 1. Draft the entry.** Fill each field. If the operator can't name alternatives, ask; "we didn't consider any" is fine but rare (usually there was at least a status quo alternative).

**Step 2. Get the review date.** Default: 90 days. Longer for structural decisions (partner splits, business names). Shorter for market experiments (30 days).

**Step 3. Show the draft.** Operator approves or adjusts before writing.

**Step 4. Append to DECISIONS.md.** Use Edit tool. Append at the bottom of the existing entries. Do not overwrite.

**Step 5. Deliver the confirmation.** Chat message: "Locked. Decision logged as `[title]`. Review scheduled [date]."

## Examples

**Example 1.** Operator says "we decided to go with $997 for the Quick Start, not $1,497." Skill fires. Asks for alternatives (which were $497 and $1,497). Asks for rationale ("impulse-buy price beats deliberation-price for solo owners"). Sets review date at 90 days. Appends to DECISIONS.md.

**Example 2.** Operator says "log this call: we're not hiring a full-time editor, we're going AI-native." Skill fires. Alternative: hire an editor. Rationale: cost + speed advantage. Review at 60 days after 10 clients ship.

**Example 3.** Operator says "record this decision, our brand voice bans em dashes forever." Skill fires. Locks the voice rule. Review date: never (structural).

## Composes with

- `end-of-day-review`. surfaces decisions to log at day close.
- `weekly-review`. reviews decisions logged since last week.
- `meeting-prep`. flags decisions the operator will need to make in the meeting.
