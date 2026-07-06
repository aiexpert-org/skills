---
name: mls-follow-up
description: "Run the post-showing or post-open-house follow-up sequence for a real estate agent. Drafts the initial thank-you within 24 hours, the feedback-capture ask, the 30/60/90 day nurture cadence, and the timing to circle back when a matching new listing hits the MLS. Trigger phrases include 'MLS follow-up', 'post-showing follow-up', 'after the open house', 'after open house', 'follow up with the buyer', 'follow up on the showing', 'nurture the buyer', 'nurture buyer', 'circle back on listings', 'circle back when a new listing hits', 'thank-you note for the tour', 'send a thank you after the showing', 'set up the nurture cadence', 'add to my follow-up sequence', 'they didn't write, now what', 'showing didn't convert'. Fires whether the buyer wrote an offer, said 'not this one,' or went silent. Do NOT trigger when the buyer already wrote an offer that's under negotiation (route to transaction-milestones), when the agent is asking for a cold-outreach message to someone who never toured, or when the agent wants a full referral pipeline review (route to referral-tracking). Altitude is execution stage. Output is a set of ready-to-send messages plus a nurture calendar the agent can drop into GHL, BoldTrail, or Follow Up Boss."
---

LAST-VERIFIED: 2026-07-06. Source: BNB AI Solutions monthly cadence pattern, Buddy Buck's Tuesday client-update automation (Producer Pack), and standard NAR-vetted follow-up cadence.

Real estate agents lose more deals in the 30 days after a showing than in the showing itself. Buyers ghost. Sellers hear from the other agent. The follow-up sequence is the discipline that keeps the agent in front of the buyer without being annoying. This skill runs it.

Output is permanent. Messages get logged to `follow-ups/{buyer-name}/YYYY-MM-DD.md` (or the equivalent in the agent's CRM). The nurture calendar goes to the agent's task manager or GHL sequence.

## When to use

- Within 24 hours of a showing that did not result in an offer.
- Within 24 hours of an open house (batch across every visitor who signed in).
- Any time the agent says "I need to circle back with someone who toured months ago."

## When NOT to use

- The buyer already wrote an offer. Route to `transaction-milestones`.
- The person never toured. Route to a cold-outreach skill or ask for one.
- The agent wants a full referral pipeline review. Route to `referral-tracking`.

## What you'll produce

```
FOLLOW-UP PLAN
Buyer / Visitor: {Name(s)}
Origin: {Showing at X / Open House at Y}
Date of origin: {YYYY-MM-DD}

MESSAGE 1 , Same day thank you (send within 24 hours)
{Ready-to-send text, 3 to 4 sentences, no em dashes, matches agent voice.}

MESSAGE 2 , Feedback ask (send 48 to 72 hours after)
{Ready-to-send text with one specific question about the property they toured.}

MESSAGE 3 , Value-add nurture (send 14 days out)
{New listings matching their criteria, or a neighborhood insight, or a market update.}

MESSAGE 4 , Circle back (send 30 days out)
{Check-in on their search, offer a coffee or quick call.}

MESSAGE 5 , Long nurture (60 days out)
{Market update tied to their price range or neighborhood.}

MESSAGE 6 , Long nurture (90 days out)
{Anniversary of the tour, quick check-in, offer to run fresh comps.}

MLS TRIGGER RULES
- New listing under $X in {zip codes}: send within 2 hours.
- Price cut on a property they toured: send within 24 hours.
- Comparable that sold: send within 48 hours with the "here's what things are trading at" frame.

NURTURE CALENDAR
- {Date}: Message 1
- {Date}: Message 2
- {Date}: Message 3
- {etc}

SUGGESTED NEXT SKILLS
- Buyer wrote an offer? Move to `deal-doc-review`.
- Need to log the tour outcome for the weekly review? Run `agent-weekly-review`.
```

## Instructions

**Step 0. Lock four things.**
1. **Who the follow-up is for.** Name, email, phone. Confirm spelling.
2. **What they toured or attended.** Property address, showing type (private tour, open house, second showing).
3. **Their state.** Ghosted, said no, said maybe, still deciding, wrote on a different property.
4. **Their criteria.** Price range, beds/baths, zip codes, must-haves. If missing, ask the agent to fill from memory.

State back and get a nod.

**Step 1. Draft Message 1 (same-day thank you).** Personal, references one specific thing about the tour or property. Under 60 words. Matches the agent's voice per any voice corpus available. Never says "just following up."

**Step 2. Draft Message 2 (feedback ask).** One question. Specific. Not "any thoughts?" Instead: "You mentioned the kitchen felt small. Was that the dealbreaker, or was it the price?"

**Step 3. Draft Messages 3 through 6.** Each with a specific reason to reach out. No filler. If the agent has an AI Sphere vault, pull one relevant sphere data point per message (a market stat, a recent sale, a neighborhood update).

**Step 4. Set the MLS trigger rules.** Convert the buyer's criteria into concrete filters (max price, min beds, zip codes). Write the trigger rules so the agent (or an automation) knows exactly when to send an unscheduled listing alert.

**Step 5. Build the nurture calendar.** Concrete dates. If the agent uses GHL, format as a copy-pasteable sequence with day offsets.

**Step 6. Offer next moves.** Log to CRM? Schedule the sends? Bundle with other post-tour follow-ups from this weekend?

## Examples

**Example 1.** Agent says "after open house at 1247 Oak on Sunday, I had 14 sign-ins, need to follow up." Skill fires. Asks whether to build one master template or 14 personalized. Produces both a template and a per-visitor customization guide.

**Example 2.** Agent says "the Ridgeways toured 823 Main yesterday, want to nurture." Skill fires. Pulls buyer profile if available. Drafts the six-message sequence with Ridgeway-specific hooks.

**Example 3.** Agent says "showing didn't convert, now what." Skill fires. Asks who, what property, what state they left in. Produces the sequence.

## Composes with

- `showing-prep`. runs before the tour that this skill follows up on.
- `transaction-milestones`. if the follow-up converts into an offer.
- `referral-tracking`. if a follow-up conversation surfaces a referral.
- `agent-weekly-review`. end-of-week roll-up of all active follow-ups.
