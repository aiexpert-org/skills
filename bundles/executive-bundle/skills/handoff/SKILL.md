---
name: handoff
description: "Package the current thread of work as a temp briefing document another agent, lieutenant, chief of staff, or fresh session can pick up cleanly. Captures the purpose, the context, the artifacts produced so far, the open questions, and the specific next move. Writes to a session-scoped temp path; the target reader consumes it and destroys it. Trigger phrases include 'handoff', 'hand this off', 'brief a fresh agent', 'brief my chief of staff', 'give this to my EA', 'package this thread', 'summarize for a fresh session', 'context dump for', 'pass this to', 'briefing for the next session', 'let the next agent take this', 'hand this to someone else', 'wrap this into a handoff'. Also invoke implicitly when the executive is about to context-switch and wants the current thread preserved for later pickup. Do NOT trigger when the operator is running the end-of-work log for a single project (that is a different skill and belongs on the permanent record), when the operator has not produced anything concrete yet (the handoff has nothing to summarize), or when the operator explicitly wants to keep the work in-conversation and just move to the next topic."
tools: Read, Write
---

LAST-VERIFIED: 2026-07-06. Borrowed structurally from Matt Pocock's `/handoff` skill in `mattpocock/skills` (MIT license, credit preserved). Adapted for executive-scale handoff (from operator to lieutenant, chief of staff, EA, board pack drafter, or a fresh agent session). Re-verify if the upstream design shifts.

This skill packages an in-flight thread of work into a temp briefing document so someone else (a lieutenant, a fresh agent session, a chief of staff) can pick it up without a five-minute reconstruction pass. The handoff is disposable: written to a session-scoped path, consumed by the target reader, then destroyed.

Output goes to `~/tmp/handoff-<slug>-<YYYY-MM-DD-HHMM>.md`. The slug is a two-to-three-word tag the operator names at Step 0 ("acme-deal," "q4-hiring-plan," "board-preread"). The tag is part of the file name so the target reader can locate it fast.

## Step 0: Confirm the four intake items (Matt Pocock's design)

1. **The purpose.** In one sentence, what is the next reader supposed to accomplish? "Take this to a done state." "Review and push back if you see gaps." "Turn this into a board-ready deck." Specific.

2. **The target reader.** Who is picking this up? A fresh agent, a specific person by name, an unnamed lieutenant, a chief of staff. The tone and disclosure level shift with the reader.

3. **The slug.** A two-to-three-word file-name tag. If the operator does not provide one, propose two based on the thread and let the operator pick.

4. **The stopping point.** Where in the thread does the operator want the handoff to freeze? "Everything up to this message." "Include the draft I just wrote." "Skip the tangent about pricing; that is not part of this handoff."

If any of the four are missing, ask before writing.

## Standard shape

Every handoff document produced by this skill has the same eight sections.

**Section 1: Purpose (one sentence).**
The one sentence from Step 0. This is the top of the file so the reader sees it first.

**Section 2: Target reader.**
Who is picking this up.

**Section 3: Context.**
The three-to-five-sentence background the reader needs to make sense of the thread. Written for a reader who has zero prior context.

**Section 4: What is produced so far.**
Links or inline paste of any artifacts already produced (draft docs, decisions locked, decisions considered but not locked, research done). If the artifact is a file, name the file path. If it is in-conversation, paste the relevant chunks.

**Section 5: Open questions.**
The list of unanswered questions. Numbered. Each question tagged with what would answer it (a decision the reader makes, information the reader has to gather, a person the reader has to ask).

**Section 6: The specific next move.**
The one thing the reader should do first. Not "review the thread." A specific action: "Draft the response to the Acme CEO by end of day." "Pick two of the five candidates on the shortlist to advance." "Cut the 20-slide draft into a 10-slide version."

**Section 7: Constraints and rails.**
What the operator does NOT want the reader to do. "Do not send anything to Acme without my review." "Do not decline any candidate without asking me first." "Do not add slides; only cut." Handoffs fail when the reader takes actions outside the scope; the constraint block prevents that.

**Section 8: Suggested next skills.**
If the reader is a fresh agent that will run other skills on this thread, name the likely companions. Example: "After you review the draft, run `decision-quality-check` on the go/no-go before you commit." This is Matt Pocock's output-embedded-pointer pattern.

## Output format

Return a Markdown document in this shape:

```
# Handoff, [slug], [YYYY-MM-DD HH:MM]

**Purpose.** [One sentence.]
**Target reader.** [Person, agent, or role.]
**Written by.** [Operator name.]

## Context

[Three to five sentences.]

## What is produced so far

[List of artifacts, with file paths or inline pasted content.]

## Open questions

1. [Question] (would be answered by: [what]).
2. [Question] (would be answered by: [what]).

## The specific next move

[The one thing to do first.]

## Constraints and rails

- [What NOT to do.]
- [What NOT to do.]

## Suggested next skills

- `[skill-name]` after [event].
- `[skill-name]` if [condition].

---

*This handoff is disposable. Consume, act, destroy. If any decision locks, move it into the operator's permanent decision log before destroying the file.*
```

## Voice rules

The handoff is in the operator's voice for the sections where the operator is speaking to the reader (Purpose, Context, Constraints). The Suggested next skills block can be in agent voice. If the reader is a fresh agent, the operator voice matters more; if the reader is a human lieutenant, the operator voice is the whole document.

## Sensitive material discipline

If the thread includes anything sensitive (comp discussions, litigation, layoffs, non-public financial numbers), flag at the top: `SENSITIVE MATERIAL, DESTROY AFTER USE.` The disposable-file location is not enough discipline; the flag is a second guard.

## When to invoke

Invoke when the operator says "hand this off," "brief my chief of staff," "package this thread," or the trigger phrases listed. Invoke implicitly when the operator is about to context-switch and mentions someone else will pick the work up.

## When NOT to invoke

Do not invoke for permanent-record logging (that is the end-of-work-checklist family, not the handoff). Do not invoke when nothing concrete has been produced yet; the handoff has nothing to package. Do not invoke when the operator explicitly wants to keep the work in-conversation and just move on.

## Attribution

Structural design credited to Matt Pocock's `/handoff` in `mattpocock/skills` (MIT). Adapted for executive-scale handoff.

## Companion skills

Runs before or after `board-deck-draft`, `investor-update`, `hiring-loop` (handing off any of these to a lieutenant), and paired with `decision-quality-check` (when the reader will lock a decision the operator is deferring).
