---
name: living-notes-hygiene
description: "Run end-of-work discipline on the project's LIVING-NOTES.md: append a dated entry in Source / Summary / Files / Decisions / Next format, update the CURRENT STATE block at the top if anything material changed, and confirm the file is still chronologically clean. Trigger phrases include 'update living notes', 'end of work log', 'wrap up notes', 'dated entry', 'LIVING-NOTES.md hygiene', 'log this session', 'append to living notes', 'living notes update', 'CURRENT STATE refresh', 'log the work', 'session log', 'log what we did', 'living notes entry'. Use at the close of any meaningful work session where files were shipped, decisions were locked, or state changed. Do NOT trigger mid-session when the operator is still actively working, when no LIVING-NOTES.md exists (route to `project-scaffold`), or when the operator explicitly says they will log it themselves."
---

LAST-VERIFIED: 2026-07-06. Source of truth: Brett K. Moore HQ router CLAUDE.md §5 Context-loading pattern (the LIVING-NOTES 5-bullet Source / Summary / Files / Decisions / Next structure) and `System/skills/end-of-work-checklist/SKILL.md`.

This skill closes the gap between work done and work logged. LIVING-NOTES.md is the project's chronology. Without a dated entry per session, the file degrades into a folder of artifacts with no connective tissue and the next agent (or the operator two weeks later) has to reverse-engineer what happened. This skill runs the discipline automatically.

Output: an appended dated entry in LIVING-NOTES.md, an updated CURRENT STATE block at the top if anything material changed, and a chat confirmation.

## When to use

- At the close of a meaningful work session in a project with a LIVING-NOTES.md.
- When the operator says "log this session" or "wrap up the notes."
- When the operator ships an artifact, locks a decision, or changes project state.
- As a companion to `end-of-day-review` when the day's work touched a specific project.

## When NOT to use

- Mid-session while the operator is still working.
- The project has no LIVING-NOTES.md (route to `project-scaffold`).
- The operator says "I'll log it later."
- The session was zero-substance (no ships, no decisions, no state change).

## What you'll produce

Two edits to `LIVING-NOTES.md`:

1. An appended dated entry at the bottom of the chronology.
2. An updated `## CURRENT STATE` block at the top if anything material changed.

Plus a chat confirmation.

## The 5-bullet entry shape

```
## YYYY-MM-DD: <Short descriptive title>

**Source:** <where the work came from: a user message, a meeting, a follow-up task, an external trigger>

**Summary:** <one to three sentences on what happened. Concrete. Names the artifact shipped or the question answered.>

**Files produced:**
- `<path/to/file>` <one-line note on what's in it>
- `<path/to/file>` <one-line note>

**Decisions / locks:** <what got locked this session. If nothing locked, write "None locked.">

**Next:** <one to three bullets on the next concrete action. Names the person who owns the next move when relevant.>
```

## Instructions

**Step 0. Lock four things.**

1. **The project's LIVING-NOTES.md path.** Confirm with the operator.
2. **The date.** Run `date +%Y-%m-%d`.
3. **What happened this session.** Read back to the operator: files created or edited, decisions locked, artifacts shipped. Operator confirms or corrects.
4. **The next concrete action.** Ask the operator. If they are unsure, offer a draft based on the session's open loops.

**Step 1. Read the current LIVING-NOTES.md.** Load the file. Note the existing CURRENT STATE block shape, the existing entry shape (some projects use minor variants), and the last dated entry.

**Step 2. Draft the dated entry.** Use the 5-bullet shape above, adapted to the project's local convention if it differs slightly. Rules:

- **Title is descriptive and unique.** "Voice corpus scaffolded" beats "Wrapped up voice work."
- **Source names the trigger.** Quote the operator's short verbatim line if load-bearing.
- **Summary is concrete.** Do not write "did some work." Write "shipped v1 corpus, 8,200 words across three seed sessions, locked the fingerprint format."
- **Files produced lists every file created or materially edited.** Paths relative to project root. One-line note per file.
- **Decisions captures locks.** If a decision was locked and the project has a DECISIONS.md, the decision also lands there (route to `decision-log`).
- **Next is concrete and owned.** "Brett to confirm pricing by Tuesday" beats "decide on pricing."

**Step 3. Decide whether CURRENT STATE needs an update.**

The CURRENT STATE block at the top of LIVING-NOTES.md is the Karpathy-style snapshot: what is true right now, distilled from the chronology below. New agents read it first. It needs an update when the session's work changed any of:

- The status of an active workstream (started, paused, finished, blocked).
- A canonical fact about the project (name, number, path, counterparty).
- The set of open questions or pending decisions.
- A counterparty's status (client signed, partner disengaged, introduction landed).
- A structural change to the project (new folder, retired offering, pivot).

Do NOT update for incremental progress that does not change the project's overall state.

If an update is needed, draft the change (patch in place or add a new line) and show the operator before writing.

If no update is needed, say so explicitly in the confirmation: "CURRENT STATE unchanged; session was incremental."

**Step 4. Show and confirm.** Operator approves or adjusts both the entry and any CURRENT STATE change before writing.

**Step 5. Write to disk.** Use Edit tool. Append the entry. Patch CURRENT STATE in place.

**Step 6. Deliver the confirmation.** Chat message: "LIVING-NOTES.md updated. Entry appended: [title]. CURRENT STATE: [changed / unchanged]. Next: [first bullet from Next]."

## Examples

**Example 1.** Operator says "log this session, we scaffolded the voice corpus." Skill fires. Reads back the session: 6 files created, 0 decisions locked, next action is 15-minute dictation. Drafts entry. Operator approves. Appends. CURRENT STATE gains "voice-corpus/ scaffolded, awaiting seed sessions." Writes.

**Example 2.** Operator says "wrap up notes, we locked pricing at $997." Skill fires. Reads back: 1 file edited (SCOPE-AND-FEES.md), 1 decision locked. Drafts entry. Suggests operator also run `decision-log` for the pricing lock. CURRENT STATE gains "Pricing locked at $997." Writes.

**Example 3.** Operator says "log the work, we cleaned up the docs." Skill fires. Reads back: 12 doc edits, no decisions, no ships. Diagnoses: incremental. Drafts entry. Notes "CURRENT STATE unchanged." Writes.

## Composes with

- `end-of-day-review`. daily close ritual; LIVING-NOTES hygiene is the per-project version.
- `decision-log`. decisions locked in the session also get appended to DECISIONS.md.
- `claude-md-hygiene`. if standing rules changed, CLAUDE.md also gets an update.
- `weekly-review`. LIVING-NOTES dated entries feed the weekly retro.
- `project-scaffold`. scaffolds the initial LIVING-NOTES.md; this skill maintains it.
