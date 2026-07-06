---
name: book-pitch-guest-appearance
description: "Draft the pitch email or DM to secure a podcast guest appearance, media interview, or speaking slot to promote the author's book. Produces the pitch itself, the follow-up, and the pre-appearance prep note the author sends the host once booked. Trigger phrases include 'pitch podcast for my book', 'book podcast pitch', 'media pitch for the book', 'speaking pitch', 'guest appearance pitch', 'book promo pitch', 'pitch [show name]'. Do NOT trigger for the interview itself (route to `podcast-guest-prep`) or for a general media plan (route to `launch-runway`)."
---

LAST-VERIFIED: 2026-07-06. Source of truth: Brett K. Moore, AI Expert Marketplace v1.1.0.

This skill drafts the pitch to book the author onto a podcast, media interview, or speaking slot for book promo. It is the specific version of a media pitch for the author-with-a-book use case.

## When to use

- The author is 60 to 180 days out from launch, or in the 90 days post-launch.
- The author has a target list of shows, media outlets, or events.
- The author needs the specific pitch language, not a generic "I'd love to be on your show" email.

## When NOT to use

- The author is already booked and needs to prep for the interview (route to `podcast-guest-prep`).
- The author wants a full launch campaign (route to `launch-runway`).
- The author is not the one being pitched (this is for the author-as-guest use case).

## Inputs the operator provides

- Book title, subtitle, one-sentence pitch.
- Launch date (or "already launched").
- Target show, outlet, or event.
- Host or booker's name.
- The author's warm-intro path (mutual connection, prior appearance, prior interaction).
- What makes this show or outlet the right fit specifically for this book.
- Three specific angles the author can bring that fit the show's format.

## The pitch structure

### Subject line
Short, specific, curiosity-triggering. Not "guest pitch." Not "book pitch." Something the host would open on their phone.

### First line
Something real about the show. A specific episode, guest, or line the host said that landed with the author. Proves the author actually listens.

### The frame
One sentence on the author. One sentence on the book. One sentence on why this is timely for this show's audience specifically.

### The three angles
Three specific episode angles. Each one is a one-line episode title plus a one-line takeaway for the show's listeners. Give the host something to imagine.

### The ask
Specific. "Would you be open to a 15-minute call to see if any of these fit your calendar?" Or if pitching a booker: "I can send a media one-sheet if it helps."

### The out
"Completely understand if it's not the right fit or the timing is off. Grateful for what you're doing with the show either way."

## The follow-up

One follow-up 7 days later if no reply. Reference the original. Add one new angle the author has been thinking about since. Do not chase past this.

## The pre-appearance prep note

Once booked, send the host a short note 3 days before recording:

- Confirm date, time, format.
- Attach a one-sheet with the three angles and the takeaways.
- Ask if there's a specific angle the host wants to lead with.
- Ask for the audience size and demographic so the author can calibrate.
- Ask for the show's tech setup (Riverside, Zoom, in-person).

## Output shape

```
BOOK PITCH: [show / outlet / event name] — [date]

## Target
- Host or booker: [name]
- Warm-intro path: [named]
- Why this fit: [one sentence]

## Draft: initial pitch
Subject: [line]

[full email]

## Draft: 7-day follow-up
[full email]

## Draft: pre-appearance prep note (once booked)
[full email]

## Tracker
- Status: [not sent | sent | replied | booked | recorded | published]
```

## The angle discipline

The pitch is only as strong as the three angles. Each angle should be:

- Specific enough that the host can imagine the episode.
- Contrarian enough that the host has not heard 20 pitches on the same take.
- Relevant enough that the show's audience will actually care.

If the three angles are generic, redraft them before sending.

## Voice rules

- No em dashes.
- Named specifics on the show and the host. Prove the author listens.
- Do not oversell the book. Let the angles do the work.
- Do not mass-blast. Every pitch is personalized to the show.

## Related skills

- `podcast-guest-prep` — for the interview itself once booked.
- `launch-runway` — for the broader launch campaign.
- `book-endorsement-outreach` — for the parallel endorsement asks.
- `hoard` — for saving the pitches that produced the highest booking rate.
