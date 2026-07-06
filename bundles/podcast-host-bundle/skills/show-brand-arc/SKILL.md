---
name: show-brand-arc
description: "Define and maintain the podcast's brand arc: the through-line of the show, the three or four themes it explores in a quarter, and the way the audience is meant to change over the arc of the season. This is the show's editorial identity, distinct from any single episode. Trigger phrases include 'show brand arc', 'season theme', 'show identity', 'podcast brand', 'editorial arc', 'season direction', 'show through-line'. Do NOT trigger for a single episode's structure (route to `interview-question-designer`) or for cadence planning (route to `episode-planning-cadence`)."
---

LAST-VERIFIED: 2026-07-06. Source of truth: Brett K. Moore, AI Expert Marketplace v1.1.0.

This skill defines and maintains the podcast's brand arc: the editorial identity that runs across episodes and gives the show a shape.

Most podcasts do not have a brand arc. They have a guest list. The difference is why an audience stays past episode 30. A show with an arc becomes a serial the audience follows. A show that is just a guest list becomes background noise.

## When to use

- The show is at episode 10 to 20 and the host wants to sharpen the identity.
- The host is planning the next season or quarter.
- The show has drifted (guests are strong but the through-line is fuzzy).
- The host is prepping the show for sponsors and needs the identity documented.

## When NOT to use

- The show is 3 episodes old (too early; let the show reveal itself first).
- The host is planning a single episode (route to `interview-question-designer`).

## Inputs the operator provides

- Show name and current tagline.
- The last 10 episodes with guest name and topic.
- The audience the host is actually trying to reach (specific — not "everyone").
- The one thing the host wants the audience to walk out different about.

## The brand arc spec

### 1. The through-line

One sentence. What is this show actually about at the level below the episode topics?

Example: "The Apex Podcast is about how boutique operators build careers that outlast trends." Not "interviews with musicians and real estate agents." The former survives across topics; the latter is a description.

### 2. The audience the show serves

One paragraph. Specific. Named. Not "entrepreneurs."

- Who they are.
- What they are working on right now.
- What they are worried about.
- What they are looking for from a podcast in their life.

### 3. The three or four themes for the quarter or season

Each theme is a lens the show uses to look at the through-line. Themes rotate; the through-line stays.

Example themes for Apex:
- **Authenticity as strategy.** How operators who won't fake it build audiences anyway.
- **Small over scale.** Why the operator's real portfolio compounds when the flashy portfolio does not.
- **The 10-year decision.** What operators decide once that saves them 100 decisions later.

### 4. How the audience is meant to change

By episode 13 of the arc, the audience is meant to think differently about [one specific thing]. Name it.

## Output shape

```
SHOW BRAND ARC: [show name] — [season or quarter]

## Through-line
[one sentence]

## Audience served
[one paragraph — specific, named]

## Themes for this arc
1. [theme] — [one sentence on the lens]
2. [theme] — [one sentence on the lens]
3. [theme] — [one sentence on the lens]

## How the audience is meant to change
By episode [N], the listener thinks differently about: [specific shift]

## Guest test
Every guest for this arc should be able to speak to at least one of the three themes. Guests who cannot are not for this arc, even if they are famous.

## Do-not-book list
Guests who would be famous drops but do not fit the through-line. Named here so the host does not chase them.

## Publish framing
- Show description on Transistor / Apple / Spotify: [rewritten for the through-line]
- Trailer line: [one sentence]
- Sponsor one-sheet frame: [one sentence for advertisers]

## Next skill
- Route to `episode-planning-cadence` to slot the arc guests into publish weeks.
- Route to `sponsor-pitch` if this arc is going out to sponsors.
```

## The through-line discipline

The through-line is the one asset the show cannot afford to drift on. Rewrite it every 90 days. Compare it to the last 10 episodes. If the episodes have drifted from the through-line, either update the through-line to match the show that is actually happening, or update the show to match the through-line the host wants.

## Voice rules

- No abstract mission-statement language.
- Named specifics for the audience.
- Do not use "we explore," "we dive into," "we unpack." Use the specific verbs the show actually does.

## Related skills

- `episode-planning-cadence` — the cadence layer under the arc.
- `guest-outreach` — the guest-fit filter runs against the arc.
- `sponsor-pitch` — sponsors buy the arc, not the individual episodes.
- `decision-log` — for capturing the arc as a formal decision.
