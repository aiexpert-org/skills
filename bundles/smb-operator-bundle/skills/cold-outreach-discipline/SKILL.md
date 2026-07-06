---
name: cold-outreach-discipline
description: "Enforce the sender-reputation guardrails before any cold email or LinkedIn campaign. Checks the sending domain's warm-up state, the daily volume cap for the sender, the suppression list, the SPF / DKIM / DMARC setup, and the last 30 days of reply and bounce metrics. Refuses to greenlight a send if reputation is at risk. Trigger phrases include 'cold email', 'cold outreach', 'outbound campaign', 'am I ready to send more', 'warming plan', 'reputation check', 'can I send today', 'send campaign', 'launch outbound', 'daily send limit', 'warm the inbox', 'DKIM check', 'blast this list', 'ready to send'. Use when the operator is about to send outbound at any scale beyond a personal one-to-one email. Do NOT trigger for one-off replies to warm inbound, for internal team emails, or for transactional sends (order confirmations, receipts)."
---

LAST-VERIFIED: 2026-07-06. Source of truth: Maildoso and Instantly warming conventions, DMARC.org guidance, current Google Postmaster Tools thresholds.

This skill is the guardrail between the operator's cold outbound ambition and the deliverability disaster on the other side. Small business owners burn their sending domain by sending 500 emails on day one from a cold Google Workspace address. This skill prevents that. It refuses a green light until the sender is actually ready, and gives a warming plan if not.

## When to use

- Before any outbound campaign of 20+ cold sends per day.
- Before adding a new sending domain or new SDR seat.
- Weekly, to verify the sender is still healthy.
- When bounces spike or reply rate collapses.

## When NOT to use

- Replying to a warm inbound. Not cold.
- Internal team communication.
- Transactional email (order confirmations, password resets).
- Personalized one-off emails to specific known contacts.

## What you'll produce

```
COLD OUTREACH READINESS CHECK
[Sender: sender@domain.com]
[Date]

REPUTATION STATE
- Domain age: [X months]
- SPF: [pass / fail]
- DKIM: [pass / fail]
- DMARC: [none / quarantine / reject / missing]
- Last 30d bounce rate: [X%]
- Last 30d reply rate: [X%]
- Last 30d spam complaints: [X per 1000]

DAILY VOLUME RECOMMENDATION
- Today's safe cap: [N sends]
- Reason: [warming phase / healthy / cooling-down after bounces / paused]

SUPPRESSION LIST
- Total suppressed: [N]
- Reasons: [X% unsubscribed, Y% bounced, Z% complained]
- Recent additions in the last 7 days: [N]

GREENLIGHT: [YES / NO / CONDITIONAL]
[If NO: what needs fixing before sending. If CONDITIONAL: what to change in the campaign.]

SUGGESTED NEXT SKILLS
- Want me to draft the outbound copy? Run `ghost-writer-me` (draft-only, does not send).
- Want to log the warming milestone? Run `decision-log`.
```

## Instructions

**Step 0. Lock four things.**
1. **The sending inbox.** Which email address is sending? What sending platform (Maildoso, Instantly, Smartlead, GHL, or raw Gmail)?
2. **Domain age.** How long has the domain been sending mail? Under 6 months = fragile. 6 to 12 months = maturing. 12+ months = mature.
3. **Volume target.** How many sends does the operator want today?
4. **Today's date.** Run `date +%Y-%m-%d`.

**Step 1. Verify DNS.** Check SPF, DKIM, DMARC records for the sending domain. Run `dig` via bash if MCP-connected. If SPF or DKIM is missing, the campaign is not shippable at any volume; hard stop.

**Step 2. Read the last 30 days of metrics.** Bounce rate above 3% is a red flag. Reply rate below 1% suggests copy or targeting problems. Spam complaint rate above 0.1% (1 per 1000) is a killer.

**Step 3. Apply the warming curve.**
- **Days 1-14 (new domain or new seat):** 5 to 10 sends per day. Manual sends only.
- **Days 15-30:** 25 to 40 per day.
- **Days 31-60:** 60 to 100 per day, if bounce rate stays under 2%.
- **Days 61+:** 150 to 250 per day, if metrics stay clean.

**Step 4. Check the suppression list.** Every cold campaign must run against a suppression list. If the operator does not have one, refuse the send until one is scaffolded.

**Step 5. Deliver the greenlight decision.**
- **YES:** the sender is healthy, the volume is inside the safe cap.
- **CONDITIONAL:** the sender is healthy but the operator's volume target exceeds the cap. Recommend a smaller batch.
- **NO:** deliverability is at risk. Name what to fix (DNS, warming, list hygiene) before sending.

## Examples

**Example 1.** Operator says "am I ready to send 200 cold emails today from my new domain?" Skill fires. Domain is 21 days old. Recommends CONDITIONAL: send 40 today, ramp weekly, target 200/day at day 60.

**Example 2.** Operator says "I want to launch the Q3 outbound campaign this week." Skill fires. Checks DKIM (missing). Delivers NO greenlight until DKIM is set up. Provides the DKIM record to add to the domain.

**Example 3.** Operator says "quick reputation check on my sender." Skill fires. Runs the metrics pull. Reports domain is healthy, safe daily cap is 180 sends today.

## Composes with

- `ghost-writer-me`. drafts campaign copy in operator voice, does not send.
- `ghl-workflow-templates`. sets up the suppression list and outbound workflow in GHL.
- `decision-log`. captures the domain-warming plan as a locked decision.
