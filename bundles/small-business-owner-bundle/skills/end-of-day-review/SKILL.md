---
name: end-of-day-review
description: "Run the end-of-day closing ritual on the operator's work day. Reviews what shipped today, what's blocked, what's carrying over, and what tomorrow's top 3 priorities are. Writes a dated entry to a daily log and hands back a short close-out message. Trigger phrases include 'end of day', 'wrap up', 'shutting down', 'eod review', 'what did I ship today', 'closing out the day', 'day wrap', 'end of day review', 'log the day', 'day summary', 'shut it down', 'wrap this up', 'log today', 'day close'. Use at the end of a work day when the operator is closing their laptop. Do NOT trigger mid-day when the operator is still actively working, when the operator says they'll log it themselves, or when no daily log location is defined and the operator doesn't want one scaffolded."
---

LAST-VERIFIED: 2026-07-06. Source of truth: adapted from Brett K. Moore's `System/skills/end-of-work-checklist/SKILL.md` in the Brett K Moore HQ vault, scoped for SMB daily rhythm rather than per-session.

This skill closes the operator's work day cleanly. Small business owners bleed context every night. They leave 3 open browser tabs, half-finished sentences, and a mental note that never gets written down. The next morning they've forgotten what mattered. This skill fixes the bleed. It writes down what shipped, what's blocked, and what's next, then hands back a short confirmation.

Output: a dated entry in `daily-log/YYYY-MM-DD.md` (or the operator's preferred log location) plus a short chat digest.

## When to use

- End of the work day. Usually 5 PM to 7 PM.
- Before a long break (weekend, vacation, holiday).
- Any time the operator says "I need to stop for the day."

## When NOT to use

- The operator is mid-task and just took a break.
- The operator explicitly says "don't log it, I'm just closing my laptop."
- No daily log location is defined and the operator doesn't want one.
- The day was so light there is nothing worth logging.

## What you'll produce

```
END OF DAY: [YYYY-MM-DD]

WHAT SHIPPED
- [Task, one line]
- [Task, one line]

WHAT'S BLOCKED
- [Blocker, why, who owns unblocking]

WHAT'S CARRYING OVER
- [Task, why it moved to tomorrow]

TOMORROW'S TOP 3
1. [Highest-priority thing]
2. [Second highest]
3. [Third]

NOTES / OPEN LOOPS
- [Anything the operator wants to remember but doesn't fit above]

SUGGESTED NEXT SKILLS
- Want to hand off any open task to a teammate? Run `handoff`.
- Any decision to log from the day? Run `decision-log`.
```

## Instructions

**Step 0. Lock four things.**
1. **The date.** Run `date +%Y-%m-%d` via bash. Do not infer.
2. **The daily log location.** Default: `daily-log/YYYY-MM-DD.md` in the operator's HQ. If none, offer to scaffold.
3. **What happened today.** Ask the operator to read back or type out the day's ships, blocks, and carry-overs. Don't invent them.
4. **Tomorrow's top 3.** Ask the operator. If they're stuck, offer a top-3 draft based on carry-overs and open commitments; operator picks.

**Step 1. Draft the entry.** Use the shape above. Keep each bullet under 15 words. This is a scan, not an essay.

**Step 2. Ask for confirmation.** Show the draft. Operator approves or adjusts. Never write without approval.

**Step 3. Write to disk.** Save the entry. If a prior day's log exists, append or create a new dated file per the operator's convention.

**Step 4. Deliver the digest.** Chat message: "Day logged. Top 3 tomorrow: [1, 2, 3]. Enjoy the evening." Keep it short. The operator is closing for the day.

**Step 5. Offer next-morning tee-up.** Optional: schedule a morning message that pings the operator with tomorrow's top 3 first thing.

## Examples

**Example 1.** Operator says "end of day, log it." Skill fires. Asks what shipped. Operator lists three things. Skill drafts entry. Operator approves. File written. Digest delivered.

**Example 2.** Operator says "I'm wrapping up, what did I get done today?" Skill fires. Reviews session history and open tabs if available. Suggests a draft. Operator adjusts. File written.

**Example 3.** Operator says "shut it down, I need to prep for tomorrow." Skill fires. Runs full close-out plus asks for tomorrow's top 3 as a forcing function.

## Composes with

- `handoff`. passes any open task to a teammate before closing.
- `decision-log`. captures any decisions locked during the day.
- `weekly-review`. the daily log is the input to Friday's weekly review.
