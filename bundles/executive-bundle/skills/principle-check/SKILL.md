---
name: principle-check
description: "Capture a decision principle the executive operated on, tag it with the situation that generated it, and file it in a growing playbook. Over time the playbook surfaces the principle you used in similar past decisions when a similar situation reappears. Appends to a canonical PLAYBOOK.md at the operator's HQ root. Trigger phrases include 'log a principle', 'record my thinking', 'add to my playbook', 'principle for', 'how I think about this', 'this is a rule I operate by', 'add this to my rules', 'capture the rule', 'the principle here is', 'file this as a rule', 'log the reasoning', 'save this reasoning', 'my rule for', 'my heuristic for'. Also invoke implicitly when the operator articulates a durable rule they operate by (across multiple decisions) and would want it back next time. Do NOT trigger for a one-off decision reasoning (that lives in the decision-log tooling, not the principle book), for tactical rules of thumb (task-manager territory), or for organizational values (those belong in a company values doc, not the operator's principle book)."
tools: Read, Write, Edit
---

LAST-VERIFIED: 2026-07-06. Adapted, not lifted, from Ray Dalio's public writing on operating principles. Adapted for solo executive use (per-operator playbook, not organizational rulebook). Brett K. Moore's operating rhythm. Re-verify quarterly.

This skill captures the durable rules an executive operates by. When the executive articulates the reasoning that shapes a decision ("I always default to firing fast when a leadership hire is not landing by day 90"), the skill files that reasoning in a playbook. Over time, when similar decisions come up, the skill surfaces the principle so the executive does not re-derive it from scratch.

Playbooks compound. An executive who captures 60 principles over three years operates faster and more consistently than one who re-reasons every decision. That is the whole play.

Output goes to `PLAYBOOK.md` at the operator's HQ root. Standard header block:

```
# PLAYBOOK

Durable operating principles. One entry per principle. Each entry has a situation, the principle, the reasoning, and a link to the decision that first surfaced it.

Never delete. Consolidation happens quarterly during the strategy reset, not by editing individual entries.

---
```

## Step 0: Confirm the principle is durable

Ask the executive one question before writing: "Is this a rule you operate by across multiple decisions, or a one-off call?" If it is a one-off, route it out of the playbook and into a decision-log tool. The playbook is for durable rules only.

Test for durability: has the executive applied this principle before? Would they apply it again in a similar future situation? If both answers are yes, it is a principle. If either is no, it is a decision, not a principle.

## The four-part entry

Every principle entry has the same four parts.

**Part 1: The situation.**
One sentence naming the class of situation the principle applies to. Not "when we hire" (too broad). Not "the Acme deal" (too specific). Somewhere in the middle: "when hiring an executive-level leader into a growth-stage company." The class of situation is what makes the principle findable later.

**Part 2: The principle itself.**
One or two sentences. The rule. In the operator's voice. Not a smoothed-out corporate rule. Concrete language, specific verbs.

**Part 3: The reasoning.**
Two to five sentences. Why the operator holds this principle. What evidence, what prior experience, what values shape it. This is what makes the principle stress-testable later. When the situation shifts, the operator can re-examine the reasoning to see if the principle still holds.

**Part 4: The originating decision.**
The specific decision that surfaced this principle. Named with a date and (if it exists) a link to the operator's decision log entry. This is the traceability line; the operator can see the origin of every rule they operate by.

## Output format

Append to PLAYBOOK.md in this shape:

```
## Principle [N]: [one-line title], captured [YYYY-MM-DD]

**Situation.**
[The class of situation, one sentence.]

**Principle.**
[The rule, one to two sentences, operator's voice.]

**Reasoning.**
[Two to five sentences.]

**Originating decision.**
[Decision name, date, and link if available.]

---
```

Then hand back a short reply:

```
PRINCIPLE LOGGED
File: [absolute path to PLAYBOOK.md]
Principle: [one-line title]

Related principles: [if adjacent principles exist that address the same or overlapping situation class, surface them here. If not, "no related principles yet."]

If two or more principles contradict each other on the same situation class, surface the contradiction. The operator resolves; the agent does not.
```

## Surfacing principles at decision time

The playbook is not just a write-only file. When a future decision arrives that matches a captured principle's situation, the skill surfaces the principle. Example: the operator says "we are hiring a VP of Sales" and the skill surfaces "You have three prior principles about executive-level hires. Want to see them before you design the loop?"

This is the compound-interest feature. Every captured principle raises the operating quality of future decisions in the same class.

## Voice rules

Principles are in the operator's voice. Not a smoothed-out consulting rule. If the operator's principle is "cut fast on cultural misfits, slow on capability gaps," the entry reads that way. Not "we optimize for cultural alignment while investing in capability development."

## Anti-patterns

Do not capture principles the operator does not actually hold. If the entry is aspirational ("I should always do X"), name it aspirational and route it to the hoard or to the weekly review, not to the playbook. The playbook is the operator's actual operating rules, not the ones they wish they had.

Do not capture organizational values as principles. Company values belong in a company values document. The playbook is the operator's private rulebook, not the organization's.

Do not capture one-off decisions as principles. The Step-0 durability test is the filter. If the operator says "this was a one-off," it does not enter the playbook.

## When to invoke

Invoke when the operator says "log a principle" or the trigger phrases. Invoke implicitly when the operator articulates reasoning that reads as a durable rule.

## When NOT to invoke

Do not invoke for one-off decisions, tactical rules of thumb, or organizational values.

## Attribution

Structural design adapted from Ray Dalio's public writing on operating principles. This skill implements the compound-interest capture pattern; the specific principles are the operator's, not Dalio's.

## Companion skills

Runs alongside `hoard` (patterns in the hoard often become principles), `decision-quality-check` (locking a decision often surfaces the principle behind it), `weekly-executive-review` (recurring themes across weeks often surface principles), and `quarterly-strategy-reset` (the reset re-reads the playbook and asks which principles still hold).
