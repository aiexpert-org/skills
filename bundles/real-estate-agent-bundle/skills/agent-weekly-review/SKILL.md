---
name: agent-weekly-review
description: "Run the weekly review for a real estate agent. Rolls up active deals status, pipeline movement, referrals sent and received, this week's showings and appointments, next week's calendar, and the agent's focus for next week. Produces a scannable one-page summary the agent reads Friday afternoon or Sunday morning. Trigger phrases include 'agent weekly review', 'Friday agent review', 'weekly RE review', 'how did this real estate week go', 'weekly review as an agent', 'week wrap for real estate', 'Sunday RE review', 'real estate weekly roll-up', 'run the agent Friday review', 'wrap the week', 'end of week for my business', 'review my week as an agent'. Fires Friday afternoon or Sunday morning by default. Do NOT trigger when the agent is running a network review beyond deals (route to referral-tracking for referral partners specifically), when the agent is on a specific deal check (route to transaction-milestones), or when the agent is prepping for a specific appointment (route to the appropriate prep skill). Altitude is tracking + planning stage. Output is permanent: writes to weekly-reviews/YYYY-WW.md. This is the agent-specific analog to Brett's end-of-work-checklist, scoped to real estate agent's business rhythm."
---

LAST-VERIFIED: 2026-07-06. Source: BNB AI Solutions monthly cadence (3rd/4th/5th) scaled to a weekly rhythm, Buddy Buck's Tuesday client-update cadence, and Brett K. Moore's end-of-work-checklist pattern adapted to a real estate agent's business week (not a single session).

Real estate agents drift week to week without a review ritual. Deals slip because nobody rolled up what happened. Referrals fade because nobody counted them. This skill runs the ritual. It costs 15 minutes and prevents 15 lost hours the following week.

Output is permanent. Weekly review file at `weekly-reviews/YYYY-WW.md`. Compounds over time into a searchable record.

## When to use

- Friday afternoon at end of business.
- Sunday morning before the week starts.
- Any time the agent asks "how did this week go."
- The last day of each month (which then anchors the monthly roll-up).

## When NOT to use

- Full referral network audit. Route to `referral-tracking`.
- Specific deal check. Route to `transaction-milestones`.
- Appointment prep. Route to the appropriate prep skill.

## What you'll produce

```
AGENT WEEKLY REVIEW
Week of: {Monday date} to {Friday date}
Agent: {Name}

TOP-LINE
- Deals closed this week: {N} (${volume})
- Deals under contract: {N}
- New buyers signed: {N}
- New listings signed: {N}
- Showings run: {N}
- Open houses hosted: {N}
- Listing appointments run: {N}

ACTIVE DEALS STATUS
- {Address}: {stage}. Next milestone: {}. Status: {green / yellow / red}.
- {Repeat per deal.}

PIPELINE MOVEMENT
- Buyers advancing: {N, names}
- Buyers stalling: {N, names, reason}
- Listings picking up traffic: {names}
- Listings needing a nudge: {names, suggested move}

REFERRALS
- Sent this week: {N, to whom, on what}
- Received this week: {N, from whom, status}
- Owe a thank-you: {names}

NEXT WEEK'S CALENDAR
- Showings: {N, list}
- Listing appointments: {N, list}
- Open houses: {N, list}
- Buyer consultations: {N, list}
- Other: {}

FOCUS FOR NEXT WEEK
{2 to 4 items. Concrete. What the agent will move on.}

WHAT WORKED THIS WEEK
- {1 to 3 bullets.}

WHAT DIDN'T
- {1 to 3 bullets. Blunt.}

BUSINESS HEALTH NOTE
{One line. State of the business this week.}

SUGGESTED NEXT SKILLS
- Need to prep for Monday's first showing? Run `showing-prep`.
- Time to run the monthly referral roll-up? Run `referral-tracking`.
- Any decisions to log from this week? Consider a decision-log entry.
```

## Instructions

**Step 0. Lock four things.**
1. **The week window.** Confirm Monday-to-Friday dates. Run date verification. Never infer.
2. **Data sources.** Ask which of: CRM (GHL, BoldTrail, Follow Up Boss), calendar, transaction log, referrals log. Note gaps.
3. **Whether this is a Friday review (looking back) or Sunday review (planning forward).** Different emphasis.
4. **Any headline that already stands out to the agent.** Sometimes the agent already knows the story of the week; use it as the anchor.

State back. Get a nod.

**Step 1. Compute the top-line.** Deals closed, deals under contract, buyers signed, listings signed, showings run, opens hosted, listing appointments. Simple counts.

**Step 2. Read the active deals.** Pull from `transactions/` or the CRM. Note each deal's stage, next milestone, and traffic light (green / yellow / red).

**Step 3. Read the pipeline.** Which buyers are advancing (offers written, tours accelerating), which are stalling (silent 14+ days, backing away). Which listings are getting showings and which are cooling.

**Step 4. Read the referrals.** From `referrals/log.md` if it exists. Referrals sent this week, referrals received, thank-yous owed.

**Step 5. Read next week's calendar.** Sum showings, appointments, opens, consultations. Flag any prep gaps.

**Step 6. Write the focus for next week.** 2 to 4 items. Not aspirational. Concrete moves.

**Step 7. Write what worked, what didn't.** Blunt. This is the section the agent will read again in a month to compound the lesson.

**Step 8. Write the business health note.** One line. "Business is warm; two deals at risk but manageable." Or "Business is thin; only 3 tours next week, needs top-of-funnel push."

## Examples

**Example 1.** Agent says "Friday agent review." Skill fires. Runs date verification. Pulls the week. Produces the review with 2 closed, 3 under contract, 8 showings.

**Example 2.** Agent says "how did this real estate week go." Skill fires. Asks data source access. Produces the review.

**Example 3.** Agent says "Sunday planning for the week ahead." Skill fires. Frames as forward-looking. Emphasizes next week's calendar and focus.

## Composes with

- `transaction-milestones`. deeper detail per deal.
- `referral-tracking`. deeper detail on referral network.
- `mls-follow-up`. status of active nurture sequences.
- `showing-prep`. for Monday's first showing.
- `handoff`. hand the review to a team member if the agent has one.
