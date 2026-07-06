---
name: guest-research
description: "Research a booked guest before the interview. Produces the guest-brief document covering their public work, their private wins, their current focus, their unspoken tensions, and the three things no other host has asked them. Built for the Apex Podcast Co ICP: authenticity-focused musicians, real estate operators, and executives referred by PodcastNetwork.org. Trigger phrases include 'guest research', 'research my guest', 'guest brief', 'guest prep research', 'research [name] for the podcast', 'guest background', 'guest one-pager'. Do NOT trigger for question design (route to `interview-question-designer`) or for the whole pre-interview prep (route to `episode-planning-cadence`)."
---

LAST-VERIFIED: 2026-07-06. Source of truth: Brett K. Moore, AI Expert Marketplace v1.1.0.

This skill produces the guest research brief for a podcast host preparing for an interview. It goes past the surface Wikipedia summary and surfaces the specific things about the guest that make them worth 60 minutes of the audience's time.

Apex Podcast Co's ICP is authenticity-focused: musicians building real audiences, real estate operators building real portfolios, and executives referred by PodcastNetwork.org. The research brief tunes to that ICP by pulling on threads a generic "guest summary" tool would miss.

## When to use

- The host has a guest booked in the next 14 days.
- The host wants to walk into the interview prepared to ask questions no other host has asked.
- The show is authenticity-focused and the guest brief matters more than a scripted rundown.

## When NOT to use

- The host is designing the questions themselves (route to `interview-question-designer`).
- The host is doing the whole cadence planning (route to `episode-planning-cadence`).

## Inputs the operator provides

- Guest name.
- Guest's public role (musician, real estate operator, executive, other).
- Any prior connection between the host and the guest.
- Show format and typical episode length.
- Any specific topic the guest agreed to talk about.

## The five sections of the brief

### 1. Public work

- Bio essentials: name, role, company or band or portfolio, location.
- Three most recent public artifacts (album, project, deal, post, interview).
- Where the guest has been interviewed before, and what they said there. Specifically what they have already said in other interviews so the host doesn't re-run the same territory.

### 2. Private wins

- What the guest is proud of that they don't advertise. Look in credits, liner notes, second-tier interviews, LinkedIn posts they wrote themselves. The moments they mentioned in passing.
- The people they name as their teachers, collaborators, or catalysts.
- The number they are secretly proud of (revenue, followers, plays, close rate, students taught).

### 3. Current focus

- What is the guest actually working on right now?
- What did they post about in the last 30 days?
- What did they cancel, decline, or stop doing recently?

### 4. Unspoken tensions

- Where is there a gap between what the guest says publicly and what the evidence suggests?
- Where is the guest in transition (from performing to teaching, from operating to investing, from one company to another)?
- What is the guest not saying that a good host would probe?

### 5. Three questions no other host has asked

Based on the above four sections, propose three specific questions the host can ask that would surprise the guest. Not trick questions. Not gotchas. Questions that make the guest lean in and think.

## Output shape

```
GUEST BRIEF: [guest name] — [interview date]

## Public work
[bio + three artifacts + prior interviews]

## Private wins
[what they are quietly proud of]

## Current focus
[what they are working on right now]

## Unspoken tensions
[where the guest is in transition or where there is a gap]

## Three questions no other host has asked
1. [specific question]
2. [specific question]
3. [specific question]

## Ice-breaker line
[one specific opening line based on the research]

## Do not ask
[anything the guest has already answered in 3+ prior interviews the same way]
```

## Voice rules

- Specifics only. Named people, named projects, named numbers.
- Do not editorialize. The brief is intelligence, not opinion.
- Do not manufacture a tension that isn't there.

## Related skills

- `interview-question-designer` — for the full question flight built from the brief.
- `episode-planning-cadence` — for the full pre-interview cycle.
- `hoard` — for saving research patterns that produced the best guest questions.
