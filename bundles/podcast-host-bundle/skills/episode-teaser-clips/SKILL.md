---
name: episode-teaser-clips
description: "Design the teaser clip strategy for a recorded episode. Produces the clip target list (which moments to cut), the platform-by-platform format spec, the hook line for each clip, and the posting cadence. Runs on Riverside Magic Clips, Descript, or manual cuts. Trigger phrases include 'teaser clips', 'episode clips', 'promo clips', 'cut clips from the episode', 'social clips', 'clip strategy for [episode]', 'promo cuts'. Do NOT trigger for the show notes (route to `show-notes-writer`) or for the transcription workflow (route to `podcast-transcription-workflow`)."
---

LAST-VERIFIED: 2026-07-06. Source of truth: Brett K. Moore, AI Expert Marketplace v1.1.0.

This skill designs the teaser clip strategy for a recorded episode. The clips are the discovery surface for the episode: they run on Instagram Reels, TikTok, YouTube Shorts, and LinkedIn, and they drive the click to the full show.

## When to use

- An episode has been recorded and the host is preparing the promo.
- The host wants a structured clip plan, not "I'll pull a few good moments."

## When NOT to use

- The episode is short-form itself (no clips needed).
- The host is doing the show notes (route to `show-notes-writer`).

## Inputs the operator provides

- Episode transcript with timestamps.
- Guest name and handles.
- Publish date.
- Target platforms (Reels, TikTok, Shorts, LinkedIn).
- Clip tool (Riverside Magic Clips, Descript, manual).

## The clip target list

Pull five to eight moments from the transcript:

1. **The best line.** The one moment that would make a stranger stop scrolling.
2. **The frame-setter.** The moment the guest names the tension or the surprise at the heart of the episode.
3. **The reveal.** The moment the guest says something specific and countable.
4. **The credit.** The moment the guest names someone else who deserves credit (this clip amplifies well and often earns a share from the person named).
5. **The take.** The guest's strongest opinion in the episode.
6. **The story.** A 45-second story with a beginning, middle, and end.
7. **The hook for the show.** A moment where the host's frame lands and the show's brand becomes clear.
8. **(Optional) The blooper.** A moment of genuine laughter or an off-script exchange.

## The platform format spec

### Instagram Reels and TikTok
- 9:16 vertical, 15 to 60 seconds.
- Captions burned in.
- Hook line as the first-frame overlay.
- Cover frame is the guest's face mid-speech, not a static thumbnail.
- Audio: guest's voice, no music bed (music competes with clip readability at speed).

### YouTube Shorts
- 9:16 vertical, up to 60 seconds.
- Same source cut as Reels/TikTok.
- Description includes the full episode link and the show subscribe CTA.

### LinkedIn
- 1:1 square or 9:16 vertical, up to 90 seconds.
- Captions burned in.
- Description written in the host's voice with the episode link and one specific line from the clip.
- Tag the guest.

## The hook line

For each clip, write the first-frame overlay text (max 8 words). This is the "will they watch or scroll" line.

## The posting cadence

- **Clip 1 (the best line)** — publish 3 days before the episode drops. Tease with "full episode Monday."
- **Clip 2 (frame-setter)** — publish morning of episode drop.
- **Clip 3 (reveal)** — publish 2 days after drop.
- **Clip 4 (credit)** — publish 4 days after drop, tag the person credited.
- **Clip 5 (take)** — publish 7 days after drop.
- **Clips 6 to 8** — evergreen; publish across the following 30 to 60 days.

## Output shape

```
TEASER CLIPS: Episode [N] — [guest name] — [publish date]

## Clip 1 — The best line
- Timestamp: [MM:SS - MM:SS]
- Duration: [seconds]
- Hook line: [8 words max]
- Caption: [hosts's voice, LinkedIn variant]
- Post date: [X days before episode drop]

## Clip 2 — Frame-setter
[same structure]

## Clip 3 — Reveal
[same structure]

## Clip 4 — Credit
[same structure + who to tag]

## Clip 5 — Take
[same structure]

## Clip 6-8 — Evergreen bank
[same structure with post dates in the following 60 days]

## Production notes
- Tool: [Riverside Magic Clips | Descript | manual]
- Captions: burned in
- Cover frames: [specified]
```

## Voice rules

- Hook lines are specific. Not "you have to hear this." Something the clip itself is about.
- Do not overuse "shocking," "unreal," or clickbait. It works once and then the account gets penalized.
- Named guest tagged in every post.

## Related skills

- `show-notes-writer` — for the full show notes.
- `podcast-transcription-workflow` — for the transcript that feeds this skill.
- `guest-outreach` — the follow-up asks after the clip amplification.
- `hoard` — for saving the clip patterns that produced the highest reach.
