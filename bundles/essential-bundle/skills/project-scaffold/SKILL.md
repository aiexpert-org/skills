---
name: project-scaffold
description: "Generate the canonical 4-file project structure (actually 5 files: CLAUDE.md, LIVING-NOTES.md, DECISIONS.md, INDEX.md, README.md) for a new project folder and walk the operator through filling each one. Enforces the Brett K. Moore HQ standard so every future agent that opens the folder loads the right context in the right order. Trigger phrases include 'new project', 'scaffold a project', 'start a project', 'set up a new folder', 'how do I organize this project', 'scaffold my HQ', 'set up my project structure', 'create project files', 'give me the 4-file standard', 'CLAUDE.md scaffold', 'start me on a new business', 'new project folder', 'set up a workspace', 'bootstrap a project'. Use when the operator is starting a new project, business folder, or client engagement. Do NOT trigger for an existing project that already has the files (route to `claude-md-hygiene` or `living-notes-hygiene` instead), for a one-off deliverable that doesn't need a folder, or when the operator explicitly wants a different structure."
---

LAST-VERIFIED: 2026-07-06. Source of truth: Brett K. Moore HQ router CLAUDE.md §5 Context-loading pattern (the 4-file standard) and the canonical folder structure at `System/CANONICAL-FOLDER-STRUCTURE-2026-06-16.md`.

This skill scaffolds a new project folder using the canonical Brett K. Moore HQ standard. Every project (a new business, a new client engagement, a new product line, a new campaign) gets the same five files so every future agent that opens the folder loads context in the same order. The failure mode this prevents: a folder full of artifacts with no connective tissue where the next agent has to reverse-engineer what happened.

Output: five files written to the target folder (CLAUDE.md, LIVING-NOTES.md, DECISIONS.md, INDEX.md, README.md) plus a chat confirmation.

## When to use

- The operator is starting a new business, client folder, product line, or campaign.
- The operator says "I'm starting a new project."
- The operator is spinning up a workspace for a new engagement.
- The operator asks how to organize a folder they just created.

## When NOT to use

- The project folder already has these files (route to `claude-md-hygiene` or `living-notes-hygiene`).
- The work is a one-off deliverable that will not compound.
- The operator wants a non-standard structure (respect the request; do not impose).

## What you'll produce

Five files in the target folder:

```
project-name/
├── README.md          Public-facing intro (what this project is)
├── CLAUDE.md          Router doc (context for every agent opening this folder)
├── CONTEXT.md         Project background (history, ICP, positioning)
├── LIVING-NOTES.md    Dated chronology with CURRENT STATE at the top
├── DECISIONS.md       Append-only log of locked decisions
└── INDEX.md           File map with one-line notes per file
```

Note: the HQ router calls this the "4-file standard" but ships 5-6 files (README plus CLAUDE plus CONTEXT plus LIVING-NOTES plus DECISIONS plus INDEX). The naming is historical; the file set is what matters.

## Instructions

**Step 0. Lock five things.**

1. **The project name.** Short slug the folder will use.
2. **The target folder path.** Absolute path where the scaffolded files will live.
3. **The project type.** Business, client engagement, product line, campaign, other. This shapes the CLAUDE.md and CONTEXT.md prompts.
4. **The operator's HQ shape.** If this is a project inside a larger HQ, note the parent CLAUDE.md path (the scaffolded CLAUDE.md will pointer up to it).
5. **The date.** Run `date +%Y-%m-%d`.

**Step 1. Walk the operator through the 30-second version of each file.**

Ask five short questions:

1. **README.md.** In one paragraph, what is this project? (Public-facing intro.)
2. **CLAUDE.md.** What are the top 3 rules the next agent opening this folder needs to know?
3. **CONTEXT.md.** What is the history + ICP + positioning? (One paragraph each.)
4. **LIVING-NOTES.md CURRENT STATE.** In 3-5 bullets, what is true right now?
5. **DECISIONS.md.** Any locked decisions to log at the birth of this project?

If the operator is not sure, offer a starter draft based on the project type and let them adjust.

**Step 2. Draft each file.**

**README.md** shape:

```
# [Project Name]

**What this is.** [One paragraph.]

**Why it exists.** [One paragraph.]

**Owner.** [Operator name.]

**Status.** [Draft / In build / Live / Archived.]

**Last updated.** [Date.]
```

**CLAUDE.md** shape (the router):

```
# [Project Name] Router

This file auto-loads for every agent working inside [Project Name].

**Reading order.** (1) CURRENT STATE at the top of LIVING-NOTES.md. (2) The last three entries in LIVING-NOTES.md. (3) DECISIONS.md. (4) CONTEXT.md if the agent needs project history.

## Top 3 rules
1. [Rule.]
2. [Rule.]
3. [Rule.]

## Voice
[Voice rules, banned vocabulary, tone.]

## Standing operating rules
- [Rule.]
- [Rule.]

## Last updated
[Date.] [What changed.]
```

**CONTEXT.md** shape:

```
# [Project Name] Context

## History
[When and why this project started.]

## ICP
[Who the project serves.]

## Positioning
[How the project shows up in the market.]

## Boundaries
[What this project is NOT.]
```

**LIVING-NOTES.md** shape:

```
# [Project Name] Living Notes

## CURRENT STATE
- [Fact or workstream, one line.]
- [Fact or workstream, one line.]
- [Fact or workstream, one line.]

## YYYY-MM-DD: Project scaffolded

**Source:** Operator started the project via `project-scaffold` skill.

**Summary:** Scaffolded the 5-file project structure.

**Files produced:**
- `README.md` public-facing intro
- `CLAUDE.md` agent router
- `CONTEXT.md` project background
- `LIVING-NOTES.md` chronology
- `DECISIONS.md` decision log
- `INDEX.md` file map

**Decisions / locks:** None locked at scaffold.

**Next:** [First concrete action.]
```

**DECISIONS.md** shape:

```
# [Project Name] Decisions

Append-only log of locked decisions. Newest at bottom.

## YYYY-MM-DD: Project structure scaffolded

**Decision:** Adopted the canonical 4-file HQ standard for this project.

**Alternatives considered:**
- Freeform folder with no convention
- README-only

**Rationale:** Every future agent loads context in the same order; project history is preserved as chronology.

**Expected outcome:** Zero context reconstruction cost for future agents.

**Review date:** N/A (structural).

**Source:** `project-scaffold` skill invocation.
```

**INDEX.md** shape:

```
# [Project Name] Index

- `README.md`. public-facing intro.
- `CLAUDE.md`. router for every agent opening this folder.
- `CONTEXT.md`. project history, ICP, positioning.
- `LIVING-NOTES.md`. dated chronology with CURRENT STATE at the top.
- `DECISIONS.md`. append-only decision log.
- `INDEX.md`. this file.

## Subfolders
[None yet.]
```

**Step 3. Show the operator the six drafts.** Operator approves or adjusts each.

**Step 4. Write the files.** Use Write tool for each. Confirm the target folder exists.

**Step 5. Deliver the confirmation.** Chat message: "Scaffolded [project-name] with 6 files at [path]. Next agent opening the folder will load CLAUDE.md first."

## Examples

**Example 1.** Operator says "new project, I'm starting a coaching program for founders." Skill fires. Walks through the 5 questions. Drafts the six files with founder-coaching-flavored language. Writes to `~/HQ/coaching-program/`.

**Example 2.** Operator says "scaffold a new client folder for Acme Corp." Skill fires. Uses client-engagement flavor. Notes Acme as ICP in CONTEXT.md. Locks the engagement start date as first DECISION entry.

**Example 3.** Operator says "set up a new business folder in my HQ." Skill fires. Confirms parent HQ path. Scaffolds business folder with pointer-up to parent HQ CLAUDE.md.

## Composes with

- `claude-md-hygiene`. maintains the router doc after scaffold.
- `living-notes-hygiene`. maintains the chronology.
- `decision-log`. appends new decisions to the scaffolded DECISIONS.md.
- `handoff`. handoff docs pointer into the scaffolded folder by path.
