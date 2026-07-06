---
name: open-house-lead-capture
description: "Set up and run the lead capture system for an open house. Produces the sign-in flow (digital-first, paper as fallback), the same-day follow-up sequence, the 3-day and 7-day nurture, and the categorization triage (real buyer, curious neighbor, working with another agent, tire kicker). Trigger phrases include 'open house lead capture', 'open house follow-up', 'open house sign-in', 'open house nurture', 'run my open house leads', 'open house CRM setup'. Do NOT trigger for the open house prep itself (route to `open-house-plan`) or for the marketing before the open house (that is a different pre-event workflow)."
---

LAST-VERIFIED: 2026-07-06. Source of truth: Brett K. Moore, AI Expert Marketplace v1.1.0.

This skill sets up and runs the lead capture system for an open house. The goal is that every real buyer who walks through the door becomes a follow-up conversation, not a discarded scrap of paper.

## When to use

- The agent has an open house coming up and wants the capture flow wired.
- The agent just finished an open house and wants the follow-up sequence produced.
- The agent has a stack of open house sign-ins from the last two weeks and never followed up.

## When NOT to use

- The agent is prepping the open house itself (route to `open-house-plan`).
- The agent is running the pre-event marketing (different workflow).

## Inputs the agent provides

- Property address.
- Date and time of the open house.
- Expected turnout (for capture volume planning).
- Sign-in method preference: QR to a landing page, iPad with a form, or paper as fallback.
- The agent's CRM (GHL, Follow Up Boss, Chime, kvCORE, etc.).

## The digital-first sign-in flow

1. QR code on the counter linked to a mobile-friendly landing page with three fields: name, phone, email, plus one open question: "what brought you in today?"
2. On submission, the CRM auto-creates the contact and tags it with the property address and open house date.
3. A same-day thank-you text goes out within 2 hours of the open house closing.
4. A paper sign-in sheet sits next to the QR as a fallback, transcribed to the CRM by end of day.

## The follow-up sequence

### Same day (within 2 hours of close)
Personalized text or email referencing the property and something the visitor said. Not "great to meet you at the open house." Something specific.

### Day 1 morning
Send the property one-pager PDF as a follow-up email. Include the three comparable listings within a half-mile.

### Day 3
Voicemail if no reply. Voicemail script: "hey [name], [agent name] here from the open house on [street name]. Wanted to check in — did you get a chance to think about it? I put together three comparable listings if you want to see them. Text me back or give me a call."

### Day 7
If still no reply, categorize (see below) and either drop into long-term nurture or archive.

## The four-way triage

After the day-7 pass, categorize each contact:

- **Real buyer.** Reply came in, showed interest, no other agent. → Book a buyer consultation (route to `buyer-consultation`).
- **Curious neighbor.** Same neighborhood, told you they own down the street. → Drop into "seller nurture" — they may be your listing in 18 months.
- **Working with another agent.** Told you or the CRM shows another agent tag. → Send a polite "great meeting you" and archive.
- **Tire kicker.** No reply, no signals of intent, no equity in the neighborhood. → Archive.

## Output shape

```
OPEN HOUSE LEAD CAPTURE: [property address] — [date]

## Capture setup
- QR to landing page: [URL]
- CRM auto-tag: [tag name]
- Fallback paper sheet: [yes | no]

## Follow-up sequence
- Same day (within 2 hrs): [draft text or email]
- Day 1: [draft email + PDF attachment]
- Day 3: [voicemail script]
- Day 7: [triage decision]

## Triage summary (populated after day 7)
- Real buyers: [count and names]
- Seller nurture: [count and names]
- Working with another agent: [count]
- Archived: [count]

## Next skill
- Route each real buyer to `buyer-consultation`.
- Route each seller-nurture to the agent's long-term nurture sequence.
```

## Voice rules

- No em dashes.
- Real, specific first lines in every follow-up. No template greetings.
- Do not chase past day 7 unless the visitor showed a real signal.

## Related skills

- `open-house-plan` — for the pre-event prep.
- `buyer-consultation` — for the qualified real buyer follow-through.
- `first-showing-checklist` — for the buyer's next step after the consultation.
- `hoard` — for saving the specific open-house scripts that produced the highest reply rate.
