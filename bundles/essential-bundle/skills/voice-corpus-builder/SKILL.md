---
name: voice-corpus-builder
description: "Walk the operator through building a personal voice corpus for Claude to reference when writing in their voice. Covers what to record, how to transcribe (Whisper Flow or similar), how to organize the corpus folder, and how to configure Claude to read from it. Produces a starter `voice-corpus/` folder plus a voice-fingerprint file Claude can load at the top of any writing session. Trigger phrases include 'voice corpus', 'capture my voice', 'clone my voice for Claude', 'voice reference for Claude', 'sound like me setup', 'build my voice', 'help Claude write in my voice', 'voice fingerprint', 'my voice profile', 'ghostwriter setup', 'voice corpus setup', 'set up my voice', 'train Claude on my voice'. Use when the operator wants Claude to write in their voice going forward. Do NOT trigger when the operator only wants to check one draft against their voice (that is a Persona Layer `brand-voice-consistency` or `ghost-writer-me` skill), when the operator has no time to record audio, or when the operator is asking for a one-off voice edit rather than a system."
---

LAST-VERIFIED: 2026-07-06. Source of truth: Brett K. Moore's `System/skills/voice-corpus-builder/SKILL.md` and the 9-axis voice-modeling methodology. This Essential Bundle version is scoped for the operator building their OWN voice corpus (not a third party's), simplified from the full 9-axis pass for approachability. Persona Layer bundles ship the full ghostwriting skills.

This skill sets up the operator's personal voice corpus. Claude writes in the operator's voice only as well as the corpus feeds it. Without a corpus, Claude falls back on a generic professional voice that sounds nothing like the operator. This skill walks the operator through the setup: what to record, how to transcribe, where to save it, and how to wire Claude to read from it every time a writing task lands.

Output: a `voice-corpus/` folder scaffolded in the operator's HQ, a `voice-fingerprint.md` starter file, and a chat-delivered walkthrough of the recording sessions the operator needs to run.

## When to use

- The operator wants Claude to write drafts in their voice from now on.
- The operator says "Claude keeps sounding like a robot" or "this doesn't sound like me."
- The operator is starting a content system (newsletter, LinkedIn, podcast scripts, book) and wants voice consistency.
- The operator wants to build a corpus once and reuse forever.

## When NOT to use

- The operator only wants one draft rewritten in their voice (route to `hoard` for the desired-voice snippet, then let Claude read that).
- The operator has no audio recording setup and is not willing to build one.
- The operator only wants a rules-based voice check on one deliverable (Persona Layer `brand-voice-consistency`).

## What you'll produce

A folder scaffolded at `voice-corpus/` in the operator's HQ:

```
voice-corpus/
├── README.md              What this folder is and how to use it
├── voice-fingerprint.md   10-line distillation Claude loads at every writing session
├── raw/                   Raw audio and transcripts (gitignored if using git)
│   ├── conversations/     Recorded conversations (dictated, meetings, podcasts)
│   ├── written/           Text the operator has already written (emails, posts)
│   └── recordings/        Long-form recordings (keynotes, teach-outs)
├── processed/             Cleaned transcripts and text
└── INDEX.md               File map of the corpus
```

Plus a `voice-fingerprint.md` starter that captures 10 lines the operator lives by (signature phrases, banned words, cadence, stance toward the reader).

## Instructions

**Step 0. Lock four things.**

1. **The target folder.** Default: `voice-corpus/` at the operator's HQ root. Confirm.
2. **The recording tools the operator uses.** Whisper Flow, Superwhisper, Otter, Riverside, Descript, none. If none, offer to route to `voice-input-protocol` first to set one up.
3. **The channels the operator writes in.** LinkedIn, email, newsletter, podcast, book, sales calls, internal Slack. Pick 2-3 to seed.
4. **The floor.** 30 minutes of transcribed audio plus 5,000 words of existing writing is the minimum for a starter fingerprint.

**Step 1. Scaffold the folder.** Create the `voice-corpus/` folder and subfolders. Write the `README.md` explaining what each subfolder is for.

**Step 2. Walk the operator through the seed sessions.**

Ask the operator to do three quick things this week:

1. **A 15-minute dictation.** Whisper Flow (or similar). Topic: "What I actually believe about my business, in my own words." Save the transcript to `voice-corpus/raw/conversations/YYYY-MM-DD-belief-dictation.md`.
2. **A 15-minute conversation.** With a friend, a client, or a partner. Recorded (Riverside, Otter). Any topic. Save to `voice-corpus/raw/recordings/YYYY-MM-DD-conversation.md`.
3. **A 5,000-word text pull.** The operator's best emails, posts, or writing they are proud of. Save to `voice-corpus/raw/written/best-of.md`.

**Step 3. Extract the fingerprint.**

Once the seed corpus is in place, run a lightweight extraction pass and write `voice-fingerprint.md` in this shape:

```
# [Operator Name] Voice Fingerprint

**Corpus:** [word count across all sources.]
**Extracted:** [Date.]

## Identity + stance
[One paragraph on how the operator shows up to the reader. Peer, coach, authority, friend, all four? Which stance dominates?]

## Sentence shape
[Median sentence length. Any rhythm markers. Does the operator use short punchy sentences, long flowing ones, or a specific ratio?]

## Signature phrases (top 5)
1. [Phrase]
2. [Phrase]
3. [Phrase]
4. [Phrase]
5. [Phrase]

## Banned vocabulary (top 5)
1. [Word the operator never uses]
2. [Word the operator never uses]
3. [Word the operator never uses]
4. [Word the operator never uses]
5. [Word the operator never uses]

## Openings
[How the operator starts pieces. Story-first, question-first, provocation-first, direct-assertion?]

## What the operator refuses to say
[Topics, framings, or vocabulary the operator explicitly avoids.]

## Load-bearing rules
- [Rule the operator always honors]
- [Rule the operator always honors]
- [Rule the operator always honors]
```

**Step 4. Wire Claude to load the fingerprint.**

Add a line to the operator's root `CLAUDE.md`:

```
# Voice corpus
@voice-corpus/voice-fingerprint.md
```

This makes Claude load the fingerprint at the top of every session so all future drafts read the operator's voice rules before writing.

**Step 5. Deliver the walkthrough.**

Chat message: "Corpus folder scaffolded at [path]. Three seed sessions to run this week (15-min dictation, 15-min conversation, 5,000-word text pull). Once those are in the folder, re-run `voice-corpus-builder` to extract the fingerprint. CLAUDE.md wired to load the fingerprint at every session."

## Examples

**Example 1.** Operator says "capture my voice, I want Claude writing my LinkedIn posts." Skill fires. Scaffolds `voice-corpus/`. Recommends channels: LinkedIn plus one other. Delivers the 3 seed sessions. Wires CLAUDE.md.

**Example 2.** Operator says "Claude doesn't sound like me, help me fix it." Skill fires. Diagnoses: no corpus. Scaffolds and delivers the seed session list. Notes that the fix compounds over time.

**Example 3.** Operator says "voice fingerprint, run it." Skill fires. Reads existing seed sessions in `voice-corpus/raw/`. Extracts and writes `voice-fingerprint.md`. Wires CLAUDE.md.

## Composes with

- `voice-input-protocol`. sets up the Whisper Flow / Superwhisper tooling needed for the seed dictation sessions.
- `hoard`. voice-worthy snippets get hoarded and feed the corpus over time.
- `claude-md-hygiene`. the CLAUDE.md line pointing at the fingerprint gets maintained.
- Persona Layer `ghost-writer-me` skills. use the fingerprint to draft in the operator's voice.

## Note on the full 9-axis extraction

The full 9-axis voice-modeling methodology (used to build voice specs for third parties like coaches, podcast guests, or clients) lives in the AI Expert OS Certified Practitioner curriculum. The Essential Bundle version is scoped for the operator building their own voice corpus, at approachable depth. If the operator needs a third-party voice spec (writing in their trainer's voice, their coach's voice, a client's voice), route to the Mastery Layer.
