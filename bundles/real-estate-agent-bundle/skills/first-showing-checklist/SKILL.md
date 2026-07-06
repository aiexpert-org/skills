---
name: first-showing-checklist
description: "Run the checklist for a buyer's first showing. Covers the pre-showing prep (buyer's stated preferences, pre-approval status, timeline, tour route, buyer agency agreement), the in-showing observation prompts (what the buyer looks at first, what they ignore, what they say vs what they show), and the post-showing debrief (what to send within 2 hours, the three questions to ask, the offer-readiness signal). Trigger phrases include 'first showing prep', 'first showing checklist', 'buyer first tour', 'showing checklist', 'run the first showing', 'showing prep for first tour', 'first tour with new buyer'. Do NOT trigger for subsequent showings after the buyer is warm (route to `showing-prep`) or for the buyer consultation before any showings happen (route to `buyer-consultation`)."
---

LAST-VERIFIED: 2026-07-06. Source of truth: Brett K. Moore, AI Expert Marketplace v1.1.0.

This skill runs the first-showing checklist for a new buyer. The first showing is diagnostic. The agent learns more about the buyer's real preferences from what they do than from what they say.

## When to use

- The agent is taking a new buyer on their first tour after the consultation.
- The buyer is pre-approved (or you are about to have the conversation about pre-approval).
- The agent wants a structured way to observe rather than just show houses.

## When NOT to use

- The buyer has been on multiple tours already (route to `showing-prep`).
- The buyer has not had the initial consultation yet (route to `buyer-consultation`).

## Inputs the agent provides

- Buyer's stated preferences (bedrooms, price, area, features).
- Pre-approval status (yes / no / in progress).
- Timeline (0-30 days, 1-3 months, 3-6 months, browsing).
- Number of properties on the tour route.
- Whether the buyer agency agreement is signed.

## The pre-showing prep

### Confirm the essentials
- Buyer agency agreement signed (post-August-2024 NAR settlement makes this table stakes).
- Pre-approval letter received or timeline for it clarified.
- Buyer's driver's license or ID captured for the agent's records.
- Tour route with drive time between properties.
- Water and phone charger in the car.

### Build the one-pager per property
For each property on the tour:
- Address, list price, days on market.
- Property tax and HOA cost.
- Comparable recent sales within 0.25 miles.
- Any known issues or seller disclosures.
- One paragraph on the neighborhood context.

### Set the frame
Text the buyer the morning of: "here's the route we'll run today, in this order, and here's the one-pager for each property." This tells the buyer you are organized and it primes them to notice specific things.

## The in-showing observation prompts

At each property, silently observe:

- **First room the buyer goes to.** Kitchen means they cook or entertain. Primary bedroom means they are checking scale for their furniture. Backyard means they have kids or dogs or an outdoor life.
- **What they photograph.** They will show these photos to their partner, parent, or friend. Whatever they photograph is what will drive the veto or the yes.
- **What they touch.** Countertops, cabinet hardware, faucet — they are checking quality tier and mentally comparing to their current home.
- **What they say vs what they show.** They will say "this is nice" while walking out the front door. They will say "the layout doesn't work" while going back for a second look at the kitchen. Trust their feet, not their mouths.
- **Questions they ask.** "How old is the roof?" is different from "what's the mortgage on this?" One is engagement, the other is fantasy shopping.

## The post-showing debrief

Within 30 minutes of the last property, in the car or at a coffee shop, ask three specific questions:

1. **"Which one felt like home when you walked in?"** — Emotional read. The right answer is one specific address, not "a few of them."
2. **"Which one made you pull out your phone to text someone?"** — Behavioral read. The property they told someone about is the leading candidate.
3. **"If I sent you an offer worksheet on the top one tonight, would you want to see it?"** — Readiness read. The answer tells you where in the funnel they are.

## Send within 2 hours of the debrief

- A recap email with the top-two properties, the tax and HOA figures, the comparable sales, and (if the buyer signaled offer readiness) an offer preview.
- Book the next step: second showing, offer prep call, or follow-up tour.

## The offer-readiness signal

Categorize the buyer into one of three tiers:

- **Ready to offer this week.** Signal: they answered question 3 with "yes, send me the worksheet." Next: draft the offer, call the listing agent to test the seller's temperature.
- **Warm, needs one more tour.** Signal: they answered question 1 with a specific address but hedged on question 3. Next: book the second showing on the top property within 5 days.
- **Cold, still browsing.** Signal: they answered question 1 with "a few of them" or "none really." Next: recalibrate. Are the stated preferences wrong? Is the pre-approval budget wrong? Is the timeline wrong? Book a 20-minute reset call.

## Output shape

```
FIRST SHOWING CHECKLIST: [buyer name] — [date]

## Pre-showing
- Buyer agency agreement: [signed | pending]
- Pre-approval: [received | in progress | none]
- Route: [property 1 → property 2 → property 3]
- One-pagers built: [yes | no]

## In-showing observations (populated per property)
- [address 1]: first room [ ], photographed [ ], touched [ ], said [ ], asked [ ]
- [address 2]: [...]

## Post-showing debrief
- Q1 (felt like home): [buyer's answer, verbatim]
- Q2 (pulled out phone): [buyer's answer, verbatim]
- Q3 (offer readiness): [buyer's answer, verbatim]

## Category
- [Ready to offer this week | Warm, needs one more tour | Cold, still browsing]

## Next action
- [Draft offer | Book second showing on [address] | Book 20-min reset call]

## Follow-up email draft
[recap + next step]
```

## Voice rules

- No em dashes.
- Specifics only. Named property, named question, verbatim answer.
- Do not oversell. If the buyer is cold, say cold in the notes, and reset.

## Related skills

- `buyer-consultation` — for the pre-first-showing consultation.
- `showing-prep` — for the second and subsequent showings.
- `mls-follow-up` — for the property-preference sequence between tours.
- `transaction-milestones` — once the buyer signals offer readiness.
