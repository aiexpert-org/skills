---
name: ghost-writer-me-exec
description: "Draft high-stakes writing in the executive's voice: LinkedIn thought-leadership posts, keynote scripts, all-hands remarks, layoff communications, investor emails, board memos, sensitive employee messages, and any writing that carries reputational or emotional weight. Runs three drafts (defensible, warm, direct) so the executive picks the tone that fits the audience. Output goes to a disposable session-scoped path. Trigger phrases include 'draft this for me', 'in my voice', 'keynote draft', 'all-hands remarks', 'high-stakes email', 'draft the LinkedIn post', 'thought leadership piece', 'draft this carefully', 'sensitive message', 'need to write this in my voice', 'ghost write', 'write this as me', 'draft as the CEO', 'board memo', 'layoff comms', 'departure announcement', 'apology letter', 'response to the customer'. Also invoke implicitly when the executive names a piece of writing with reputational stakes and does not have time to draft from scratch. Do NOT trigger for routine emails or internal messages the executive can draft in two minutes (this skill's overhead is not worth it), for anything requiring Legal review before the draft locks (route to Legal first), or when the executive has not run or does not want to run a voice corpus (the draft will sound generic without the corpus)."
tools: Read, Write
---

LAST-VERIFIED: 2026-07-06. Source of truth: the general operator-community practice on executive voice writing, Brett K. Moore's operating rhythm, and the voice-corpus feeding pattern from the AI Expert firm's Fractional CAIO engagements. Re-verify quarterly.

This skill drafts high-stakes writing in the executive's voice. The draft runs in three tone variants: defensible (the version legal would approve, tightest), warm (the version that lands humanly, best for internal audiences), and direct (the version that respects the reader's time and gets to the point in two paragraphs).

The executive reads all three, picks one (or synthesizes across them), and polishes. The draft never sends automatically.

Output goes to a disposable session-scoped path: `~/tmp/ghost-write-<slug>-<YYYY-MM-DD>.md`. The executive is responsible for moving the polished version into the correct sending channel.

## Step 0: Confirm the six intake items

1. **The audience.** LinkedIn readers, all-hands attendees, the board, a specific customer, all employees, a specific investor. This shapes tone and disclosure level.

2. **The context.** What is the writing responding to? A moment (layoff, funding announcement, product launch), a recurring cadence (LinkedIn post, all-hands opener), a specific request. Named.

3. **The desired outcome.** What does the audience walk away believing, feeling, or committed to? Named.

4. **The stakes.** Why does the executive want this ghostwritten instead of drafting themselves? Reputational (LinkedIn), emotional (layoff), high-visibility (keynote), high-frequency (weekly cadence they cannot sustain). Naming the stakes shapes the tone.

5. **The voice corpus.** Does the executive have a voice corpus available? If yes, load it; if not, ask for two to three prior samples of the executive's writing that landed well (a LinkedIn post they wrote, an email that got a good response). Without any voice signal, the draft goes generic and the executive rejects it.

6. **Sensitive material check.** Does this writing touch legal exposure, financial disclosure, or specific person-names in a way that requires review before sending? If yes, flag at the top of the output.

If any of the six are missing, ask before drafting.

## The three-tone-drafts pattern

Every ghost-writing pass produces three drafts. The executive picks one or synthesizes.

**Draft 1: Defensible.**
The version an in-house legal team would sign off on. Tight. Every claim substantiated. Nothing that could be misread. Sits at the low-emotion, high-precision end of the spectrum. Best for regulatory filings, litigation-adjacent messages, and formal external communications.

**Draft 2: Warm.**
The version that lands humanly. Acknowledges the reader's emotional state (grief in a layoff, excitement in an announcement, frustration in a customer response). Uses concrete examples. Written in the executive's voice with the emotional-processing layer intact. Best for internal audiences, all-hands remarks, and personal customer responses.

**Draft 3: Direct.**
The version that respects the reader's time. Two paragraphs maximum. Opens with the point. No warm-up. No throat-clearing. Written in the executive's voice with all the padding stripped. Best for high-velocity leaders, board audiences, and follow-up messages after a live conversation.

## Output format

Return a Markdown document in this shape:

```
# Ghost-Writing Pass, [slug], [YYYY-MM-DD]

**Audience.** [Named]
**Context.** [What this is responding to]
**Desired outcome.** [What the audience walks away with]
**Stakes.** [Why ghostwritten]
**Voice corpus loaded.** [Yes, from [source]. Or: No, drafted on prior samples: [list].]

**Sensitive material flag.** [If any of legal / financial / person-name concerns exist, flag them here.]

---

## Draft 1: Defensible

[Full draft.]

---

## Draft 2: Warm

[Full draft.]

---

## Draft 3: Direct

[Full draft.]

---

## Voice notes

[Two to four sentences explaining the voice-corpus signals the drafts drew from: pacing, vocabulary, sentence length, patterns to keep, patterns to avoid. This is the diff between a ghost-written draft that feels like the executive and one that feels like a template fill-in.]

## Sending checklist

- [ ] Executive read all three drafts.
- [ ] Executive picked one or synthesized.
- [ ] If flagged sensitive, Legal reviewed.
- [ ] Executive moved final version into sending channel (LinkedIn, email, all-hands script).
- [ ] Disposable session file destroyed.
```

## Voice rules

The drafts must sound like the executive. If the voice corpus is loaded, honor it. If it is not, be conservative: no invented metaphors, no attempts at signature phrases, no adopted quirks. A neutral-but-professional draft that lets the executive add voice on the polish pass beats a draft that overreaches on voice and misses.

HQ router voice rules apply: no em dashes, no banned vocabulary, no "X, not Y" copywriting patterns, no emojis.

For LinkedIn thought-leadership specifically: no listicle openings, no "here is what nobody talks about" hooks, no "seven lessons from ten years." Executive voice on LinkedIn works when it names a specific observation from the executive's actual week, not when it mimics viral-post templates.

## High-stakes categories: extra discipline

**Layoff communications.** Draft the version the affected employee reads first (personal, direct, respectful). Draft the all-hands version second (context-setting, honest about the business reason, no blame on the departing). Draft the external version third (short, factual, non-derogatory). Never bundle the three into one message.

**Board memos on sensitive topics.** Draft the version the board reads before the meeting (pre-read, distributes to memory). Draft the version discussed in-meeting (verbal talking points). Flag any material non-public information.

**Investor emails during a raise.** Do not draft. Route to a fundraising-specific skill. Fundraise messaging is regulated by different rules than routine investor updates.

**Customer escalations.** Draft the version that acknowledges the customer's specific issue in their specific language. Draft the version that names what the executive is doing about it in specific terms. Never draft a version that pretends the issue does not exist.

## When to invoke

Invoke when the executive names a piece of writing with reputational or emotional stakes. Invoke when the executive says "draft this for me" or the trigger phrases. Invoke implicitly when the executive is under time pressure on a high-stakes message.

## When NOT to invoke

Do not invoke for routine emails or internal messages the executive can draft in two minutes. Do not invoke for anything requiring Legal review first. Do not invoke when the executive has not run a voice corpus and does not want to.

## Companion skills

Reads from `voice-corpus-builder` output (if installed). Runs alongside `hard-conversation` (many hard conversations produce a written follow-up in the executive's voice), `decision-quality-check` (some drafts are downstream of a decision the executive is about to lock), `board-deck-draft` (speaker notes get polished by this skill), and `investor-update` (the "what is on my mind" section often ghost-writes well through this skill).
