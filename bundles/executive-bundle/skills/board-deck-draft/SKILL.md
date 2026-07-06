---
name: board-deck-draft
description: "Draft a first-pass board deck from a bullet outline the executive supplies. Produces a five-section slide-by-slide draft (last quarter, this quarter plan, risks, asks, appendix) in the operator's voice, ready for the executive to polish before the meeting. Writes the draft to a disposable session-scoped location; the operator moves the polished version into their canonical board folder. Trigger phrases include 'draft board deck', 'board slides', 'board deck', 'quarterly board prep', 'board meeting prep', 'investor update deck', 'draft the board update', 'prep the board deck', 'pre-read for the board', 'board pre-read', 'quarterly board update', 'board pack draft', 'the board meets on'. Also invoke implicitly when the executive names an upcoming board meeting and mentions materials are not yet started. Do NOT trigger for a full annual meeting deck (that runs longer and needs a separate skill), for a fundraising pitch deck (different genre, different audience), or when the executive says they will draft the deck themselves and only wants section-by-section coaching."
tools: Read, Write
---

LAST-VERIFIED: 2026-07-06. Source of truth: OpenView Partners board update template, Jason Lemkin SaaStr board deck posts, Brett K. Moore's operating rhythm. Re-verify if the standard board-deck structure shifts materially.

This skill takes an outline (dictated notes, a rough set of bullets, or answers to the intake questions below) and produces a slide-by-slide first-pass board deck ready for polish. The output is a Markdown document that mirrors slide order, with speaker-notes for each slide. The executive polishes into their preferred slide tool (Keynote, PowerPoint, Google Slides, Pitch, Canva) after review.

Output goes to a disposable session-scoped path: `~/tmp/board-draft-<YYYY-MM-DD>.md` (or the equivalent session temp on the operator's system). The permanent board folder is the operator's canonical location; the skill does not write there directly, so the executive stays in control of what lands in their board archive.

## Step 0: Confirm the four intake items

Before drafting, lock four things.

1. **Which quarter or period.** Q3 2026, month of October, first 100 days, whatever the frame is. If ambiguous, ask.
2. **The audience.** Full board (independents plus investors plus founder), investor-only sub-set, advisory board. The tone and disclosure level shift with audience.
3. **Materials the executive can hand you.** Financial snapshot, hiring update, product update, pipeline snapshot, prior deck. If none, the draft is skeletal until the executive fills the gaps.
4. **The top three things the executive wants the board to walk out believing.** This is the load-bearing intake. The whole deck is built to make these three things land. If the executive cannot name them, run the intake conversation until they can.

If any of the four are missing, ask for them before writing a single slide.

## Standard section shape

Every board deck built by this skill has the same five sections. Skip sections if the executive says so, do not add sections without asking.

**Section 1: State of the business (2 to 4 slides).**
- Slide 1: One-sentence headline for the quarter. The most important thing the board needs to know first.
- Slide 2: Key metrics dashboard (ARR, MRR growth, cash on hand, runway, headcount, active customers). Compared to plan and to prior quarter.
- Slide 3 (optional): Cohort snapshot or retention chart if the business is a subscription or usage model.
- Slide 4 (optional): Big wins and big losses. Two to four bullets per side. Honest.

**Section 2: This quarter's plan (2 to 3 slides).**
- Slide 5: The one to three focus bets for the coming quarter. Named, scoped, owned.
- Slide 6: The KPI targets for each focus bet.
- Slide 7 (optional): The dependencies and the risk on each focus bet.

**Section 3: Risks and mitigations (1 to 2 slides).**
- Slide 8: Top three to five risks. Named, sized (severity + probability), and each one paired with a mitigation the executive is running.
- Slide 9 (optional): One deeper-dive risk that the board should discuss in-meeting rather than read on-page.

**Section 4: Asks (1 slide, sometimes 2).**
- Slide 10: What the executive is asking the board for. Introductions, decisions on specific proposals, sign-off on comp changes, sign-off on strategic moves, capital plans. Be specific.

**Section 5: Appendix (as many as needed).**
- Full financials, org chart, product roadmap detail, pipeline detail, customer references. Everything the board might want to skim before or after the meeting.

## Output format

Return a Markdown document with the following structure:

```
# Board Deck Draft, [Company Name], [Quarter/Period]

**Meeting date.** [YYYY-MM-DD]
**Audience.** [Board composition]
**Top three things the board should walk out believing.**
1. [thing one]
2. [thing two]
3. [thing three]

---

## Slide 1: [Headline]

**On-slide content.** [What appears on the actual slide, bullets or short lines.]
**Speaker notes.** [What the executive says while the slide is up, three to six sentences.]

## Slide 2: [Metrics dashboard]

[Same shape.]

[...continue for every slide...]

---

## Slides the executive should consider adding

[If the intake surfaced anything the standard structure did not cover, list it here with a recommendation.]

## Follow-up items after the meeting

[Things the executive should be ready to circulate post-meeting: minutes, decisions, action items, sensitive-topic distribution list. This is NOT the follow-up itself, it is a reminder list.]
```

## Voice rules for the draft

The draft is in the operator's voice, not the agent's. If the executive has run `voice-corpus-builder` (in a separate skill), read the corpus and match cadence. If not, default to the HQ voice rules: conversational, confident, no em dashes, no banned vocabulary.

Board decks are read by directors who scan first and read second. Every headline slide has to make sense in isolation. Every speaker note is what the executive says while the slide is up, not what the slide already shows.

## Sensitive disclosure discipline

Boards need to see risks. Employees do not need to see the same-day draft. Every draft ends with a distribution reminder: this file lives in a disposable session location, and the executive is responsible for moving the polished version into a directors-only folder before circulation. The skill does not auto-share, auto-email, or auto-post the draft anywhere.

If the draft contains layoff plans, comp discussions, litigation, or any material non-public information, flag it at the top of the output: `SENSITIVE MATERIAL, DO NOT CIRCULATE OUTSIDE THE BOARD.`

## When to invoke

Invoke when the executive names a coming board meeting and wants a first-pass draft. Invoke when the executive says the deck is not started yet and the meeting is soon. Invoke when the executive shares raw materials (financials, hiring update, product update) and asks for a deck built from them.

## When NOT to invoke

Do not invoke for a full annual meeting deck (different scope, different length). Do not invoke for a fundraising pitch deck (different genre entirely, different audience, different narrative). Do not invoke when the executive says they will draft the deck themselves and wants section-by-section coaching (that is a coaching conversation, not a draft).

## Companion skills

Runs cleanly next to `investor-update` (monthly updates use overlapping material). Feeds `hard-conversation` when a board slide surfaces something the executive needs to raise in-meeting. Uses `principle-check` output when the executive is proposing a strategic bet the board might question. If the draft contains sensitive material, `ghost-writer-me-exec` can polish the speaker notes into meeting-ready remarks.
