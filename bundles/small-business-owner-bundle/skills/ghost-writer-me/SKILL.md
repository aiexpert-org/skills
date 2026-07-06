---
name: ghost-writer-me
description: "Draft a first pass of anything the operator needs to write, in the operator's own voice. Covers emails, LinkedIn posts, proposals, follow-ups, cold outreach, sales page copy, event invites, newsletter drafts, testimonial requests, and internal team memos. Loads the operator's voice canon and drafts in it. Trigger phrases include 'draft this for me', 'write this in my voice', 'first pass at', 'ghost this', 'write me a draft', 'draft an email', 'draft a post', 'draft a proposal', 'draft the follow-up', 'write this like I would', 'sound like me on this', 'draft in my voice', 'give me a draft', 'ghostwrite this', 'draft the reply'. Use when the operator has a writing task and wants a first-pass draft that already sounds like them. Do NOT trigger for factual documentation (that's not voice-heavy), for legal or regulatory copy (that requires review by counsel), or when no voice canon exists yet (offer to build one first)."
---

LAST-VERIFIED: 2026-07-06. Source of truth: brand voice canon convention from AI Expert OS Quick Start; adapted from Brett K. Moore voice-corpus-builder skill.

This skill drafts anything in the operator's voice. Small business owners lose hours every week writing the same kinds of messages: follow-ups, LinkedIn posts, sales page tweaks, newsletter openers. This skill drafts the first pass. The operator polishes. Time-to-send drops from 40 minutes to 5.

Output: a draft delivered as a chat message, optionally saved to `drafts/YYYY-MM-DD-slug.md` if the operator wants an archive.

## When to use

- Any email that will take more than 5 minutes to write.
- LinkedIn or social posts where voice matters.
- Follow-up messages after meetings, proposals, or intros.
- Sales page copy, landing pages, product descriptions.
- Newsletter drafts or opening lines.
- Internal team memos that need warmth.

## When NOT to use

- Factual documentation (SOPs, technical specs) where voice is not the point.
- Legal, regulatory, or contract language (that needs counsel).
- Transactional messages (order confirmations, receipts).
- No voice canon exists yet; offer to run `brand-voice-consistency` setup first.

## What you'll produce

Delivered as a chat message. Includes:

```
DRAFT: [Type of piece]
[For: recipient or audience]
[Purpose: what this draft is trying to do]

---

[The actual draft, in the operator's voice, ready to polish]

---

VOICE CHECK
- [Score against the operator's canon]
- [Any flagged phrases the operator might want to change]

REVISION OFFER
Want a shorter version? A different opener? A different close?
```

## Instructions

**Step 0. Lock four things.**
1. **The piece type.** Email, LinkedIn post, proposal section, sales copy, etc.
2. **The recipient or audience.** One person? A list? A page visitor?
3. **The purpose.** What is this draft trying to do? Move a deal forward? Sign a customer? Reactivate a dormant lead?
4. **The voice canon.** Load `voice.md` or the operator's voice corpus. If none, offer to build one first.

**Step 1. Ask for the raw material.** What key points must the draft cover? Any specific data the operator wants included (a number, a date, a link, a quote)? Any tone preference beyond the standard voice (warmer, sharper, funnier)?

**Step 2. Draft in voice.** Match the operator's:
- Sentence length pattern
- First-person or third-person preference
- Contractions, punctuation habits
- Favorite framings, forbidden phrases
- Sign-off style

Do not use em dashes. Do not use banned vocabulary from the operator's list. If no operator list exists, default to the Brett K. Moore HQ banned list: leverage, seamless, robust, empower, elevate, unlock, supercharge, best-in-class, holistic, ecosystem, journey, transformative, revolutionary, game-changer, cutting-edge, disruptive, delve, essentially.

**Step 3. Run a self-check pass.** Read the draft. Does it sound like the operator or does it sound like AI? If the second, rewrite it.

**Step 4. Deliver with a voice score.** Include a 1-10 score against the canon and flag any lines the operator might want to swap.

**Step 5. Offer revisions.** Shorter? Different opener? Different close? Different tone? Operator picks or ships.

## Examples

**Example 1.** Operator says "draft the follow-up to Buddy after our sales call." Skill fires. Loads Buddy's context. Loads voice. Drafts a warm 3-paragraph email that references the specific thing Buddy said on the call and asks a low-friction next step. Voice score 9/10. Operator ships as-is.

**Example 2.** Operator says "ghost this LinkedIn post about the new pricing." Skill fires. Loads voice. Drafts a 180-word post with the operator's typical structure (hook, story, insight, ask). Delivers with revision options for shorter and punchier variants.

**Example 3.** Operator says "write me a draft of the sales page hero." Skill fires. Loads voice + brand canon. Drafts a headline, subhead, and CTA copy. Voice score 8/10. Flags one line the operator might swap.

## Composes with

- `brand-voice-consistency`. polishes the draft after `ghost-writer-me` produces the first pass.
- `hoard`. pulls from the operator's captured winning subject lines and closers.
- `cold-outreach-discipline`. verifies sender reputation before any cold email drafted here is sent.
- `weekly-network-review`. drafts the outreach messages from the weekly punch list.
