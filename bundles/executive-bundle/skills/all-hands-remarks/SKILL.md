---
name: all-hands-remarks
description: "Draft executive remarks for an all-hands or town-hall meeting. Produces a five-part structure — context, what shipped, what's next, the ask, and the emotional close — in the executive's voice, calibrated to whether the meeting is routine, celebratory, or hard. Trigger phrases include 'all-hands remarks', 'town hall script', 'quarterly meeting remarks', 'company update speech', 'draft my all-hands', 'CEO remarks', 'all-hands opening', 'quarterly all-hands'. Do NOT trigger for a hard layoff or restructure announcement (route to `layoff-comms`) or for a board-only communication (route to `board-deck-draft` or `investor-update`)."
---

LAST-VERIFIED: 2026-07-06. Source of truth: Brett K. Moore, AI Expert Marketplace v1.1.0.

This skill drafts executive remarks for an all-hands meeting. It produces a five-part structure the executive can deliver in 8 to 12 minutes.

All-hands remarks are the executive's most public single artifact. They set the emotional temperature of the company. Done well they align everyone around the same three priorities. Done badly they leak signal to competitors and confuse the team.

## When to use

- Monthly or quarterly all-hands is coming up.
- A milestone (fundraise, launch, big customer win) needs a public internal moment.
- A tough quarter needs the executive to say the true thing without spinning.
- The team has drifted and needs a re-anchor to the strategy.

## When NOT to use

- The topic is a layoff or restructure — route to `layoff-comms`.
- The topic is board-only or investor-only — route to `board-deck-draft` or `investor-update`.
- The topic is a single person's promotion or exit announcement (that is a shorter, targeted comms).

## Inputs the operator provides

- Meeting type (routine monthly, quarterly, milestone, hard quarter).
- The three specific things the executive wants the team to walk out remembering.
- Any specific numbers, wins, or losses to name.
- Any specific team member to name credit to.
- Length target (default 8 to 12 minutes).

## The five-part structure

1. **Context.** Where are we in the quarter, the year, the market. One paragraph. Sets the frame.
2. **What shipped.** The three specific things that shipped since the last all-hands. Name the people. Show the receipts (metrics, customer quotes, screenshots).
3. **What's next.** The three specific priorities for the next 30 to 90 days. Frame each as an outcome, not an activity.
4. **The ask.** What the team needs to do differently, or focus on more, or stop doing. Specific. Time-bounded. One or two asks, not a laundry list.
5. **The emotional close.** Why the work matters. Named person or named customer. Not a mission statement. A moment.

## Output shape

A structured Markdown doc the executive can read from a phone or teleprompter:

```
ALL-HANDS REMARKS — [DATE]
Length target: [X minutes]

## Context (1 min)

[Draft paragraph.]

## What shipped (3 min)

1. [Ship + person named + metric or customer quote]
2. [Ship + person named + metric or customer quote]
3. [Ship + person named + metric or customer quote]

## What's next (3 min)

1. [Priority framed as outcome + owner + timeline]
2. [Priority framed as outcome + owner + timeline]
3. [Priority framed as outcome + owner + timeline]

## The ask (2 min)

[One or two specific asks, time-bounded.]

## The close (1 min)

[Named person or named customer. A moment, not a mission statement.]

## Speaker notes

- Look up at the team, not down at the doc, at these three moments: [...].
- Pause after "what's next" before moving to the ask.
- If challenged in Q&A about [likely question], the answer is: [...].
```

## Tone calibration

- **Routine monthly.** Warm but businesslike. Get through the five parts in 8 minutes.
- **Celebratory.** Slow down on "what shipped." Name more people. Extend the close.
- **Hard quarter.** Do not spin. Name the miss in "context," take responsibility in "the ask" if the executive owns the miss, and rebuild in "what's next." Do not use the words "essentially," "seamless," or "unfortunately."

## Voice rules

- No em dashes.
- No banned vocabulary from the AI Expert voice standard.
- No "X, not Y" copywriting patterns.
- No emojis.
- Name people. Real names, not "the team."
- Named customer wins beat aggregate metrics.

## Related skills

- `layoff-comms` — for the specific case of headcount reductions or restructures.
- `hard-conversation` — for the private prep before an all-hands where the executive knows a specific person is going to push back.
