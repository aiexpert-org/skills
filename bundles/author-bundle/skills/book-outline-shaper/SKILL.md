---
name: book-outline-shaper
description: "Shape a book outline from a bullet dump using the outside-in method. Reads the author's raw notes, half-formed ideas, chapter fragments, and target-reader description. Drafts the back-cover copy FIRST (the outside), then reverse-engineers the through-line, orders the chapters, spots the gaps, and produces a full working outline the author can start drafting from. Trigger phrases include 'book outline', 'help me shape my book', 'shape my book outline', 'chapter order', 'structure my book', 'back cover first', 'outside-in book method', 'organize my book ideas', 'my book is a mess', 'help me structure the book', 'work out the through-line', 'outline my next book', 'shape this into a book', 'is this a book yet'. Use when the author has raw material (bullets, journal entries, blog posts, workshop notes, a stack of chapter fragments) and needs to turn it into a working outline before they can start drafting. Do NOT trigger when the author already has a signed-off outline and wants a chapter draft (route to chapter-draft), when the author is asking for a full ghostwritten manuscript (out of scope for a skill), or when the author is at the book-ideation stage with no material yet (route to a discovery conversation first). Altitude: authorship. Output: a working outline plus draft back-cover copy, saved to the operator's HQ."
---

LAST-VERIFIED: 2026-07-06. Source of truth: Mike Partners, *The Book on How to Write a Book*, the outside-in method. Also references Brett K. Moore's authorship pattern for *AI or Die* and Legacy Publishing's editorial pipeline architecture. Re-verify when Legacy Publishing v0.1 architecture ships.

This skill turns a bullet dump into a working book. Every author gets to a moment where they have a hundred bullets, three half-drafted chapters, and no clue whether the thing is a book or a blog series. The outside-in method breaks the paralysis. Draft the back cover first. That's the promise to the reader. Then work backwards: what would a book that delivered that promise look like? Which chapters would it need? In what order? What's missing?

Output: a `book-outline.md` file at the operator's canonical author folder (default: `books/<book-slug>/book-outline.md`) plus a `back-cover-draft.md` file at the same location.

## When to use

- The author has raw material (bullets, journal entries, blog archive, workshop notes) but no working outline.
- The author knows the topic but cannot articulate the through-line.
- The author has drafted 3 to 5 chapters and doesn't know what should follow.
- The author wants to test whether their idea is actually a book (vs. a talk or a course or a blog series).

## When NOT to use

- The author already has a signed-off outline and wants a chapter drafted (route to `chapter-draft`).
- The author wants a ghostwritten book, not an outline shaped from their own material (out of scope for a skill).
- The author has zero material yet (route to a book-ideation conversation, not this skill).

## What you'll produce

Two files.

**File 1: `back-cover-draft.md`.**

```
# BACK COVER DRAFT for [Book working title]

**Working title:** [Title]
**Working subtitle:** [Subtitle]
**Genre / shelf:** [Business, memoir, self-help, category-defining nonfiction, etc.]

## The hook (top line)
[One sentence that stops the browser in the bookstore.]

## The promise (middle paragraph)
[3 to 5 sentences: who this book is for, what changes when they read it, why the author is the one to write it.]

## The proof (bottom section)
[Author credibility line. One sentence. What makes this author the right voice for this book.]

## The call
[One-line invitation to buy, read, share.]
```

**File 2: `book-outline.md`.**

```
# OUTLINE for [Book working title]

**Through-line (one sentence):** [The single argument the book makes.]

**Target reader:** [Who the book is written for. Be specific.]

**Reader promise:** [What the reader will walk away with. Concrete.]

## Structure at a glance
- Part 1: [Working title] ([N] chapters)
- Part 2: [Working title] ([N] chapters)
- Part 3: [Working title] ([N] chapters)

## Chapter-by-chapter

### Chapter 1: [Title]
- Argument: [One sentence.]
- Story or scene: [What opens the chapter.]
- Key move: [What the reader learns or shifts.]
- Ends on: [The bridge into chapter 2.]

[repeat for every chapter]

## Gaps and open questions
- [Something the outline needs but the author hasn't decided yet.]
- [A chapter that feels weak or is missing.]

## Recommended next moves
- [Which chapter to draft first.]
- [Which fragment to expand.]
- [Which piece of research or reporting to line up.]
```

## Instructions

**Step 0. Lock five things.**

1. **The raw material.** Where does the author's material live? A bullet dump in the chat, a folder of notes, a blog archive, a set of workshop transcripts. Get the pointer. Read the material end to end before drafting anything.
2. **The target reader.** Who is this book for? If the author cannot say in one sentence, help them narrow it. "Every leader" is not a target reader. "The mid-career founder who just crossed $5M revenue" is.
3. **The topic.** In one sentence. What is the book about?
4. **The category.** Business, memoir, self-help, category-defining nonfiction, technical, spiritual. The category shapes the length, the tone, and the back-cover structure.
5. **The output location.** Default: `books/<book-slug>/`. Confirm or override.

If the author gave a working title, use it. If not, generate three options based on the material and get the author to pick.

**Step 1. Draft the back cover FIRST.** This is the outside-in move. Before shaping any outline, draft the back cover as if the book were already written. The back cover forces the promise into 3 to 5 sentences. If the promise is fuzzy on the back cover, the book will be fuzzy. Iterate the back cover with the author until the promise is sharp. This is the load-bearing move of the whole skill.

**Step 2. Extract the through-line.** From the back cover, what is the single argument this book makes? Write it in one sentence. Read it back to the author. If they cannot agree with it, the outline is not ready to draft. Loop back to Step 1.

**Step 3. Sort the raw material into buckets.** Read the raw material. Group it into 3 to 5 major themes. These are the candidate parts of the book (Part 1, Part 2, Part 3, etc.).

**Step 4. Order the chapters.** Within each part, order the chapters so each one earns the next. Every chapter answers a question the previous chapter raised. If a chapter does not, it's in the wrong place or it's not needed.

**Step 5. Draft the chapter-level outline.** For each chapter: title, one-sentence argument, opening story or scene, key move (what the reader learns or shifts), and the bridge into the next chapter. Keep each chapter entry short. This is a working outline, not a manuscript.

**Step 6. Spot the gaps.** What's the outline missing? A chapter that feels weak, a piece of research or reporting the author needs to do, a story they haven't told yet, a concept they've referenced but not defined. List the gaps explicitly.

**Step 7. Recommend the next moves.** Which chapter to draft first (usually the one where the author has the most material and the strongest opinion, not chapter 1). Which fragment to expand. Which piece of reporting to line up.

**Step 8. Write both files.** Save `back-cover-draft.md` and `book-outline.md` to the output location. Deliver the paths in chat.

**Step 9. Suggest next skills.** `chapter-draft` for the recommended first chapter. `hoard` for capturing anything the author says during the shaping conversation that should live in the playbook. `voice-corpus-builder` (Essential Layer) if the author does not have a voice corpus yet.

## Examples

**Example 1.** Author says "I have 200 bullets in a Google Doc and 4 half-written chapters, help me shape my book." Skill fires. Reads the Google Doc. Drafts back cover targeting mid-career operators. Extracts through-line ("AI is a force multiplier, not a replacement"). Sorts bullets into 3 parts. Orders 12 chapters. Flags 2 missing chapters and 3 gaps. Recommends drafting chapter 4 first.

**Example 2.** Author says "help me structure the book, I know the topic but I can't work out the through-line." Skill fires. Uses the back-cover-first move to force clarity. Iterates back cover 3 times with the author. Locks the through-line. Produces the outline.

**Example 3.** Author says "is this a book yet?" Skill fires. Reads their material. Drafts back cover. Author reads back cover and says "no, that's a keynote, not a book." Skill surfaces the diagnosis: the material is a talk, not a book. Recommends the `keynote-script` skill instead.

## Composes with

- `chapter-draft`. drafts the first chapter after the outline locks.
- `back-cover-draft` inside this skill is the artifact the launch runway later builds around.
- `launch-runway`. the outline determines the launch timing.
- `evergreen-pipeline`. the outline can be atomized into pre-launch content.
- `voice-corpus-builder` (Essential Layer). the outline should be drafted in the author's voice.
- `hoard`. captures the "aha" moments from the shaping conversation.
