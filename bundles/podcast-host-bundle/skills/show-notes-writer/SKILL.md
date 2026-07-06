---
name: show-notes-writer
description: "Write the show notes for a recorded episode. Produces the episode title, the two-paragraph description, the timestamped chapter markers, the guest bio, the key quotes, the links mentioned, and the SEO metadata. Trigger phrases include 'show notes', 'write show notes', 'episode description', 'chapter markers', 'timestamp the episode', 'episode metadata'. Do NOT trigger for the show's overall arc (route to `show-brand-arc`) or for the promo clips (route to `episode-teaser-clips`)."
---

LAST-VERIFIED: 2026-07-06. Source of truth: Brett K. Moore, AI Expert Marketplace v1.1.0.

This skill writes the show notes for a recorded episode. The show notes are the SEO surface, the discovery surface, and the "did I remember to include the link they mentioned?" reference for the listener.

## When to use

- An episode has been recorded and the transcript is available (from Riverside auto-transcription, Descript, or a manual pass).
- The host is prepping to publish the episode within the next 48 hours.

## When NOT to use

- The transcript is not yet available (get the transcript first).
- The episode is a promo clip or short-form (that is a different artifact; route to `episode-teaser-clips`).

## Inputs the operator provides

- Transcript file or paste.
- Guest name and bio.
- Any specific asset, book, product, or URL the guest asked to have linked.
- Publish date and platform (Transistor, Apple, Spotify, YouTube).

## The seven elements

### 1. Episode title

- 60 to 90 characters.
- Guest name + one specific hook from the interview.
- Not "Episode 42: Interview with John Smith." Something that would make the listener click.

### 2. Two-paragraph description

- Paragraph 1: the frame. What this conversation is really about, positioned as a promise to the listener.
- Paragraph 2: the specific things the listener will hear. Named topics, named moments.

### 3. Timestamped chapter markers

- Extract from the transcript.
- Format: `MM:SS - Chapter title`.
- Aim for 8 to 15 chapters in a 60-minute episode. Enough for skimmable navigation, not so many that they feel granular.

### 4. Guest bio

- Two or three sentences.
- Match the guest's canonical form (LinkedIn About or their own website), edited for length.

### 5. Key quotes

- Three to five verbatim quotes from the guest.
- Each 20 to 40 words.
- Pull-quote worthy. Something a listener would screenshot.

### 6. Links mentioned

- Every URL, product, book, or reference mentioned in the episode.
- Linked with the guest's approval where the guest asked for a specific link.

### 7. SEO metadata

- Meta description (155 characters).
- Focus keyword (guest's name or the primary topic).
- Alt text for the episode artwork (if published to a page).

## Output shape

```
EPISODE [N]: [guest name] — [episode title]
Publish date: [date]

## Description
[paragraph 1]

[paragraph 2]

## Chapter markers
00:00 - [chapter]
02:34 - [chapter]
...

## Guest bio
[two or three sentences]

## Key quotes
1. "[quote]"
2. "[quote]"
3. "[quote]"

## Links mentioned
- [name]: [URL]
- [name]: [URL]

## SEO
- Meta description: [155 chars]
- Focus keyword: [term]
- Alt text: [description]

## Publish checklist
- [ ] Audio uploaded to Transistor
- [ ] Show notes pasted
- [ ] Guest tagged on socials
- [ ] Teaser clips scheduled (route to episode-teaser-clips)
```

## Voice rules

- No em dashes.
- No "in this episode we dive deep into." Use specific language.
- Guest name spelled correctly (double check).
- Do not paraphrase quotes. Verbatim only.

## Related skills

- `episode-teaser-clips` — for the promo clips built from the same episode.
- `guest-followup` — for the post-episode guest thank-you.
- `podcast-transcription-workflow` — for the transcript pipeline that feeds this skill.
