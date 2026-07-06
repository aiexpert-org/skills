---
name: showing-prep
description: "Prep a real estate agent for a specific property showing. Pulls comparable properties, seller motivation notes, buyer profile, likely objections, questions the buyer will ask, questions the agent should ask, and closing techniques tuned to this property type and price point. Produces a one-page pre-showing brief the agent can read in the car before knocking on the door. Trigger phrases include 'showing prep', 'prep for showing', 'prep for a showing', 'prep for this showing', 'showing brief', 'property brief', 'walking a showing at', 'walking a buyer through', 'brief me on this listing', 'prep me for the walkthrough', 'showing coming up at', 'client wants to see', 'buyer wants to tour', 'get me ready for the showing'. Fires for both buyer-side and listing-side showings. Do NOT trigger when the agent is running a full open house (route to open-house-plan), when the agent is asking for a purely factual comparable search with no buyer context (route to a comp-lookup tool), or when the agent is asking to review the purchase agreement itself (route to deal-doc-review). Altitude is execution stage. Produces an in-session brief and, if requested, saves a copy to a scratch showings folder."
---

LAST-VERIFIED: 2026-07-06. Source: BNB AI Solutions agent workflow patterns, Buddy Buck real estate operator context, and the Matt Pocock handoff design pattern. Re-verify against BNB AI Solutions product spec if the AI Sphere vault schema changes.

This skill turns a raw address plus a buyer name into a walkable, memorized-by-the-time-you-arrive showing brief. Real estate agents lose deals on showings not because the property is wrong but because they walk in cold and the buyer's specific concern goes unaddressed. This skill fixes that by pre-loading the agent's brain with everything the buyer will react to and every lever the agent still has to pull.

Output is disposable. The brief is delivered as a chat digest that the agent scans on the way. Optional archive to `showings/YYYY-MM-DD-{address}.md` in a scratch folder if the agent wants a record.

## When to use

- Any showing on the calendar in the next 72 hours.
- Back-to-back tour day when the agent has 5 to 8 properties queued and needs a stack of briefs.
- Second showings where the buyer is close to writing an offer and the agent needs the closing angles.

## When NOT to use

- Full open house prep. Route to `open-house-plan`.
- Contract review or offer strategy. Route to `deal-doc-review`.
- Pure comp pull with no buyer context. That's a data query, not a brief.

## What you'll produce

```
SHOWING BRIEF
{Property address} , {Date, Time}
Buyer: {Name} | Price point: {$}

WHAT THIS BUYER CARES ABOUT
{3 bullets, from buyer profile / prior tours / stated must-haves}

WHAT WILL HIT THEM WHEN THEY WALK IN
{Positive: features they'll notice. Negative: concerns they'll raise.}

COMPARABLES (last 90 days, half-mile)
- {Address} , {$}, {beds/baths/sqft}, {DOM}. {One-line vs subject.}
- {2 to 4 comps.}

SELLER MOTIVATION READ
{Days on market, price cuts, listing agent tone, showing feedback if visible.}

QUESTIONS THE BUYER WILL ASK
- {3 to 5 questions with pre-drafted answers.}

QUESTIONS YOU SHOULD ASK THE BUYER
- {2 to 3 questions that surface objections and move the deal.}

CLOSING ANGLES FOR THIS PROPERTY TYPE
- {Scarcity / market timing / rate lock / lifestyle match , pick 2 that fit.}

SUGGESTED NEXT SKILLS
- Ran the showing? Log the debrief with `mls-follow-up`.
- Buyer wrote an offer? Review the contract with `deal-doc-review`.
```

## Instructions

**Step 0. Lock four things before pulling data.**
1. **Property address.** Confirm exact address including unit number.
2. **Buyer identity.** Name, and whether this is a first tour, second tour, or "just curious" showing.
3. **Showing time.** So the brief prioritizes what the agent will actually walk into.
4. **Data sources available.** Ask which of: MLS pull, buyer profile file, prior showing notes, AI Sphere vault. If none, ask the agent for the buyer's top 3 must-haves verbally.

State the four back. Get a nod before pulling.

**Step 1. Pull the property snapshot.** Address, list price, beds/baths/sqft, lot, year built, list date, days on market, price cuts, HOA if any, disclosed defects if visible.

**Step 2. Pull the last 90 days of comparables.** Half-mile radius, same property type, within 15% of subject price. Two to four comps. Note DOM and sale-to-list ratio.

**Step 3. Read the buyer.** Pull whatever the agent has (buyer profile, tour history, must-haves, deal-breakers). Score the subject against the buyer's stated criteria. Flag the two features that will delight and the two that will trigger a concern.

**Step 4. Read the seller motivation.** DOM, price cut history, listing description tone, any visible urgency signals. Rate: motivated / neutral / not motivated. This determines the closing angle.

**Step 5. Draft the brief.** Fit on one screen. No more than 400 words. Every question in the "questions the buyer will ask" section has a pre-drafted answer under it.

**Step 6. Offer next moves.** Save to archive? Draft the follow-up email now (route to `mls-follow-up`)? Pre-write the offer if the buyer is a strong yes (route to `deal-doc-review`)?

## Examples

**Example 1.** Agent says "prep me for a showing at 1247 Oak Ln at 2pm, buyer is the Ridgeways, second tour." Skill fires. Pulls comps, reads Ridgeway buyer profile, flags they were concerned about kitchen size last tour, drafts brief with kitchen size discussion prepped. Delivers.

**Example 2.** Agent says "walking a buyer through 3 listings tomorrow morning." Skill fires. Asks for addresses and buyer name. Produces a stacked brief covering all three with side-by-side comparable frame.

**Example 3.** Agent says "showing coming up at 823 Main, price point is $625K." Skill fires. Asks for buyer profile if not given. Delivers standard brief.

## Composes with

- `mls-follow-up`. runs the post-showing follow-up sequence after the brief is used.
- `deal-doc-review`. if the buyer writes on the property.
- `neighborhood-brief`. if the buyer wants deeper area context before the showing.
