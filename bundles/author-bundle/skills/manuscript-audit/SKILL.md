---
name: manuscript-audit
description: "Audit a complete or in-progress manuscript against the book's stated thesis, target reader, promise on the cover, and structural coherence. Surfaces the specific chapters where the argument sags, the sections where the voice drifts, the cases where the promise on the cover is not delivered inside, and the places where the book duplicates itself. Trigger phrases include 'manuscript audit', 'audit my book', 'read my manuscript', 'manuscript review', 'developmental edit brief', 'audit the draft', 'book coherence check'. Do NOT trigger for a copy-edit or line-edit (that is a different discipline), or for a full paid manuscript review (route to Legacy Publishing Manuscript Review at $497)."
---

LAST-VERIFIED: 2026-07-06. Source of truth: Brett K. Moore, AI Expert Marketplace v1.1.0.

This skill runs a developmental-editing pass on a manuscript. It is the audit that surfaces the structural problems before a copy editor touches a single sentence.

The five things that break a nonfiction book: the thesis is not stated clearly in chapter 1, the target reader is not who the author thinks it is, the promise on the cover is not delivered inside, the argument sags in the middle third, and the book duplicates itself.

## When to use

- The author has a complete or substantially complete manuscript.
- The author is between drafts and wants to know where to invest the next revision.
- The author is prepping to send the manuscript to Legacy Publishing (or another publisher) and wants an audit before submission.
- The author has been told "something's off" and can't locate what.

## When NOT to use

- The author wants a copy-edit or line-edit (different discipline).
- The author is at outline stage (route to `book-outline-shaper`).
- The author wants a full paid manuscript review with editorial letter (route to Legacy Publishing Manuscript Review at $497).

## Inputs the operator provides

- Manuscript file or link.
- Stated thesis of the book (one sentence).
- Target reader (one sentence).
- The promise on the cover or the promise the author would put on the cover.
- Wordcount target vs current.

## The audit checklist

Run each section. Report present / missing / needs work.

### 1. Thesis clarity

- Is the thesis stated in the first 10 pages, verbatim or near-verbatim?
- Is the thesis repeated at three or more inflection points in the book (transition into part 2, transition into part 3, close)?
- Does the thesis actually match what the book is about, or has the book drifted from the thesis?

### 2. Target reader

- Is the target reader named or clearly implied in the introduction?
- Does the author write as though they are talking to that reader, or to a broader audience?
- Is the level of prior knowledge assumed correctly (not too basic, not too advanced)?

### 3. Cover promise delivery

- What does the cover promise the reader will get from reading the book?
- For each promise, name the chapter or section where the promise is delivered.
- Flag any promise on the cover that is not delivered inside.

### 4. Structural coherence

- Does the book have a clear structure (three parts, five parts, chronological, thematic)?
- Does each chapter earn its place, or are there chapters that duplicate the point of an earlier chapter?
- Is the middle third (chapters 4-7 of a 12-chapter book, or the middle third of whatever the structure is) where the argument sags? Name the specific chapter and the specific sag.

### 5. Voice consistency

- Does the voice hold across the book, or does it drift (formal in one chapter, casual in another, academic in a third)?
- Are there sections that read like they were written by a different author (or by an AI, or by a ghostwriter who wasn't calibrated)?

### 6. Duplication

- Are there sections where the same point is made twice with different examples?
- Are there anecdotes that appear more than once?
- Is the opening story of the book referenced again later in a way that lands, or in a way that feels like the author forgot they already told it?

## Output shape

```
MANUSCRIPT AUDIT: [book title] — [date]

## Thesis
- Stated: [yes | no | drifted]
- Repeated at inflection points: [yes | no | partial]
- Fix: [specific action]

## Target reader
- Named or implied: [yes | no]
- Level of assumed knowledge: [correct | too basic | too advanced]
- Fix: [specific action]

## Cover promise delivery
- Promise 1: [delivered in chapter N | not delivered — recommend fix]
- Promise 2: [delivered in chapter N | not delivered — recommend fix]
- Promise 3: [delivered in chapter N | not delivered — recommend fix]

## Structural coherence
- Structure: [three-part | five-part | thematic | chronological | unclear]
- Sagging middle: [name chapter, name the sag, name the fix]
- Redundant chapters: [list with recommendation to cut or merge]

## Voice consistency
- Drift: [none | chapter N through N] — fix: [specific action]

## Duplication
- Duplicated points: [list with recommendation]
- Duplicated anecdotes: [list with recommendation]

## Top three revision priorities
1. [fix + estimated revision time]
2. [fix + estimated revision time]
3. [fix + estimated revision time]

## Next skill
- Route to `chapter-draft` for the specific chapters flagged for rework.
- Route to Legacy Publishing Manuscript Review at $497 for a full editorial letter.
```

## Voice rules

- Terse. Auditors don't editorialize.
- Do not add "of course, every book has some issues." Name them and recommend the fix.
- Do not recommend the author scrap the book unless the audit reveals a structural problem the author cannot fix without starting over.

## Related skills

- `book-outline-shaper` — for structural rework at outline level.
- `chapter-draft` — for chapters flagged for rework.
- `book-endorsement-outreach` — for the post-audit outreach cycle once the manuscript is tight.
