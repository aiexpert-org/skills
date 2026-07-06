---
name: buyer-consultation
description: "Run the buyer consultation intake for a new real estate buyer. Captures buyer profile, must-haves, nice-to-haves, financial pre-qualification status, timeline, and the buyer representation agreement discussion. Produces a buyer profile file the agent uses across every subsequent showing, follow-up, and offer. Trigger phrases include 'buyer consultation', 'buyer intake', 'new buyer prep', 'buyer discovery', 'buyer profile', 'buyer consultation coming up', 'meeting a new buyer', 'first buyer meeting', 'buyer questionnaire', 'run the buyer intake', 'set up a new buyer', 'buyer just called', 'sign up a new buyer', 'buyer representation agreement'. Fires for a new buyer's first meeting or for an old buyer re-engaging after a long gap. Do NOT trigger when the buyer already toured and needs post-showing follow-up (route to mls-follow-up), when the buyer wrote an offer (route to deal-doc-review), or when the agent is asking for property-specific showing prep (route to showing-prep). Altitude is planning + execution stage. Output is permanent: writes buyer profile to buyers/{name}/profile.md so every downstream skill (showing-prep, mls-follow-up, neighborhood-brief) can read from a canonical file."
---

LAST-VERIFIED: 2026-07-06. Source: BNB AI Solutions AI Sphere schema, Buddy Buck's real estate agent workflow patterns, standard buyer representation agreement conventions post the 2024 NAR settlement.

Real estate agents burn hours showing wrong properties because the buyer intake was thin. This skill runs a structured intake that captures every field the agent will need across the next 90 days of the buyer relationship. Every subsequent skill in the bundle reads from the profile this skill creates.

Output is permanent. Buyer profile at `buyers/{Firstname-Lastname}/profile.md`. Subsequent activity (showings, offers, notes) logged in that folder.

## When to use

- Any new buyer's first substantive conversation.
- A dormant past client re-engaging on a new search.
- Before signing a buyer representation agreement.
- Before the buyer's first showing tour.

## When NOT to use

- Buyer already toured. Route to `mls-follow-up`.
- Buyer wrote an offer. Route to `deal-doc-review`.
- Property-specific tour prep. Route to `showing-prep`.

## What you'll produce

```
BUYER PROFILE
{Buyer name(s)}
Intake date: {YYYY-MM-DD}
Agent: {Agent name}

CONTACT
- Email: {}
- Phone: {}
- Best contact method: {}
- Communication cadence preference: {}

HOUSEHOLD
- Buyers: {names, roles}
- Occupants: {who else lives in the home}
- Pets: {}
- Kids and ages: {}

FINANCIAL
- Pre-qualification status: {yes / no / in process}
- Lender: {}
- Loan program: {conventional / FHA / VA / cash / other}
- Approved price range: {$ min - $ max}
- Down payment: {%, source}
- DTI headroom: {any notes}
- Financing constraints: {gift funds, contingent sale, timeline lock}

TIMELINE
- Must-move-by date: {}
- Reason: {job start, lease end, sale of current home, no rush}
- Best-case move: {}
- Contingent sale?: {yes/no, if yes: current home details}

MUST-HAVES
- {3 to 5 non-negotiables.}

NICE-TO-HAVES
- {5 to 8 preferences that would tip a decision.}

DEALBREAKERS
- {3 to 5 things that will kill any showing.}

TARGET AREAS
- Primary zip codes: {}
- Secondary zip codes: {}
- School district(s): {}
- Commute anchors: {work address, other}

STATE OF MIND
- Motivation level: {high / medium / low}
- Prior tour history: {}
- Prior offer history: {}
- Emotional read: {any signal , first-time buyer nerves, downsizing grief, investment mindset}

BUYER REPRESENTATION AGREEMENT
- Signed?: {yes / no / discussed}
- Term length: {}
- Commission structure: {}
- Discussed with buyer: {yes/no}
- Agent notes: {}

SEARCH SETUP
- MLS auto-alerts: {yes/no, criteria}
- Portal link sent: {yes/no}
- First showing scheduled: {}

NEXT STEPS
- {Item}: {Owner, date.}

SUGGESTED NEXT SKILLS
- Ready to tour? Run `showing-prep` for the first property.
- Need neighborhood context? Run `neighborhood-brief` for target zip codes.
```

## Instructions

**Step 0. Lock four things.**
1. **Buyer name(s).** Confirm exact spelling.
2. **Meeting format.** In-person, phone, Zoom. Different depth of intake per format.
3. **Referral source.** So the file can link to `referral-tracking`.
4. **Buyer representation agreement plan.** Discussed already, planned for this meeting, planned for later.

State back. Get a nod.

**Step 1. Walk the contact + household section.** Ask for email, phone, communication preference. Ask who else is in the home. This is the section buyers answer easily; use it to build rapport.

**Step 2. Walk the financial section.** Pre-qualification status, lender relationship, approved range, down payment source, financing constraints. If the buyer isn't pre-qualified, flag it and ship the "get pre-qualified first" recommendation.

**Step 3. Walk the timeline + motivation.** Must-move date, reason, whether a contingent sale is in play. This determines the entire subsequent cadence.

**Step 4. Walk must-haves, nice-to-haves, dealbreakers.** Three separate lists. Force the buyer to name what would kill a deal , this is the field agents skip and pay for later.

**Step 5. Capture target areas.** Primary and secondary zip codes, school districts if applicable, commute anchors.

**Step 6. Read the emotional state.** One-line note: what mood is this buyer in, what will affect the search. This section is agent-only.

**Step 7. Discuss the buyer representation agreement.** Standard post-2024-NAR practice. Note the commission structure, term, and whether the buyer signed.

**Step 8. Set up search infrastructure.** MLS auto-alerts, portal, first showing scheduling.

**Step 9. Write next steps.** Concrete items with dates.

## Examples

**Example 1.** Agent says "buyer consultation with the Ridgeways tomorrow at 10." Skill fires. Asks for context on where they came from. Produces the intake template pre-filled with agent name and date; agent walks through with the Ridgeways and captures answers.

**Example 2.** Agent says "new buyer just called, want to run intake." Skill fires. Asks for name, contact preference. Runs an inline conversational version of the intake.

**Example 3.** Agent says "past client is back, buying again." Skill fires. Asks whether to update the existing profile or start fresh. Merges old and new data.

## Composes with

- `showing-prep`. reads the buyer profile before every tour.
- `mls-follow-up`. reads criteria for the MLS trigger rules.
- `neighborhood-brief`. reads target zip codes.
- `referral-tracking`. links buyer to the referral source.
- `deal-doc-review`. activates when the buyer writes on a property.
