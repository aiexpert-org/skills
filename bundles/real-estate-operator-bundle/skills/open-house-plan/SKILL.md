---
name: open-house-plan
description: "Build the full open house prep and follow-up plan for a specific listing. Covers pre-event promotion, signage placement strategy, day-of setup and hosting script, feedback capture form, sign-in strategy, next-showing capture, and the follow-up cadence for every visitor. Trigger phrases include 'open house plan', 'prep for open house', 'prep for the OH', 'OH promotion', 'open house promotion', 'open house follow-up', 'OH strategy', 'run open house at', 'hosting an open house Sunday', 'draft open house flyer', 'open house sign-in strategy', 'get me ready for the open house', 'open house at 2pm', 'need to run an OH for my listing'. Fires 5 to 14 days before the open house for the promotion side and within 24 hours after the open house for the follow-up side. Do NOT trigger when the agent is running a private showing (route to showing-prep), when the follow-up is for a single tour visitor with an established relationship (route to mls-follow-up alone), or when the agent is asking for the listing pitch to a seller (route to listing-presentation). Altitude is planning + execution stage. Output is a plan document plus a set of drafted assets (flyer copy, social posts, sign-in prompts, feedback form) the agent can send to Bannerbear or paste directly."
---

LAST-VERIFIED: 2026-07-06. Source: BNB AI Solutions monthly content cadence (3rd/4th/5th), Buddy Buck's open house patterns, and standard NAR open house best practices.

Open houses are the biggest-payoff moment in a listing when done well and the biggest waste of a Saturday when done badly. The difference is preparation. This skill produces the full plan: pre-event, day-of, post-event. Everything the agent needs to run a booked-out open house that generates 3+ warm leads.

Output is permanent for the plan file and disposable for the day-of scripts. Plan at `open-houses/{address}-{date}.md`. Follow-up messages get logged per visitor once the OH is complete.

## When to use

- 5 to 14 days before an open house.
- Within 24 hours after the open house for follow-up.
- When planning a broker's open (variant of the same plan).

## When NOT to use

- Private showing. Route to `showing-prep`.
- Single-visitor follow-up with an established relationship. Route to `mls-follow-up`.
- Listing pitch to seller. Route to `listing-presentation`.

## What you'll produce

**Pre-event plan:**

```
OPEN HOUSE PLAN
Property: {Address}
Date: {YYYY-MM-DD}, {start time - end time}
Type: {public / broker's open / twilight tour / mega-open}

PRE-EVENT PROMOTION (T-14 to T-2 days)
- MLS open house listing entered: {date}
- Zillow / Redfin / Realtor.com syndication check: {date}
- Instagram post: {date, draft below}
- Facebook event: {date, draft below}
- Facebook post: {date, draft below}
- Neighborhood NextDoor post: {date, draft below}
- Sphere email blast: {date, draft below}
- Postcard mailer to farm: {date if applicable}
- Digital ads on Meta: {yes/no, budget, dates}

DRAFTED PROMOTION ASSETS
[Instagram caption]
{copy}

[Facebook event copy]
{copy}

[Sphere email]
Subject: {}
Body: {copy}

[Postcard headline + body]
{copy}

SIGNAGE PLACEMENT (T-1 day)
- Directional signs: {count, key intersections}
- A-frames: {count}
- Balloons / flags: {yes/no}
- Feather flags at driveway: {yes/no}

DAY-OF SETUP (start 60 min before)
- Refreshments: {yes/no, what}
- Property flyers: {count}
- Sign-in setup: {iPad / paper / QR code to GHL form}
- Music: {yes/no, playlist}
- Lighting check: {all lights on, blinds open}
- Staging touch-ups: {}

HOSTING SCRIPT
- Greeting: {opening line, 15 seconds}
- Property tour direction: {suggest a walking path}
- Value hits: {top 3 features to make sure every visitor hears}
- Objection pre-empts: {any known concerns and the response}
- Ask: {end-of-visit ask , pre-approval? Second showing? Refer a friend?}

FEEDBACK CAPTURE PROMPTS
- What did you love?
- What would you change?
- On a scale of 1-10, how likely are you to write on this property?
- Are you working with an agent?
- What's your search timeline?

SIGN-IN STRATEGY
- QR code to GHL form (preferred): {link}
- Paper backup: {yes/no}
- Fields: name, email, phone, agent status, price range
- Gift or incentive for signing in: {yes/no, what}
```

**Post-event follow-up plan:**

```
OPEN HOUSE FOLLOW-UP
{Address} , {Date}
Total visitors: {N}
Sign-ins: {N}
Agent-attached visitors: {N}
Unattached buyers: {N}
Serious prospects: {N}

FOLLOW-UP QUEUE
- {Visitor}: {status}. First message: {template}.

MASTER FOLLOW-UP TEMPLATE (send within 24 hours)
{Ready-to-send text, 3 to 4 sentences.}

PER-VISITOR CUSTOMIZATION NOTES
- {Name}: {what to reference from the visit.}

LEAD-QUALITY RATINGS
- Hot: {N visitors, names}
- Warm: {N visitors, names}
- Cool: {N visitors, names}

REPORT TO SELLER
{3-sentence recap for the listing client: turnout, feedback summary, any offer signals.}

SUGGESTED NEXT SKILLS
- Individual buyer follow-up: `mls-follow-up`.
- Someone wants a private showing? `showing-prep`.
- Serious prospect not yet consulted? `buyer-consultation`.
```

## Instructions

**Step 0. Lock four things.**
1. **Property.** Address, list price, beds/baths.
2. **Open house type.** Public, broker's open, twilight, mega-open.
3. **Date and time window.** Concrete date and start/end.
4. **Farm reach.** How many nearby homes get the postcard or invite.

State back. Get a nod.

**Step 1. Draft the pre-event promotion timeline.** Concrete dates for each promotion action. Do not batch everything into T-2; space across the 14-day runway.

**Step 2. Draft each promotion asset.** Instagram caption, Facebook event, sphere email, postcard. Match agent voice. Every asset includes the property address, open house date+time, and one hook.

**Step 3. Plan the signage and day-of setup.** Concrete count and locations for signs. Concrete setup checklist for 60 minutes before start.

**Step 4. Draft the hosting script.** Greeting line, walking path suggestion, value hits, objection pre-empts, closing ask.

**Step 5. Design the feedback capture.** 4 to 6 questions. Short. Every question maps to an actionable next step for the agent.

**Step 6. Set up the sign-in strategy.** GHL form + QR code preferred. Paper backup. Concrete fields.

**Step 7. If post-event, build the follow-up queue.** Read the sign-in list. Rate each visitor hot/warm/cool. Draft the master follow-up and per-visitor customization notes.

**Step 8. If post-event, draft the seller report.** 3 sentences the agent can send to the listing client that day.

## Examples

**Example 1.** Agent says "prep for open house Sunday at 1247 Oak, 12-3pm." Skill fires. Asks for list price and farm reach. Produces the 14-day plan with dates counting backward from Sunday.

**Example 2.** Agent says "OH promotion for this weekend, need social posts." Skill fires. Asks for property. Drafts Instagram, Facebook, and NextDoor posts.

**Example 3.** Agent says "open house follow-up, 14 sign-ins." Skill fires. Asks for the sign-in file or list. Rates each visitor. Produces the follow-up queue.

## Composes with

- `mls-follow-up`. drafts the per-visitor follow-up sequences.
- `showing-prep`. for any visitor requesting a private second showing.
- `buyer-consultation`. for any serious unattached buyer.
- `listing-presentation`. the open house plan is often part of the marketing plan pitched here.
