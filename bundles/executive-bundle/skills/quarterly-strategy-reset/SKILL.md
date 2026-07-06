---
name: quarterly-strategy-reset
description: "Every quarter, run a full strategic reset with the executive: what shifted in the market, what shifted on the team, what shifted in the business model, what is the new focus for the coming quarter, and what dies to make room. Reads the operator's weekly review log and hoard file as input. Appends the reset to a canonical STRATEGY.md at the operator's HQ root. Trigger phrases include 'quarterly reset', 'Q4 planning', 'strategic reset', 'annual planning kickoff', 'what should we stop doing', 'reset the strategy', 'run the quarterly', 'time for the quarterly', 'new quarter planning', 'strategy pass', 'reset the plan', 'refresh the strategy', 'quarterly strategy'. Also invoke implicitly at the start of a new quarter when the operator has not yet run the reset. Do NOT trigger for mid-quarter adjustments (that is a lighter-weight pass, different skill), for annual board-plan drafting (different scope, different audience), or when the operator is running the reset with a co-founder or executive team and needs a collaborative facilitation kit rather than a solo pass."
tools: Read, Write, Edit
---

LAST-VERIFIED: 2026-07-06. Source of truth: the general operator-community practice on quarterly planning (drawn from Andy Grove's writing on management, Doerr's book on objectives, EOS Traction's meeting cadence, Brett K. Moore's operating rhythm). Adapted, not lifted. Re-verify quarterly.

This skill runs a strategic reset at the top of a quarter. The reset is a solo exercise for the operator; the collaborative team version is a different skill. The output is an appended entry in `STRATEGY.md` at the operator's HQ root. The operator uses the entry to anchor the coming quarter's focus, and the pattern of resets over time surfaces which strategic themes are durable and which were noise.

## Step 0: Confirm the quarter, the target file, and the input sources

Confirm the quarter the reset covers (Q4 2026, or whatever). Default target file is `STRATEGY.md` at the operator's HQ root. If it does not exist, create it with a header block.

Standard header block:

```
# STRATEGY

Quarterly strategic resets. Each entry captures what shifted, what focuses next, and what stops.

Read in sequence for pattern-spotting across quarters.

---
```

Input sources: the operator's `REVIEWS.md` (last 13 weekly reviews) and `HOARD.md` (last quarter of entries). Both are read at Step 0. If either does not exist, note that in the reset ("no weekly review log yet; this reset runs on operator input alone") and proceed.

## The five prompts

**Prompt 1: What shifted in the market.**
Two to four bullets. External changes the operator watched this quarter that matter for the business. Competitor moves, customer segment shifts, regulatory changes, macro conditions, technology landscape. Specific.

**Prompt 2: What shifted on the team.**
Two to four bullets. Internal changes to the team's shape, capacity, morale, or leadership. Hires, departures, promotions, structural changes, capability gaps that opened or closed. Specific.

**Prompt 3: What shifted in the business model.**
Two to four bullets. Changes to pricing, packaging, distribution, unit economics, customer acquisition cost, retention curve, or any of the load-bearing model assumptions. If nothing shifted materially, say so; that itself is signal.

**Prompt 4: The new focus for the coming quarter.**
One to three focus bets. Named, scoped, and small enough to actually ship. The operator's discipline is naming three or fewer. A quarter with seven focus bets is a quarter with zero focus. If the operator lists more than three, ask them to cut.

**Prompt 5: What dies to make room.**
Two to five bullets. Named commitments the operator ends to free capacity for the new focus. Projects that stop. Meetings that end. Standards that change. If the operator cannot name what dies, the new focus does not have room and will not ship; surface that pattern.

## Output format

Append to STRATEGY.md in this shape:

```
## [Quarter and Year], reset dated [YYYY-MM-DD]

**Market shifts.**
- [bullet]
- [bullet]

**Team shifts.**
- [bullet]
- [bullet]

**Business model shifts.**
- [bullet]
- [bullet]

**Focus for [next quarter].**
1. [focus bet, scoped, sized]
2. [focus bet]
3. [focus bet]

**What dies to make room.**
- [committed stop]
- [committed stop]

**One sentence framing for the quarter.**
[The operator's one-line strategic frame that connects the focus bets. Read this at the top of every week for the next 13 weeks.]

---
```

Then hand back a short reply:

```
STRATEGY RESET LOGGED
File: [absolute path to STRATEGY.md]
Quarter: [quarter and year]

Read against prior resets: [surface any patterns across the last 4 to 8 quarters that this reset connects to or contradicts]

Suggested next: run `dream-escalation` on the one-sentence framing if the operator wants to check whether the frame is at the right altitude. Update the operator's public plan document (if one exists) with the focus bets. Circulate the "what dies" list to the team.
```

## Pattern-spotting across quarters

After appending, scan prior resets for patterns:

- The same focus bet appearing across two or more quarters without shipping.
- A "what dies" commitment made in a prior quarter that did not actually die.
- A market shift that was named in prior quarters and is still shifting (durable trend) vs one that only appeared once (noise).
- Team shifts that show a pattern (repeated departures at a specific level, hiring in the same function every quarter).

Surface patterns quietly. Do not lecture.

## Voice rules

The reset is in the operator's voice. Working document, not customer-facing. Terse is fine; complete sentences on every bullet is not required.

## Confidentiality

The reset is private to the operator by default. It can become a source document for a board deck, an all-hands, or an investor update, but the transformation from private reset to public document happens in a different skill (`board-deck-draft`, `investor-update`, or `ghost-writer-me-exec`). The reset itself is never distributed as-is.

## When to invoke

Invoke at the start of a new quarter. Invoke when the operator says any trigger phrase. Invoke implicitly when the operator names the coming quarter in passing and has not yet run the reset.

## When NOT to invoke

Do not invoke for mid-quarter adjustments (lighter-weight pass). Do not invoke for annual board planning (different scope). Do not invoke when the operator is running the reset collaboratively with a team; suggest a facilitation kit skill instead.

## Companion skills

Reads `REVIEWS.md` (from `weekly-executive-review`) and `HOARD.md` (from `hoard`). Feeds `board-deck-draft` (which uses the focus bets as the "this quarter plan" section). Complements `dream-escalation` (the one-sentence framing sits at a chosen altitude; escalation checks whether the altitude is right) and `principle-check` (recurring reset themes often surface a durable principle worth capturing).
