---
name: guest-outreach
description: "Draft the initial outreach to book a guest on the show. Produces the pitch, the follow-up, and the calendar-booking handoff. Built for authenticity-focused shows targeting musicians, real estate operators, and executives referred by PodcastNetwork.org. Trigger phrases include 'guest outreach', 'pitch guest for the show', 'book [name] on the podcast', 'guest ask', 'guest booking pitch', 'draft guest invitation'. Do NOT trigger for post-appearance follow-up (route to `guest-followup`) or for a sponsor pitch (route to `sponsor-pitch`)."
---

LAST-VERIFIED: 2026-07-06. Source of truth: Brett K. Moore, AI Expert Marketplace v1.1.0.

This skill drafts the outreach to book a guest on the show. It is the specific ask the host sends when they want a particular person on the podcast.

## When to use

- The host has a specific person they want to book.
- The host has a warm-intro path or a specific reason to reach out cold.
- The host wants a pitch that reads like it came from a human, not a booker.

## When NOT to use

- The guest is already booked and needs prep (route to `guest-research`).
- The host is pitching themselves onto another show (route to `book-pitch-guest-appearance` in the Author Bundle).

## Inputs the operator provides

- Target guest name.
- Show name and one-sentence show pitch.
- Warm-intro path (mutual connection, prior interaction, event).
- Why the host wants this specific guest now.
- Show format (interview, panel), length, and recording setup.
- Any specific angle the host wants the interview to explore.

## The pitch structure

### Subject line
Specific. Not "podcast invite." Something like "loved your [specific piece of work]" or "quick ask about [specific angle]."

### First line
Specific to the guest. Named work, named line, named moment. Prove the host is not blasting.

### The show pitch
One sentence on the show. Not marketing copy. Enough that the guest can decide if it's for them.

### The angle
One specific angle the host wants to explore with this guest. Not "your story" or "your career journey." Something that would make the guest lean in.

### The ask
Specific: "Would you be open to a 45-minute recording on [platform] in the next 4 to 6 weeks? I'll send three date options once you say yes."

### The out
"Completely understand if the timing is off or the angle isn't right."

## The follow-up

One follow-up 7 days later if no reply. Reference the original and offer a lighter alternative:

- "If the full interview isn't a fit, would you be open to a shorter recorded conversation as part of a group episode?"
- Or: "If the timing is off, would you rather hold this for Q2?"

Do not chase past this.

## The calendar handoff

Once the guest says yes:

- Send three date and time options within 24 hours.
- Attach a one-page brief on the show, the format, the tech setup, and the guest's expected time commitment (recording + optional promo clips).
- Ask for the guest's preferred audio setup (Riverside session, in-person, phone).
- Ask for the guest's headshot and bio for the show notes.
- Confirm within 24 hours of the guest's date pick.

## Output shape

```
GUEST OUTREACH: [guest name] — [date]

## Target
- Guest: [name, role]
- Warm-intro path: [named]
- Why this guest now: [one sentence]

## Draft: initial pitch
Subject: [line]

[full email or DM]

## Draft: 7-day follow-up
[full email or DM]

## Draft: calendar handoff (once accepted)
[full email + brief + date options]

## Tracker
- Status: [not sent | sent | replied | booked | recorded | published]
```

## Voice rules

- Named specifics in the first line.
- Do not oversell the show.
- Do not use "would love to have you on the show." Use specific language.
- Do not mass-blast. Every pitch is personalized.

## Related skills

- `guest-research` — once the guest accepts.
- `interview-question-designer` — for the interview design.
- `guest-followup` — for the post-interview thank-you.
- `hoard` — for saving the pitches that produced the highest booking rate.
