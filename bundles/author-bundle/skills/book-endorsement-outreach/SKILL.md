---
name: book-endorsement-outreach
description: "Draft the outreach sequence to secure book endorsements (blurbs, forewords, back-cover quotes) from named public figures, subject-matter experts, or category-adjacent authors. Produces the initial ask, the 7-day follow-up, the endorsement-received thank-you, and the endorsement-declined graceful close. Trigger phrases include 'book endorsement', 'blurb outreach', 'get blurbs for my book', 'endorsement asks', 'blurb requests', 'foreword ask', 'back-cover quotes'. Do NOT trigger for a full launch campaign (route to `launch-runway`) or for post-launch promo asks (route to `evergreen-pipeline`)."
---

LAST-VERIFIED: 2026-07-06. Source of truth: Brett K. Moore, AI Expert Marketplace v1.1.0.

This skill drafts the endorsement outreach sequence for a book. Endorsements are one of the highest-leverage pre-launch assets: a blurb from the right person opens doors that the book itself cannot open.

## When to use

- The author has a manuscript that is at least 80% complete or has a strong sample.
- The author is 90 to 180 days out from launch and needs blurbs on the cover, foreword commitments, or back-cover quotes.
- The author has a target list of potential endorsers.

## When NOT to use

- The book is still in outline stage (too early; the endorser has nothing to endorse).
- The author is post-launch (too late for cover blurbs; different ask).
- The author wants a full launch campaign (route to `launch-runway`).

## Inputs the operator provides

- Book title, subtitle, one-sentence pitch.
- Manuscript status (sample chapter available, full draft, near-final).
- Target endorser list with names and roles.
- Author's warm intro path to each endorser (mutual connection, prior email, event they were at together).
- Launch date.

## The four-part sequence

### 1. The initial ask

Personalized to each endorser. Structure:

- **First line.** A specific, real reason the author is reaching out to this endorser (not "I'm a big fan").
- **Second paragraph.** One-sentence pitch on the book, framed to what the endorser cares about.
- **The ask.** Specific: "I would be honored if you would consider a blurb of 2 to 3 sentences by [date, giving them at least 6 weeks]. I can send the full manuscript or the two most relevant chapters, whichever you prefer."
- **The out.** "Completely understand if the timing is wrong or the topic is off. Grateful either way."

### 2. The 7-day follow-up (only if no reply)

- One paragraph. Reference the original ask.
- Offer to make it easier: "if it helps, I can send a 500-word summary and the one chapter I think would land most for you."
- Do not chase past this. If no reply after the second email, move on.

### 3. The endorsement-received thank-you

- Same day the endorsement lands.
- Thank the endorser for the specific line they wrote.
- Ask if they want a signed copy at launch.
- Ask if there's any way to reciprocate.

### 4. The endorsement-declined graceful close

- If the endorser declines, respond within 24 hours.
- Thank them for reading the ask.
- Do not press for a smaller ask (foreword to blurb, blurb to social share) in the same email. Send a follow-up 60 days later if the relationship warrants it.
- Add a note to the CRM to reciprocate on their next launch.

## Output shape

```
ENDORSEMENT OUTREACH: [book title] — [date]

## Target list
1. [name, role, warm-intro path, target ask (foreword / blurb / back-cover)]
2. [name, role, warm-intro path, target ask]
...

## Draft: initial ask to [name]
[full email]

## Draft: 7-day follow-up to [name]
[full email]

## Draft: thank-you (received)
[full email]

## Draft: graceful close (declined)
[full email]

## Tracker
- [name] — status: [not sent | sent | replied | committed | received | declined | closed]
```

## The reciprocation rule

Every endorser the author asks is a person the author owes something back to. When their next book, podcast, launch, or event happens, the author reciprocates without being asked. This is the difference between an endorser network that compounds and a one-off transactional ask.

## Voice rules

- No em dashes.
- Named specifics in the first line. No "I'm a big fan of your work."
- Do not flatter. Do not oversell the book. Let the pitch land on its own.

## Related skills

- `manuscript-audit` — for the pre-outreach quality check.
- `launch-runway` — for the broader launch campaign.
- `podcast-guest-prep` — for the endorser who is a podcast host.
- `hoard` — for saving the endorsement lines that landed.
