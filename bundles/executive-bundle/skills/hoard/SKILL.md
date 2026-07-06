---
name: hoard
description: "Capture and organize the executive's stream of strategic insights, decisions in flight, patterns spotted across their portfolio or team, and the small observations that would otherwise evaporate between conversations. Appends a dated entry to a canonical HOARD.md at the operator's HQ root (or the closest equivalent). Trigger phrases include 'hoard this', 'save this', 'log this insight', 'stash this thought', 'add to the hoard', 'capture this', 'file this', 'squirrel this away', 'log this pattern', 'add to my strategic notes', 'this is a good one', 'note to self', 'add to the file'. Also invoke implicitly when the executive says something in passing that reads as a durable insight the executive would want back later. Do NOT trigger for tactical to-do items (those belong in a task manager, not the hoard), for meeting minutes (those belong in a meeting log), or for decisions ready to lock (those belong in decision-quality-check or a decision log, not the hoard)."
tools: Read, Write, Edit
---

LAST-VERIFIED: 2026-07-06. Inspired by Simon Willison's public practice of maintaining a durable working notebook that surfaces patterns across time. Adapted for executive-scale knowledge (strategic insights, patterns across a portfolio or team). Brett K. Moore's operating rhythm. Re-verify if the general practice of durable-note-taking shifts.

This skill captures the small durable observations that would otherwise evaporate. Executives spot patterns constantly (across their team, their portfolio, their industry, their customer base, their board dynamics) and the patterns are load-bearing insight, but they usually get lost between conversations because the executive is moving fast and no obvious place exists to file them.

The hoard is that place. Appends to a canonical `HOARD.md` at the operator's HQ root (or the closest equivalent working folder). Never overwrites, only appends.

## Step 0: Confirm the target file

The default target is `HOARD.md` at the operator's HQ root. If the file does not exist, create it with the standard header block below and start appending. If the operator uses a different path convention (Obsidian vault, a per-business hoard, a specific `insights.md`), inspect the environment at Step 0 and adapt.

Standard header block for a new hoard file:

```
# HOARD

A durable append-only capture of strategic insights, decisions in flight, patterns spotted, and small observations worth keeping.

Entries are dated. Never delete. Consolidation happens quarterly via a review pass, not by editing individual entries.

---
```

## Step 1: Classify the entry

Every hoard entry has one of five types. Ask (or infer from the operator's phrasing) which type this entry is.

1. **INSIGHT.** A durable observation about the operator's world. Example: "when a customer's usage spikes 3x for a week and then drops back, they are almost always evaluating a competitor." Not a decision, not a task. A pattern.

2. **PATTERN.** A recurring behavior spotted across multiple instances. Example: "every board member who joined pre-Series-B pushes back on marketing spend increases; every post-Series-B board member pushes back on hiring pace." A pattern is stronger than an insight; the operator has seen it play out multiple times.

3. **DECISION-IN-FLIGHT.** A decision the operator is thinking through but has not locked. The hoard captures the current framing, the options being weighed, and what the operator is currently leaning toward. When the decision locks, it graduates out of the hoard into a proper decision log; the hoard entry stays as the historical trace.

4. **PERSON-NOTE.** An observation about a specific person the operator works with. Board member, direct report, key customer, investor. Non-sensitive. Sensitive person-notes go to a private note file, not the hoard.

5. **QUESTION.** An open question the operator is sitting with. Example: "why did our Q3 pipeline generation drop 40% when our marketing spend was flat?" Questions in the hoard are triggers for later thinking, not tasks; when they get answered, the answer becomes an INSIGHT or a PATTERN entry.

If the operator's entry does not cleanly fit one of the five, ask which type before writing.

## Step 2: Append the entry

The entry has a fixed structure. Do not deviate.

```
## [YYYY-MM-DD], [TYPE], [one-line title]

**Context.** [One to three sentences of context: what triggered this, where the operator was, what was happening.]

**The entry itself.** [The insight, pattern, decision-in-flight, person-note, or question. One to five sentences. Concrete language.]

**Why it matters.** [One sentence: why the operator wants this back later.]

**Companion pointers (optional).** [If the entry relates to another skill's output (a decision log entry, a board deck, an investor update), name the pointer. Otherwise skip.]

---
```

If the entry does not have a clear "why it matters," ask the operator. If they cannot answer, the entry is probably too small for the hoard; suggest they discard it.

## Step 3: Surface adjacent entries

After appending the new entry, scan the hoard for prior entries that share the same title theme, the same person, or the same topic. If matches exist, surface them: "You have three prior hoard entries about board dynamics. Want to see them?" This is the compound-interest feature of the hoard: patterns emerge when adjacent entries live in one place.

Do not force-connect entries. If the matches are weak, do not surface them. Weak connections train the operator to distrust the surfacing.

## Output format

Hand back a short reply:

```
HOARD ENTRY LOGGED
File: [absolute path to HOARD.md]
Type: [INSIGHT / PATTERN / DECISION-IN-FLIGHT / PERSON-NOTE / QUESTION]
Title: [one-line title]

Adjacent entries: [list of dated titles that share theme, or "none found"]

Suggested next: [if the entry is a DECISION-IN-FLIGHT, suggest decision-quality-check when the operator is ready to lock. If a PATTERN, suggest principle-check. Otherwise skip.]
```

## Voice rules

Entries are in the operator's voice, not the agent's. Do not summarize the operator's insight into cleaner-but-blander language; the hoard's value is the operator's exact framing. If the operator said "the CFO gets weird when I mention EBITDA outside of finance meetings," the entry reads that way. Not "there is a communication pattern with the CFO around specific financial terminology."

## Anti-patterns

Do not use the hoard as a task list. Tasks belong in a task manager. The hoard is durable, not actionable.

Do not use the hoard as a meeting log. Meetings belong in a meeting-log file. The hoard is patterns and insights, not minutes.

Do not use the hoard as a decision archive. Locked decisions belong in `DECISIONS.md`. The hoard captures decisions IN FLIGHT; once locked, they graduate out.

Do not use the hoard as a place to vent. If the entry is emotional processing, name it, and offer to route the entry to a private journal instead. The hoard is for durable-signal capture, not real-time emotional metabolism.

## When to invoke

Invoke when the operator says "save this," "log this," "capture this," or the ten other phrases in the trigger list. Invoke implicitly when the operator says something durable in passing and would want it back later.

## When NOT to invoke

Do not invoke for tactical tasks, meeting minutes, ready-to-lock decisions, or emotional processing.

## Companion skills

Runs alongside `principle-check` (which promotes a hoard PATTERN into a captured principle), `decision-quality-check` (which locks a DECISION-IN-FLIGHT out of the hoard), and `quarterly-strategy-reset` (which reads the hoard as input for what shifted this quarter).
