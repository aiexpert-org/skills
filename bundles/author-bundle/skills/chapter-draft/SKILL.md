---
name: chapter-draft
description: "Produce a first-pass draft of a book chapter from an outline entry. Opens with a story or scene, delivers the argument, closes with a takeaway. Reads the book's outline (from `book-outline-shaper` output), the author's voice corpus (if installed), any prior drafted chapters for continuity, and the specific chapter entry to draft. Produces a 2,500 to 5,000 word first-pass chapter in the author's voice. Trigger phrases include 'draft chapter', 'first pass chapter', 'chapter draft for', 'write chapter [N]', 'chapter one draft', 'draft the next chapter', 'chapter draft in my voice', 'first draft of chapter', 'give me a working chapter', 'draft chapter [title]', 'flesh out chapter', 'chapter draft from the outline'. Use when the author has an approved outline entry and wants a first-pass draft they can revise. Do NOT trigger when the outline does not exist yet (route to book-outline-shaper), when the author wants ghostwritten prose without an outline (out of scope), or when the author is asking for a copy or line edit of an existing chapter (route to a copy edit skill or the Legacy Publishing pipeline). Altitude: authorship. Output: a first-pass chapter draft saved to the operator's HQ."
---

LAST-VERIFIED: 2026-07-06. Source of truth: Brett K. Moore's canonical chapter shape for *AI or Die*. Also references Legacy Publishing's editorial pipeline v0 architecture and the voice-corpus-builder skill in the Essential Layer.

This skill produces a first-pass draft. Not the final chapter. Not a polished manuscript. A working draft the author can revise into their voice. The pattern is the three-move chapter: open with a story, deliver the argument, close with a takeaway. This is the shape every readable nonfiction chapter honors, even when the author doesn't think about it consciously.

The draft is deliberately imperfect. It gives the author something to react to. Reacting to a draft is 10x faster than staring at a blank page.

Output: a `chapter-<NN>-<slug>.md` file at the operator's canonical author folder (default: `books/<book-slug>/drafts/`).

## When to use

- The author has an approved outline and wants a first-pass draft of a specific chapter.
- The author is stuck on a chapter and needs a working draft to react to.
- The author has drafted 80% of the book but one chapter is missing.
- The author wants to test whether a chapter belongs in the book by seeing it drafted.

## When NOT to use

- The outline doesn't exist yet (route to `book-outline-shaper`).
- The author wants a copy edit or line edit of an existing chapter (route to Legacy Publishing pipeline).
- The author wants the entire book ghostwritten (out of scope for a skill).
- The chapter is a technical reference (index, glossary, appendix) with a different shape.

## What you'll produce

```
# Chapter [N]: [Title]

[OPENING STORY OR SCENE. 400 to 800 words. A specific moment, a specific person, a specific problem. Not abstract. Not "as leaders we often face...". The story is doing work: it sets up the argument.]

## The argument

[2,000 to 3,500 words. The argument the chapter makes. Structured with 3 to 5 sub-moves. Each sub-move earns the next. Uses concrete examples, not abstractions. Cites specific numbers, names, dates where the author has them. Where the author has a hoarded snippet from the playbook, pull it.]

## The takeaway

[300 to 600 words. What the reader walks away with. Concrete. Actionable if the book is instructional. Reflective if the book is memoir or category-defining. Ends on a bridge into the next chapter.]

---
**Draft notes for the author:**
- [Anything I made up that needs a real story or example.]
- [Anything I couldn't verify.]
- [Anything the outline said to include that I couldn't fit.]
- [Anything I'd cut.]
```

## Instructions

**Step 0. Lock six things.**

1. **The chapter to draft.** Which chapter number and title from the outline. Get the exact entry.
2. **The book outline.** Path to `book-outline.md`. Read the through-line, the target reader, the chapter entry, and the entries before and after (for continuity).
3. **The voice corpus.** Path to the author's voice skill folder (default: `System/skills/<author-slug>-voice/`). If the folder does not exist, prompt the author to install `voice-corpus-builder` (Essential Layer) first, but proceed with a request for 3 to 5 voice reference samples so the draft is not off-voice.
4. **Prior chapters.** Any previously drafted chapters. Read them for continuity of voice, argument, and callbacks.
5. **Target length.** Chapter word count target. Default 3,500 words. Confirm or override.
6. **Output location.** Default: `books/<book-slug>/drafts/chapter-<NN>-<slug>.md`. Confirm or override.

If any of these are missing, ask. Do not draft on incomplete inputs.

**Step 1. Read the outline entry carefully.** Extract the four things every chapter needs from the outline: the argument, the opening scene, the key move, and the bridge into the next chapter.

**Step 2. Read the voice corpus (or the voice samples).** Extract the tone markers: sentence length, favorite framings, banned words, forbidden patterns. Load them for the draft pass.

**Step 3. Draft the opening story or scene.** Specific moment. Specific person. Specific problem. If the author has a real story that fits, use it (from the raw material, from a prior interview, from the hoard). If the author does not have a story for this chapter, invent a placeholder and flag it clearly in the draft notes as "needs a real story."

**Step 4. Draft the argument.** Structure with 3 to 5 sub-moves. Each sub-move earns the next. Where the outline references a concept, define it the first time. Where the author has a hoarded snippet (a working framework, a killer stat, a client story), pull it in.

**Step 5. Draft the takeaway.** Concrete. Actionable or reflective depending on the book. End on a bridge into the next chapter.

**Step 6. Add draft notes.** Below the chapter, list what you made up, what you couldn't verify, what the outline asked for that you couldn't fit, and what you'd cut on a second pass. This is the author's revision starting point.

**Step 7. Voice check.** Before writing to disk, scan the draft against the voice corpus. Banned words present? Em dashes present (banned in Brett K. Moore's canon; check the author's own canon too)? Off-tone sentences? Flag them in the draft notes.

**Step 8. Write the file.** Save to the output location. Deliver the path in chat.

**Step 9. Suggest next skills.** `brand-voice-consistency` for a second-pass voice polish. `chapter-draft` again for the next chapter. `hoard` for capturing any framework or story the author wants to reuse.

## Examples

**Example 1.** Author says "draft chapter 3 from the outline." Skill fires. Reads outline, pulls the chapter 3 entry. Loads voice corpus. Opens chapter with the client story from the raw material bucket. Delivers argument with 4 sub-moves. Closes with a reflective takeaway that bridges into chapter 4. Flags 2 sub-moves as "made up a stat here, verify" in draft notes.

**Example 2.** Author says "first pass chapter for the AI-native chapter." Skill fires. Locates the AI-native chapter in the outline. Reads chapters 1 and 2 for continuity. Drafts opening scene using the author's real "Wednesday morning stand-up" story from the hoard. Draft ships in author's voice with 3 flagged gaps.

**Example 3.** Author says "write chapter 7 in my voice." Skill fires. No voice corpus installed. Skill pauses, asks for 3 to 5 voice reference samples, drafts chapter using extracted tone markers, flags the voice corpus install as a follow-up.

## Composes with

- `book-outline-shaper`. produces the outline this skill reads from.
- `brand-voice-consistency`. runs a voice-polish pass on the drafted chapter.
- `voice-corpus-builder` (Essential Layer). builds the voice reference this skill loads.
- `hoard`. captures the frameworks, stories, and stats the chapter references.
- `evergreen-pipeline`. atomizes the drafted chapter into short-form pre-launch content.
