---
name: referral-tracking
description: "Maintain the real estate agent's referral pipeline. Tracks who referred whom, the status of each referred lead, the thank-you cadence for the referring party, and the ongoing engagement rhythm with referral partners. Produces a scannable pipeline view with next-move flags. Trigger phrases include 'referral pipeline', 'track this referral', 'log a referral', 'who referred', 'who referred this buyer', 'thank the referral source', 'referral partner review', 'my top referrers this quarter', 'referral tracking', 'update the referral log', 'how are my referrals doing', 'referral status', 'referral roll-up', 'who owes me a thank-you', 'time to check in with my referral partners'. Fires when a referral comes in, when the agent runs a referral roll-up, or when the agent asks who they should be thanking. Do NOT trigger when the agent is running a weekly review across the entire pipeline (route to agent-weekly-review), when the buyer never had a referral source (a walk-in or online lead), or when the agent is asking to draft a single cold outreach. Altitude is planning + tracking stage. Output is permanent: writes to a referrals log the agent can trust as their canonical source. If no log exists, offers to scaffold one at Step 0."
---

LAST-VERIFIED: 2026-07-06. Source: BNB AI Solutions AI Sphere vault schema, Buddy Buck's sphere intelligence brief pattern, and standard real estate referral tracking conventions.

Real estate agents leave money on the table by not tracking referrals. The referral source who sent a $600K buyer three months ago never gets thanked properly, never gets a lead in return, and quietly stops sending. This skill fixes that with a lightweight log and a nudge cadence.

Output is permanent. Log lives at `referrals/log.md` (or `referrals/log.csv` if the agent prefers) in the agent's HQ. Each entry captures who referred whom, when, the current status, and the last thank-you touch.

## When to use

- Every new referral. Log it same day.
- Monthly referral partner roll-up (who sent, who converted, who needs a thank-you touch).
- Quarterly referral engagement review (who's sent nothing in 90+ days, worth a re-engagement).
- Before any referral-partner meeting, event, or dinner.

## When NOT to use

- Weekly pipeline review that covers ALL deals, not just referrals. Route to `agent-weekly-review`.
- The lead had no referral source. This skill assumes a referral chain exists.
- Drafting a single cold outreach message. Route to a cold-outreach skill.

## What you'll produce

```
REFERRAL PIPELINE
Date: {YYYY-MM-DD}

NEW REFERRALS (this period)
- {Buyer/Seller name} , referred by {Source name}, {date}. Status: {new / contacted / touring / under contract / closed / dead}.

ACTIVE REFERRALS BY STATUS
- New (last 7 days): {N}
- Contacted, no meeting yet: {N}
- Touring: {N}
- Under contract: {N}

REFERRAL SOURCES OWED A THANK-YOU
- {Source name}: {reason , new referral, closed deal, milestone}. Suggested touch: {gift / handwritten card / dinner / phone call}.

TOP REFERRERS (last 90 days)
- {Source name}: {N referrals sent, $X in closed volume, $Y in agent commission}.

REFERRAL PARTNERS COOLING OFF
- {Source name}: {last referral date}, {days silent}. Suggested re-engagement move.

NETWORK HEALTH NOTE
{One line: state of the referral network this period.}

SUGGESTED NEXT SKILLS
- Need to draft the thank-you notes? Run `mls-follow-up` in "referral thank-you" mode or a voice-matching skill.
- Ready to roll up all pipeline including non-referral? Run `agent-weekly-review`.
```

## Instructions

**Step 0. Lock four things.**
1. **Referrals log location.** Check `referrals/log.md`, `referrals/log.csv`, or the agent's CRM tag for "referral source." If nothing exists, offer to scaffold `referrals/log.md` with a starter schema.
2. **What the agent is running.** Log a new one, roll up the period, prep for a partner meeting, or run a re-engagement audit.
3. **Period.** For roll-ups, confirm the window (this month, last quarter, YTD).
4. **Today's date.** Run date verification. Never infer.

State back. Get a nod.

**Step 1. If logging a new referral.** Prompt for: buyer/seller name, source name, source relationship (past client, sphere, industry partner), date received, current lead status, agent's next action. Append to log with a stable ID.

**Step 2. If rolling up a period.** Read the log. Filter to the period. Compute: total referrals, conversion rate (converted / total), gross agent revenue from referral deals, top 3 sources by volume, top 3 by revenue.

**Step 3. Identify the thank-you queue.** Any source who sent a referral that closed and hasn't been thanked with a substantive touch (gift, card, dinner, meaningful call , not just a text). Any source celebrating a milestone (birthday, anniversary, work milestone).

**Step 4. Identify cooling partners.** Sources who used to send but haven't in 90+ days. Suggest a re-engagement move per source: a coffee, a market update tied to their interest, a lead sent their direction if the agent has one.

**Step 5. Write the network health note.** One line. Blunt. "Referral network is warm; two sources need a real thank-you this month." Or "Referral network is thinning; four top partners haven't sent in 120 days, needs a push."

**Step 6. Offer next moves.** Draft the thank-you touches? Schedule the partner meetings? Add reminders to the CRM?

## Examples

**Example 1.** Agent says "log this referral, John Smith sent me the Chens." Skill fires. Asks for buyer contact info, lead status, agent next action. Appends to log.

**Example 2.** Agent says "monthly referral roll-up." Skill fires. Reads the log. Filters to this month. Produces the pipeline view with top referrers and the thank-you queue.

**Example 3.** Agent says "who owes me a thank-you." Skill fires. Reads the log. Filters to closed deals in the last 90 days with no thank-you touch logged. Returns the list.

## Composes with

- `mls-follow-up`. drafts the thank-you touches in the agent's voice.
- `agent-weekly-review`. rolls up referral activity as part of the full weekly review.
- `neighborhood-brief`. sometimes bundled with a partner thank-you as a value-add.
