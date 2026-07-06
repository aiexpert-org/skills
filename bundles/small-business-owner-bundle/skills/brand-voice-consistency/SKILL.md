---
name: brand-voice-consistency
description: "Check any piece of copy against the operator's brand voice canon and flag off-voice phrasing. Loads the operator's voice reference (a `voice.md` file, a set of past emails, or a captured corpus), scores the draft against the voice, flags banned vocabulary, banned punctuation patterns, and off-tone phrasing. Rewrites the copy in voice if the operator asks. Trigger phrases include 'make this sound like me', 'voice check', 'brand voice', 'in my voice', 'on brand', 'does this sound like our brand', 'sound like me', 'is this on brand', 'voice audit', 'brand voice review', 'sound right', 'match my voice', 'off brand', 'check the voice'. Use when the operator has a draft (email, post, page copy, headline) and wants to know if it sounds like them. Do NOT trigger when there is no voice reference yet (route to voice corpus setup), when the operator is asking for a factual edit (that is not a voice question), or when the draft is a transactional message (order confirmation, receipt) that shouldn't sound personal."
---

LAST-VERIFIED: 2026-07-06. Source of truth: brand voice discipline from AI Expert OS Quick Start install pattern; Brett K. Moore voice-corpus-builder skill in the vault.

This skill is the voice referee. Marketing agencies and AI writing tools produce copy that sounds like anyone. The operator's voice is the one thing that makes their business feel like theirs. This skill loads the operator's voice canon, holds every draft up against it, and either signs off or rewrites.

## When to use

- Before publishing a landing page, LinkedIn post, or email newsletter.
- When outsourced copy comes back and needs a voice pass.
- When the operator wonders "did I write this or did an AI?"
- Any final-mile edit before sending.

## When NOT to use

- No voice canon exists yet. Route the operator to build one first.
- The edit is factual, not stylistic (a wrong price, a broken link, a typo).
- The copy is transactional (order confirmation, receipt, appointment reminder).
- The operator is drafting internal-only ops docs where voice doesn't matter.

## What you'll produce

```
VOICE CHECK
[Draft: 3 paragraphs, 240 words]

VOICE SCORE: [1-10]
Notes: [what's on voice, what's off]

FLAGGED ITEMS
- Line 4: "leverage our expertise". banned word "leverage". Suggested rewrite: "use what we know."
- Line 7: em dash. replace with period.
- Line 12: "seamlessly integrate". banned phrase. Suggested rewrite: "plug into."

REWRITE OFFER
Want me to rewrite the whole draft in your voice? Y/N
```

## Instructions

**Step 0. Lock four things.**
1. **The voice source.** Where does the operator's voice canon live? Check in order: `voice.md` in the HQ, `brand/voice.md` in the project, a corpus of past emails, a captured tone of voice from onboarding. If none, surface and offer to build one.
2. **The draft.** Full text of what's being checked.
3. **The channel.** Email, landing page, social post, proposal. the register shifts per channel.
4. **The banned list.** Load the operator's specific banned words. If none defined, default to the Brett K. Moore HQ banned list: essentially, leverage, robust, seamless, empower, elevate, unlock, supercharge, best-in-class, holistic, ecosystem, journey, transformative, revolutionary, game-changer, cutting-edge, disruptive, delve. Plus: no em dashes.

**Step 1. Read the voice canon.** Extract the operator's tone markers: conversational or formal, first-person or third-person, sentence length pattern, favorite framings, forbidden framings.

**Step 2. Scan the draft.** For each sentence: does it match the tone? Are any banned words present? Are any em dashes present? Are there X-not-Y patterns the operator's canon forbids?

**Step 3. Score and flag.** Assign a 1-10 voice score. List each off-voice item with the line number, the issue, and a suggested rewrite in voice.

**Step 4. Offer a full rewrite.** If the score is under 7 or the operator asks, rewrite the whole draft in voice. Do not just fix the flags. Rewrite so the whole thing sounds like the operator.

**Step 5. Show the diff.** Original and rewrite side by side, or a bullet list of what changed. Operator picks the version.

## Examples

**Example 1.** Operator pastes a landing page draft and says "does this sound like our brand?" Skill fires. Loads brand voice from `brand/voice.md`. Finds 4 banned words and 2 em dashes. Scores 5/10. Rewrites the draft; operator approves the rewrite.

**Example 2.** Operator says "voice check this LinkedIn post I drafted." Skill fires. Post is 90% on voice. Scores 9/10. Flags one "leverage" and suggests "use." Operator accepts the one-line edit.

**Example 3.** Operator says "make this newsletter sound like me, not like an AI." Skill fires. Loads voice from a 20-email corpus. Rewrites full newsletter. Operator ships.

## Composes with

- `ghost-writer-me`. drafts first-pass copy in voice; this skill polishes it.
- `weekly-review`. voice consistency check runs on the operator's week-end note.
- `hoard`. captures a voice canon file if the operator does not have one yet.
