---
name: weekly-executive-review
description: "Run the executive's Friday (or end-of-week) review: biggest wins this week, biggest concerns, top three moves for next week, decisions made, decisions deferred, an energy and health check, and the one thing worth thinking about over the weekend. Appends the review to a canonical REVIEWS.md at the operator's HQ root. Trigger phrases include 'executive review', 'Friday exec review', 'how did this week go for me', 'what should I be thinking about', 'weekly review', 'end of week review', 'week wrap', 'weekly executive log', 'run my weekly', 'time to run my review', 'Friday check-in with myself', 'weekly check', 'reflect on this week'. Also invoke implicitly at the end of the operator's business week when the operator has not yet run the review. Do NOT trigger for a mid-week status check (that is a different rhythm), for a team meeting recap (different genre, different audience), or when the operator is heading into weekend rest and does not want a work review; ask first if the timing is ambiguous."
tools: Read, Write, Edit
---

LAST-VERIFIED: 2026-07-06. Source of truth: the general operator-community practice on weekly reviews (drawn from the SPACE framework in engineering leadership, the widespread executive practice of a Friday one-pager, Brett K. Moore's operating rhythm). Re-verify quarterly.

This skill runs the executive's weekly review. The review has seven prompts. The output is an appended entry in `REVIEWS.md` at the operator's HQ root (or the closest equivalent). The review is for the operator only; it is not distributed, not shared, not shipped to a team. Its whole purpose is the operator's own strategic pattern-spotting over time.

## Step 0: Confirm the target file and the week

Target file default: `REVIEWS.md` at the operator's HQ root. If it does not exist, create it with a header block and start appending.

Standard header block:

```
# WEEKLY EXECUTIVE REVIEWS

Private working log. One entry per week. Never shared. Never edited after the fact.

Pattern-spotting compounds over time; re-read prior entries during the quarterly strategy reset.

---
```

Confirm the week the entry covers. Default is "the week ending today." If the operator is running the review on a Monday for the prior week, confirm.

## The seven prompts

Every review runs the same seven prompts, in this order. The order matters; changing it changes the reflection.

**Prompt 1: Biggest wins this week.**
Two to five bullets. Specific. Wins the operator noticed at the time and wins they only noticed on reflection.

**Prompt 2: Biggest concerns.**
Two to five bullets. Named specifically. Not "the team is stressed" but "the head of product is losing confidence in the Q4 launch date." Concerns that got worse this week and concerns that were dormant but showed a small signal.

**Prompt 3: Top three moves for next week.**
Three specific things. Named, scoped, owned by the operator. Not a to-do list; the operator's three highest-impact moves.

**Prompt 4: Decisions made this week.**
List. What locked. Even small ones. If a decision locked but has not been logged in a proper decision log yet, flag it and suggest running `decision-quality-check` retroactively or logging via the operator's decision-log tooling.

**Prompt 5: Decisions deferred.**
List. What did not lock and why. Deferred decisions accumulate; if the same decision has been deferred four weeks in a row, surface the pattern.

**Prompt 6: Energy and health check.**
Three questions. Sleep this week (average hours, quality). Physical activity (any at all). One personal thing worth naming (family, health, something non-work that mattered). This block is short. It is not a therapy session. It is a durable signal the operator can look at across quarters.

**Prompt 7: One thing to think about over the weekend.**
The single strategic question the operator wants their subconscious to work on over the weekend. Not a task. A question. If the operator cannot name one, that is a signal too; the week may have been executional rather than strategic and the operator can decide whether to shift altitude next week.

## Output format

Append to REVIEWS.md in this exact shape:

```
## Week ending [YYYY-MM-DD]

**Wins.**
- [bullet]
- [bullet]

**Concerns.**
- [bullet]
- [bullet]

**Top three moves for next week.**
1. [move]
2. [move]
3. [move]

**Decisions locked.**
- [decision] ([log location if logged])
- [decision]

**Decisions deferred.**
- [decision] (why deferred: [reason])

**Energy and health.**
Sleep: [avg hours, quality note]. Movement: [any activity]. Personal: [one thing worth naming].

**One thing to think about over the weekend.**
[The single strategic question.]

---
```

Then hand back a short reply to the operator:

```
REVIEW LOGGED
File: [absolute path to REVIEWS.md]
Week: [week-ending date]

Patterns from prior weeks: [if any recurring themes across the last 4 to 6 weeks, surface them here. If not, "no strong patterns yet, compound signal builds over time."]

Suggested next: [if the operator flagged an unlogged decision, suggest running the operator's decision-log tool. If the operator flagged a deferred-for-multiple-weeks decision, suggest decision-quality-check to unstick it. Otherwise skip.]
```

## Pattern-spotting across weeks

After appending, scan the prior four to six weekly reviews for patterns:

- The same concern appearing three weeks in a row.
- The same "top move" appearing without progress.
- A slow drift in the energy and health block (progressively less sleep, progressively less movement).
- A deferred decision recurring.

If any pattern emerges, surface it. Do this quietly. The pattern is a signal for the operator, not a lecture from the agent.

## Voice rules

The review is in the operator's voice, private. No polish. Short bullets are better than complete sentences. If the operator's writing is terse, keep it terse. If the operator wants to write full paragraphs on any prompt, honor that.

## Confidentiality

The review is never shared. Never emailed. Never included in a team update. If the operator tries to hand this file to someone else, flag it: "This is your private review. Are you sure you want to share it?" Offer to draft a public-facing weekly update as a separate artifact instead.

## When to invoke

Invoke on the last working day of the operator's week. Invoke when the operator says "Friday exec review" or any of the trigger phrases. Invoke implicitly when the operator names the end of the week and has not yet run a review.

## When NOT to invoke

Do not invoke mid-week (different rhythm). Do not invoke for team-facing recaps (different genre). Do not invoke when the operator is deliberately closing the laptop for a rest day; ask first if the timing is ambiguous.

## Companion skills

Reads from `hoard` output (weekly patterns often show up in the hoard first). Feeds `quarterly-strategy-reset` (which reads the last 13 reviews as input). Complements `principle-check` (recurring patterns across weeks often surface a principle the operator wants to capture).
