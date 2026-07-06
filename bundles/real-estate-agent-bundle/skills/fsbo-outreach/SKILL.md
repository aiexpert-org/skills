---
name: fsbo-outreach
description: "Run the FSBO (for-sale-by-owner) discovery and outreach sequence for a real estate agent. Identifies recent FSBO listings in the agent's farm, drafts the first-touch outreach that doesn't sound like every other agent, sets the value-add follow-up cadence, and tracks the conversion path from FSBO to signed listing. Trigger phrases include 'FSBO outreach', 'for-sale-by-owner', 'FSBO leads', 'convert FSBO', 'FSBO nurture', 'FSBO in my farm', 'contact this FSBO', 'FSBO on Zillow', 'saw a FSBO sign', 'expired listing plus FSBO', 'reach out to a FSBO', 'FSBO follow-up cadence', 'draft a FSBO letter', 'FSBO conversion sequence'. Fires when the agent spots a FSBO, wants to build a FSBO farming list, or is running the periodic FSBO nurture cycle. Do NOT trigger when the FSBO already agreed to meet (route to listing-presentation), when the agent is asking for a general prospecting script beyond FSBO (out of scope), or when the FSBO already sold (log the outcome and stop). Altitude is planning + execution stage. Output is permanent: writes a per-FSBO tracking file at fsbo/{address}/log.md so the agent has a canonical record of every touch. First-touch messages are drafts. The agent sends them, not the skill."
---

LAST-VERIFIED: 2026-07-06. Source: BNB AI Solutions AI Sphere pattern, standard NAR FSBO outreach conventions, and Buddy Buck's farming patterns for the Duvall market.

FSBO listings are the highest-conversion prospect pool for a real estate agent, but only for the agent who doesn't sound like the ten other agents who called that morning. This skill produces outreach that doesn't feel like outreach and a cadence that outlasts the FSBO's confidence.

Output is permanent. Per-FSBO log at `fsbo/{address}/log.md`. Master FSBO tracking spreadsheet at `fsbo/tracker.md` (or CSV).

## When to use

- Any new FSBO the agent spots on Zillow, Craigslist, a yard sign, or a Facebook post.
- Weekly FSBO farming cycle (pull the newest FSBOs in the agent's zip codes).
- Any FSBO that's been on market 30+ days and might be ready to sign.
- Expired-listing plus FSBO combos where the owner tried an agent and now DIY.

## When NOT to use

- FSBO already agreed to meet. Route to `listing-presentation`.
- FSBO already sold. Log and stop.
- General prospecting script beyond FSBO. Out of scope.

## What you'll produce

For a single new FSBO:

```
FSBO OUTREACH PLAN
Property: {Address}
Owner name (if known): {}
List price: ${}
Days on FSBO: {}
Discovery source: {Zillow / Craigslist / yard sign / referral / other}

INITIAL READ
- {Property strengths.}
- {Property risks.}
- {Owner motivation signals.}

FIRST TOUCH (send within 24-48 hours)
{Ready-to-send text. Not a listing pitch. Offers something valuable , a free CMA, a market update, an open house co-host , without asking for the listing.}

FOLLOW-UP CADENCE
- Day 3: {value-add touch , comps that sold nearby}
- Day 7: {check-in with a specific market insight}
- Day 14: {second value-add , buyer feedback pattern or open house tips}
- Day 21: {soft ask , coffee to compare notes}
- Day 30: {conversion touch , statistics on FSBO-to-agent conversion timing}
- Day 45: {check on price adjustment or listing signal}
- Day 60: {final value-add plus explicit ask if not already declined}

CONVERSION SIGNALS TO WATCH
- Price cut on the FSBO listing.
- Open house scheduled by the owner.
- Change in Zillow description tone.
- New "Motivated seller" language.
- Off-market after 30-45 days (often signals ready-to-list-with-agent).

COMPETITION NOTE
Other agents who typically contact FSBOs in this zip: {}. Differentiation angle: {}.

OWNER'S LIKELY OBJECTIONS
- "I don't want to pay a commission." Response: {}.
- "I want to try this myself first." Response: {}.
- "The last agent didn't do anything." Response: {}.

SUGGESTED NEXT SKILLS
- FSBO agrees to meet? Route to `listing-presentation`.
- FSBO refers a friend who wants to sell? Log via `referral-tracking`.
- FSBO adds to farm cycle? Add to weekly review tracked in `agent-weekly-review`.
```

For a farming cycle:

```
FSBO FARM REPORT
Zip codes: {}
Cycle date: {}

NEW FSBOs THIS CYCLE ({N})
- {Address}: {price, days on FSBO}. First-touch drafted.

ACTIVE FSBO NURTURE ({N})
- {Address}: {day in cadence}. Next touch: {date, type}.

CONVERTED THIS CYCLE ({N})
- {Address}: {signed as listing on date}.

DEAD ({N})
- {Address}: {sold FSBO / relisted with other agent}.
```

## Instructions

**Step 0. Lock four things.**
1. **FSBO source.** Where the agent found the listing. Different sources have different owner mindsets.
2. **Property basics.** Address, list price, beds/baths.
3. **Discovery date.** Determines Day 1 for the cadence.
4. **Agent voice.** Pull from voice corpus if available. FSBOs specifically pattern-match against agent-sounding language; the voice matters.

State back. Get a nod.

**Step 1. Read the property.** Pull the FSBO listing (Zillow, Craigslist, wherever). Note strengths and risks. Note owner motivation signals from the description tone.

**Step 2. Draft the first touch.** Not a pitch. Offer something valuable and specific: comps that sold nearby, a market update on the zip code, buyer feedback patterns from recent showings. The first touch never asks for the listing.

**Step 3. Draft the follow-up cadence.** 7 touches across 60 days. Each with a specific reason. Never generic. If any touch feels like filler, cut it.

**Step 4. Identify conversion signals.** Concrete triggers that mean the FSBO is warming to an agent conversation. Watch the FSBO listing every 3-5 days.

**Step 5. Note the competition.** Other agents likely to be reaching out. Differentiation angle.

**Step 6. Pre-empt objections.** The three standard FSBO objections and the agent's specific responses.

**Step 7. Log the plan.** Write to `fsbo/{address}/log.md`. Add to the master tracker.

## Examples

**Example 1.** Agent says "saw a FSBO sign at 4519 Elm, want to reach out." Skill fires. Asks for list price and any owner info. Drafts first-touch message that offers to send comps. Logs the plan.

**Example 2.** Agent says "weekly FSBO cycle for 98019 and 98077." Skill fires. Asks for the FSBO source list. Produces the farm report.

**Example 3.** Agent says "FSBO on Zillow for 3 weeks, they just dropped price." Skill fires. Reads the drop as a warming signal. Suggests moving from value-add cadence to a soft ask this week.

## Composes with

- `listing-presentation`. activates when the FSBO agrees to meet.
- `referral-tracking`. logs any referral surfaced from FSBO conversations.
- `agent-weekly-review`. rolls up FSBO cycle activity.
- `neighborhood-brief`. provides the market context for the value-add touches.
