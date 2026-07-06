---
name: podcast-transcription-workflow
description: "Set up and run the transcription workflow for the show. Covers the tool choice (Riverside auto-transcription, Descript, Whisper, human editor), the accuracy pass, the redaction pass, and the delivery to show-notes-writer and episode-teaser-clips. Trigger phrases include 'transcription workflow', 'transcribe the episode', 'transcript pipeline', 'set up transcription', 'transcript pass', 'episode transcript'. Do NOT trigger for the show notes (route to `show-notes-writer`) or for the clip cuts (route to `episode-teaser-clips`)."
---

LAST-VERIFIED: 2026-07-06. Source of truth: Brett K. Moore, AI Expert Marketplace v1.1.0.

This skill sets up and runs the transcription workflow for the show. The transcript is the source artifact that feeds show notes, teaser clips, SEO, and searchability.

## When to use

- The show is recording episodes and needs a repeatable transcription pipeline.
- The host is currently paying a human transcriber and wants an AI-first alternative.
- The transcript quality is inconsistent and needs a QA pass.

## When NOT to use

- The host has a working transcription workflow they are not looking to change.
- The recording is not being published (no transcript needed).

## Inputs the operator provides

- Recording tool (Riverside, Descript, Zoom, in-person + Rode mic).
- Current transcription tool (if any).
- Episode length range.
- Publishing platforms (Transistor, Apple, Spotify, YouTube).
- Budget per episode for transcription.

## The tool choice

### Riverside auto-transcription (default for AI-native shows)
- Runs automatically during Riverside recording.
- Cost: included in Riverside subscription.
- Accuracy: 90 to 95% on clean audio.
- Best for: interview-format shows with clean Riverside recordings.

### Descript
- Runs as part of the Descript editing workflow.
- Cost: included in Descript subscription.
- Accuracy: 92 to 96% with Studio Sound applied.
- Best for: shows that already edit in Descript.

### Whisper (via API or self-hosted)
- OpenAI Whisper API for cloud, or Whisper self-hosted for privacy.
- Cost: about $0.006 per minute on the API.
- Accuracy: 95%+ on clean audio.
- Best for: shows that need programmatic access to the transcript.

### Human editor (fallback)
- $1.50 to $2.50 per audio minute.
- Accuracy: 99%.
- Best for: high-stakes episodes (legal review, medical content, live event recording).

## The accuracy pass

Regardless of the tool, run a 5-minute accuracy pass on every transcript:

1. Fix the guest's name spelling.
2. Fix any technical terms the AI transcribed wrong.
3. Fix the branded product names.
4. Correct the two or three key quotes that will run in show notes and clips.
5. Do NOT try to make the whole transcript perfect. 90% accuracy is enough for show notes and clips.

## The redaction pass

Before publishing:

- Remove any credentials the guest accidentally read aloud (yes, this happens).
- Remove any live customer names the guest asked to redact after the recording.
- Remove any moment the guest asked to cut (unless the host has editorial disagreement — resolve with the guest before publishing).

## The delivery

Once the transcript is accurate and redacted:

- Feed it to `show-notes-writer` for chapter markers, description, and key quotes.
- Feed it to `episode-teaser-clips` for the clip cut list.
- Save the raw transcript file to the show's archive (searchable across all episodes).

## Output shape

```
TRANSCRIPTION WORKFLOW: [episode name] — [date]

## Tool used
- [Riverside | Descript | Whisper | Human]

## Accuracy pass
- Guest name spelling: [confirmed]
- Technical terms corrected: [list]
- Key quotes verified: [count]

## Redaction pass
- Credentials removed: [yes | no | none present]
- Guest-requested cuts: [applied | pending confirmation from guest]

## Delivery
- Transcript file: [path]
- Fed to show-notes-writer: [date]
- Fed to episode-teaser-clips: [date]
- Archived at: [path]

## Cost per episode
- [$ amount]

## Time per episode
- Transcription: [auto or minutes]
- Accuracy pass: 5 min
- Redaction pass: [2 to 10 min depending on content]
- Total human time: [X min]
```

## The cost discipline

The whole point of the AI-native workflow is that the human time drops to 10 to 15 minutes per episode. If the accuracy pass is running to 30 minutes routinely, the tool choice is wrong (upgrade to a higher-accuracy tool, or clean the input audio).

## Voice rules

- No em dashes.
- Do not over-invest in transcript perfection past what the show notes and clips need.

## Related skills

- `show-notes-writer` — the primary consumer of the transcript.
- `episode-teaser-clips` — the second consumer.
- `hoard` — for saving the transcription-cleanup patterns that repeat.
