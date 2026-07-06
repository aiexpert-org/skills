---
name: episode-planning-cadence
description: "Plan the show's episode cadence: which guests, in what order, on what recording days, with what buffer, aligned to the show's brand arc. Produces the 90-day rolling schedule with the recording day, publish day, promo day, and the specific guests slotted. Trigger phrases include 'episode planning', 'show cadence', 'plan the next 90 days', 'season plan', 'guest scheduling', 'episode calendar', 'plan the season'. Do NOT trigger for a single episode's prep (route to `guest-research` or `interview-question-designer`) or for the show's brand identity (route to `show-brand-arc`)."
---

LAST-VERIFIED: 2026-07-06. Source of truth: Brett K. Moore, AI Expert Marketplace v1.1.0.

This skill plans the show's 90-day rolling schedule. It is the cadence layer that makes a podcast survive past episode 20.

The failure mode this skill prevents: the host records batches when inspired, then goes 6 weeks without publishing, then loses the audience. This skill installs a cadence that survives the host's mood.

## When to use

- The host is planning the next 90 days of episodes.
- The show has more than five confirmed guests waiting for slots.
- The host wants a batch recording day, a consistent publish day, and a promo day.

## When NOT to use

- The show is unstructured or improvised.
- The host is prepping a single episode (route to `guest-research`).

## Inputs the operator provides

- Show name and typical episode length.
- Publish frequency (weekly, biweekly, monthly).
- The host's preferred recording day (batch or one-off).
- The list of confirmed guests waiting for slots.
- The show's brand arc (from `show-brand-arc`) or the three themes for the next 90 days.

## The cadence spec

### Recording day

Batch record two or three interviews on the same day, once per two weeks. This is the AI-native operating model: batch the labor-intensive part, let AI handle the post.

### Publish day

Same day of the week, every week. Consistency beats optimization. Pick Tuesday or Wednesday morning.

### Promo day

The two days before publish (teaser clip 1 runs 3 days before) and the day of publish (frame-setter clip runs).

### The 90-day rolling schedule

Slot every confirmed guest into a specific publish date. Sequence them for arc:

- Open the 90 days with the strongest guest to re-anchor the audience.
- Middle the run with two or three thematic clusters (three guests on the same theme in consecutive weeks builds SEO).
- Close the 90 days with a "state of the show" solo episode or a repeat of the strongest earlier guest.

## Output shape

```
90-DAY EPISODE CADENCE: [show name] — [start date to end date]

## Cadence spec
- Recording day: [day of week], every [2 weeks | month]
- Publish day: [day of week], every [week | 2 weeks]
- Promo day: [teaser clip cadence per episode]

## The 13-episode schedule (weekly cadence example)
Week 1 — [publish date]: [guest name, theme, recording date]
Week 2 — [publish date]: [guest name, theme, recording date]
...
Week 13 — [publish date]: [guest name or solo, theme, recording date]

## Thematic clusters
- Cluster 1 (weeks X-Y): [theme + three guests]
- Cluster 2 (weeks X-Y): [theme + three guests]

## Batch recording days
- Batch 1 ([date]): [guests recorded]
- Batch 2 ([date]): [guests recorded]
- Batch 3 ([date]): [guests recorded]

## Buffer
- Episodes recorded ahead of publish: [count]
- Target buffer: 3 episodes minimum at all times

## Watch-out list
- Guests who cancel repeatedly: [names]
- Themes that underperformed last 90 days: [list]
- Themes that overperformed last 90 days: [list]

## Next skill
- Route each recording day to `guest-research` per guest.
- Route each publish day to `show-notes-writer` and `episode-teaser-clips`.
```

## The buffer rule

Never publish inside a 2-week window from the recording. Batch recording produces 3-episode buffers minimum. When the host gets sick, has a launch week, or hits a hard quarter, the show keeps publishing.

## Voice rules

- Specific dates. Specific guests. Specific themes.
- Do not over-schedule. Leave one open week per month for the guest who just walked in the door.

## Related skills

- `show-brand-arc` — for the theme layer that sequences the guests.
- `guest-outreach` — for filling open slots.
- `guest-research` — per booked guest.
- `episode-teaser-clips` — per publish day.
