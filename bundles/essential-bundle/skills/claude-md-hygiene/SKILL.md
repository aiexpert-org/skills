---
name: claude-md-hygiene
description: "Maintain the CLAUDE.md router doc for a project: audit what belongs vs what has drifted, update the footer with a dated summary of what changed, add standing rules, prune stale rules, and confirm the reading-order list still points at the right files. Trigger phrases include 'update CLAUDE.md', 'CLAUDE.md hygiene', 'router doc update', 'add to CLAUDE.md', 'clean up CLAUDE.md', 'lint CLAUDE.md', 'audit CLAUDE.md', 'fix my CLAUDE.md', 'CLAUDE.md audit', 'my CLAUDE.md is getting long', 'CLAUDE.md footer update', 'prune CLAUDE.md', 'trim my router doc'. Use when the operator has been working in a project long enough that the router doc has drifted, needs new standing rules, or needs a footer update to reflect the current state. Do NOT trigger for a routine end-of-work log (route to `living-notes-hygiene`), for a decision to record (route to `decision-log`), or for a brand-new project without a CLAUDE.md (route to `project-scaffold`)."
---

LAST-VERIFIED: 2026-07-06. Source of truth: Brett K. Moore HQ router CLAUDE.md conventions (§5 Context-loading pattern, standing rule format, footer format), Andrej Karpathy's public CLAUDE.md pattern (~101K stars on GitHub), and the Agentic AI Foundation's AGENTS.md standard for reference.

This skill keeps the CLAUDE.md router doc clean. CLAUDE.md is the file every future agent opening the project loads first. If it is stale, contradictory, or bloated, every future session starts polluted. This skill audits, prunes, and updates the file so the router stays load-bearing.

Output: an updated `CLAUDE.md` file at the project root with a footer entry summarizing what changed.

## When to use

- The operator has been working in the project long enough for the router doc to drift.
- The operator wants to add a new standing rule.
- The operator wants to remove a stale rule that no longer applies.
- The operator has changed how the project is organized and the reading-order list is out of date.
- The router doc has grown past 200 lines and needs pruning.

## When NOT to use

- The project has no CLAUDE.md yet (route to `project-scaffold`).
- The operator only wants to log a decision (route to `decision-log`).
- The operator only wants an end-of-work log (route to `living-notes-hygiene`).
- The operator wants a wholesale rewrite (that is a manual pass; this skill is for maintenance).

## What you'll produce

An edited `CLAUDE.md` with:

1. A refreshed reading-order list if any target files moved or renamed.
2. Any new standing rules the operator wants added.
3. Any stale rules pruned.
4. A dated footer entry summarizing what changed.

Plus a chat confirmation.

## Instructions

**Step 0. Lock four things.**

1. **The project CLAUDE.md path.** Confirm with the operator.
2. **The date.** Run `date +%Y-%m-%d`.
3. **What the operator wants to change.** Add rule, remove rule, prune, refresh reading order, refresh voice section. Get one or more from the operator.
4. **The parent CLAUDE.md if relevant.** If this CLAUDE.md is inside a larger HQ, note the parent's path so the reading-order list can pointer up.

**Step 1. Read the current CLAUDE.md.** Load the file into context. Note current sections, current standing rules, current footer date.

**Step 2. Audit for drift.**

Walk through six checks:

1. **Reading order.** Does the file still point at the right target files? Have any been renamed, moved, or archived? Confirm each pointer.
2. **Standing rules.** Are any rules stale (referring to retired tools, retired decisions, retired workflows)? Flag for pruning.
3. **Voice section.** Does it match the operator's current voice rules? (Cross-reference `voice-fingerprint.md` if it exists.)
4. **Author byline.** Correct form (e.g., "Brett K. Moore" with period, not "Brett K Moore").
5. **Length.** Is the file over 200 lines? Over 400? Suggest pruning targets.
6. **Contradictions.** Any two rules that contradict each other? Flag for resolution.

Deliver the audit as a short punch list before making changes.

**Step 3. Draft the changes.**

For each change:

- **Adding a rule.** Show the exact line and where it goes (under which section).
- **Removing a rule.** Show the exact line being removed and why (which upstream change made it stale).
- **Refreshing a reading-order pointer.** Show old and new pointer.
- **Prune target.** Show the block being pruned and the rationale.

Show the operator all proposed changes before writing.

**Step 4. Update the footer.**

Every CLAUDE.md carries a dated "Last updated" footer entry at the bottom. Format:

```
_Last updated: YYYY-MM-DD ([short summary of what changed]. Prior: YYYY-MM-DD ([prior summary]). ..._
```

Prepend the new dated summary. Preserve the prior chain. Keep the whole footer under 500 words; prune older entries into a summary if it grows.

**Step 5. Write the file.** Use Edit tool for surgical changes; use Write only if the operator asks for a full rewrite (rare).

**Step 6. Deliver the confirmation.** Chat message: "CLAUDE.md updated. Changes: [list]. Footer updated with today's date. Next agent opening the project will load the refreshed router."

## Examples

**Example 1.** Operator says "clean up CLAUDE.md, my Discord section is stale." Skill fires. Confirms path. Audits. Removes Discord references. Updates footer. Writes.

**Example 2.** Operator says "add a standing rule that we always dictate now." Skill fires. Adds "Voice input is the default; type only for code, URLs, numbers, passwords" under Standing operating rules. Updates footer.

**Example 3.** Operator says "audit CLAUDE.md, feels too long." Skill fires. Delivers punch list: 340 lines, 6 stale rules, 2 dupes in reading order, footer has 12 dated entries. Recommends pruning. Operator approves. Skill prunes and writes.

## Composes with

- `project-scaffold`. scaffolds the initial CLAUDE.md; this skill maintains it.
- `living-notes-hygiene`. LIVING-NOTES.md CURRENT STATE and CLAUDE.md standing rules stay in sync.
- `decision-log`. locked decisions that affect standing rules trigger a CLAUDE.md update.
- `voice-corpus-builder`. voice fingerprint pointer in CLAUDE.md stays fresh.

## Voice notes for the footer

The Brett K. Moore HQ footer convention is dense, single-paragraph, and chronological (newest first, "Prior: ..." linking back to previous entries). If the operator's project uses a different footer style, respect the local convention.
