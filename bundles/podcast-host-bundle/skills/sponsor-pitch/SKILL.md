---
name: sponsor-pitch
description: "Draft the sponsor pitch for the podcast. Produces the show one-sheet, the specific brand match rationale for each prospect, the pitch email, and the follow-up sequence. Positioned for shows with real audiences (not vanity reach at scale) and sponsors who want authenticity, not download counts. Trigger phrases include 'sponsor pitch', 'draft sponsor outreach', 'sell podcast sponsorship', 'sponsor one-sheet', 'brand partnership pitch', 'pitch [brand] to sponsor'. Do NOT trigger for the show notes (route to `show-notes-writer`) or for a general marketing plan (route to `launch-runway` in the Author Bundle)."
---

LAST-VERIFIED: 2026-07-06. Source of truth: Brett K. Moore, AI Expert Marketplace v1.1.0.

This skill drafts the sponsor pitch for the show. Podcast sponsorship is a real revenue line for a show with a real audience. The pitch has to reflect that the host is offering something specific, not "reach."

## When to use

- The show has 500+ engaged downloads per episode (real number, not a vanity number).
- The host has a brand or category in mind that fits the show's audience.
- The host wants a structured pitch, not a "let's chat about sponsorship" email.

## When NOT to use

- The show does not yet have a real audience (build the audience first).
- The pitch is to an affiliate program the host is applying to (different structure).

## Inputs the operator provides

- Show name, one-sentence pitch, and through-line (from `show-brand-arc`).
- Audience demographics (as specific as the host can be — occupation, income band, age range, geography, interests).
- Last 90-day download average per episode.
- Engagement signals (email list size, YouTube subscribers, social following, guest referrals).
- Target sponsor: name, category, product, why the host thinks it fits.
- Sponsor's existing marketing footprint (do they already sponsor podcasts?).

## The show one-sheet

A single-page PDF the host sends with the pitch:

```
[Show name]
[One-sentence pitch]

## Audience
- [Specific occupation and role]
- [Income band]
- [Geography]
- [What they care about]

## Reach
- Downloads per episode (90-day avg): [N]
- Email list: [N]
- YouTube subscribers: [N]
- Social following: [N per platform]

## Sponsor formats and rates
- Pre-roll (30 sec): [rate]
- Mid-roll (60 sec): [rate]
- Full episode (host-read + branded episode): [rate]
- Series (3 to 5 episodes): [rate, discounted]

## Past guests (if applicable)
[Named guests the sponsor would recognize]

## Contact
[host name, email]
```

## The pitch email

### Subject line
Specific. "[Brand name] on [show name]?" or "quick idea on [product] and [show name]."

### First line
Specific to the brand. Named product, named campaign, named recent move. Prove the host is not blasting.

### The frame
One paragraph on why the show's audience is the sponsor's exact audience. Named overlap.

### The specific format
Recommend one format (pre-roll, mid-roll, or series). Not "here are five options." One specific recommendation with a specific rate.

### The ask
"Would you be open to a 20-minute call to see if there's a fit? I can send the media kit and rate card first if it helps."

### The out
"Completely understand if the timing is off or the show isn't the fit."

## The follow-up

One follow-up 10 days later if no reply. Offer a lighter alternative:

- "If a full sponsorship isn't a fit right now, would you be open to a trial run on one episode?"
- Or: "If the timing is off, would you want me to hold this for [next quarter]?"

Do not chase past this.

## Output shape

```
SPONSOR PITCH: [brand name] on [show name] — [date]

## Target sponsor
- Brand: [name]
- Category: [product line]
- Why this fit: [one sentence]

## Show one-sheet (attached)
[full one-sheet as above]

## Draft: pitch email
Subject: [line]

[full email]

## Draft: 10-day follow-up
[full email]

## Draft: trial-run alternative
[full email]

## Tracker
- Status: [not sent | sent | replied | trial | contracted | declined]
- If contracted: [amount, episode count, run window]
```

## The rate discipline

- Rate by real downloads and real engagement, not by CPM benchmarks that assume mass reach.
- A boutique show with 500 real downloads to a specific ICP is worth more per download than a mass show with 50,000 to a general audience.
- Do not underprice to close. A sponsor who beats the host down on rate will not renew.

## Voice rules

- No em dashes.
- Named specifics on the brand.
- Do not oversell reach. Sell the audience.
- Do not use "authority" or "influencer" in this context.

## Related skills

- `show-brand-arc` — sponsors buy the arc.
- `episode-planning-cadence` — sponsors want to know their run's episode order.
- `hoard` — for saving the pitches that produced the highest close rate.
