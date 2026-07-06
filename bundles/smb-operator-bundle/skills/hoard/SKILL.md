---
name: hoard
description: "Capture a solved-problem snippet with keywords so the operator can find it again months later. When the operator solves a hard thing (a working SQL query, a working Zap, a phone script that closed a deal, a killer subject line), this skill saves it to the operator's private playbook file with a title, tags, and the exact snippet. Trigger phrases include 'save this for later', 'hoard this', 'remember how I did this', 'add to my playbook', 'capture this snippet', 'save this to my library', 'log this working example', 'stash this', 'save the winning [X]', 'add this to my hoard', 'this worked, save it', 'remember this one', 'capture this play'. Use when the operator solves a problem in a way they'll want to reuse. Do NOT trigger for permanent business decisions (route to decision-log), for meeting notes (route to end-of-day-review), or for one-off answers that won't be reused."
---

LAST-VERIFIED: 2026-07-06. Source of truth: inspired by Simon Willison's "Hoard things you know how to do" (agentic engineering patterns, simonwillison.net/guides/agentic-engineering-patterns/hoard-things-you-know-how-to-do/). Adapted for SMB operators. Simon's original pattern is public writing, not a shipped skill; this file translates the pattern into a working SKILL.md.

This skill makes the operator's playbook compound. Small business owners solve the same hard problems every quarter because they never write down the solutions. The winning cold-email subject line, the SQL query that pulled the right report, the phone script that closed the deal. all lost. This skill captures them the moment they work.

Output: an appended entry in `hoard/playbook.md` at the operator's HQ, plus a short chat confirmation.

## When to use

- The operator just made something work (an email, a query, a script, a workflow, a pitch).
- The operator says "I want to remember how I did this."
- The operator solved a problem they've solved before but forgot the solution.
- Any moment the operator would benefit from a searchable snippet library.

## When NOT to use

- The item is a business decision, not a snippet (route to `decision-log`).
- The item is a meeting note (route to `end-of-day-review`).
- The item is a one-off that will not be reused.
- The item contains sensitive credentials (redact first).

## What you'll produce

An appended entry in `hoard/playbook.md`:

```
## [Title, in the operator's language]

**Tags:** [comma-separated keywords for searching]

**Problem it solves:** [One sentence.]

**The snippet:**
[The exact working code, copy, query, script, or process. Verbatim.]

**How to use it:** [One paragraph on when to reach for this again.]

**Captured:** [Date]

**Notes:** [Any gotchas or context the future self needs.]
```

## Instructions

**Step 0. Lock four things.**
1. **The snippet.** The exact working thing the operator wants to capture. Get it verbatim.
2. **The title.** In the operator's own language. Not "SQL query 47." Instead: "the query that shows me last month's late invoices."
3. **The tags.** 3 to 6 keywords the operator's future self will search for.
4. **The date.** Run `date +%Y-%m-%d`.

**Step 1. Verify the snippet is worth hoarding.** Ask: "Will you actually reach for this again in the next 90 days?" If no, the hoard file bloats; suggest a lighter capture location.

**Step 2. Redact if sensitive.** Scan the snippet for API keys, passwords, PII, or client names that should stay private. Replace with placeholders and add a note.

**Step 3. Draft the entry.** Use the shape above. Keep the "how to use it" section short; the snippet does the heavy lifting.

**Step 4. Show and confirm.** Operator approves or adjusts.

**Step 5. Append to `hoard/playbook.md`.** Create the file if it doesn't exist. Append at the bottom. Do not overwrite.

**Step 6. Deliver the confirmation.** Chat message: "Hoarded. Filed under [title] with tags [tags]. Search for [any tag] to find it later."

## Examples

**Example 1.** Operator sends a cold email that gets a same-day reply. Operator says "hoard this subject line, it works." Skill fires. Captures the subject line, tags it "cold-email, subject-line, winning-subject." Appends to playbook.

**Example 2.** Operator gets a GHL workflow trigger firing correctly after 2 hours of debugging. Operator says "save this for later, I'll need it again." Skill fires. Captures the trigger config with a note on the gotcha (had to disable the conflicting tag).

**Example 3.** Operator writes a phone script that closes a stalled prospect. Operator says "add this to my playbook." Skill fires. Captures the script with tags "close-script, stalled-prospect, phone."

## Composes with

- `weekly-review`. surfaces new hoard entries from the week for a browse.
- `ghost-writer-me`. pulls from the hoard when drafting new copy.
- `brand-voice-consistency`. the voice canon lives adjacent to the hoard file.
