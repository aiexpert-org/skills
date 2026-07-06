---
name: layoff-comms
description: "Draft the communications package for a layoff, restructure, or role elimination announcement. Produces the affected-person one-on-one script, the surviving-team all-hands remarks, the leadership FAQ, the external customer note (if applicable), and the follow-up 24-hour and 7-day check-in scripts. This is the hardest single skill in the Executive Bundle. It is written to protect the humans involved and to hold the executive to a standard higher than the average corporate playbook. Trigger phrases include 'layoff comms', 'restructure announcement', 'role elimination script', 'draft the layoff', 'RIF comms', 'reduction in force', 'downsize announcement', 'severance announcement'. Do NOT trigger for a routine departure (that is a targeted comms, not a layoff) or for a general all-hands (route to `all-hands-remarks`)."
---

LAST-VERIFIED: 2026-07-06. Source of truth: Brett K. Moore, AI Expert Marketplace v1.1.0.

This skill drafts the full communications package for a layoff, restructure, or role elimination announcement.

Layoffs are the hardest single executive action. The skill exists to hold the executive to a standard: name the people affected as humans, do not spin, do not use "impacted" or "let go" euphemisms, take responsibility where the executive owns the decision, and structure the surviving team's next 90 days so the remaining people can breathe.

## When to use

- The executive has made the decision to reduce headcount, restructure a team, or eliminate a role.
- The comms need to go out in a defined order (affected people first, then leadership team, then all-hands, then external if applicable).
- The executive wants the drafts before running them past HR, legal, or their board.

## When NOT to use

- The decision is not yet made (route to `decision-log` and `interrogate-decision` first).
- The event is a single person's routine exit or transition (that is a targeted comms, not a layoff).
- Legal counsel has not yet been engaged and there is jurisdictional exposure — flag the executive to engage counsel before drafting sensitive language.

## Prerequisites the operator provides

- Number of affected people and rough function breakdown.
- Reason (funding runway, strategic reprioritization, restructure, performance is NOT a layoff reason and should be handled separately).
- Severance and benefits package.
- Timeline (when do the affected people hear, when does the all-hands run, when is the external note).
- Whether outplacement or references are being offered.
- Whether there is legal review pending.

## The five artifacts

### 1. Affected-person one-on-one script

Structured as: name the decision (not the person's failure), the reason at the company level, what happens next (last day, severance, benefits, references, outplacement), space for the person to react, the executive's contact for follow-up questions.

Rules:
- Do not use "let go," "impacted," "sunset the role," or "make some tough calls."
- Do use: "we are eliminating your role" or "your role is being eliminated."
- Do not attribute the decision to the affected person unless it is genuinely performance-based and the person has had prior documented feedback.
- Do not extend the conversation past 15 minutes on the first call. Space for the person to react is essential; extended discussion is for the follow-up.

### 2. Surviving-team all-hands remarks

Structured as: what happened, why, who is affected (functions, not names, unless the affected people have consented to be named), what is not changing for the surviving team, what is changing for the surviving team, the executive's ownership of the decision, the ask (focus, hold the line, do not speculate), the close.

Rules:
- Do not thank the affected people for their contributions in a way that implies they were the reason for the layoff.
- Do not tell the surviving team "this is the last one" unless the executive genuinely knows it is.
- Do address the specific question the surviving team is asking silently: "am I next?"

### 3. Leadership FAQ

For the executive team, VPs, and managers to have consistent answers when their reports ask questions. Cover: how were the decisions made, who made them, is more coming, what does severance look like, what about the affected person's projects, what do we do if a customer asks.

### 4. External customer note (if applicable)

Only if the layoff meaningfully changes what customers experience (support hours, product roadmap, account manager coverage). Structured as: what changed, what does not change, who is the customer's new contact, direct executive line for concern.

### 5. Follow-up check-in scripts

24-hour check-in with affected people (individually): a warm, no-agenda call from the executive or the person's manager, purely to check in as a human.

7-day check-in with surviving team direct reports (individually): a structured "how are you doing, what are you hearing, what do you need" conversation.

## Output shape

Five separately-titled sections in one Markdown doc, each ready to be reviewed by HR and legal before delivery.

```
LAYOFF COMMS PACKAGE — [DATE]

Reviewed by: [ ] HR  [ ] Legal  [ ] Board (if applicable)

## 1. Affected-person one-on-one script
[...]

## 2. Surviving-team all-hands remarks
[...]

## 3. Leadership FAQ
[...]

## 4. External customer note (if applicable)
[...]

## 5. Follow-up check-in scripts (24-hour and 7-day)
[...]
```

## The executive check

Before delivering any of the drafts, the skill produces a "check yourself" block:

```
BEFORE YOU DELIVER

- Have you named the specific reason at the company level, not the person level?
- Have you taken responsibility for the decision if you own it?
- Have you removed every "impacted," "let go," "sunset," "make some tough calls," "essentially," "unfortunately," "seamless"?
- Have you scheduled the 24-hour and 7-day check-ins?
- Have you engaged legal counsel where required?
- Have you paid the affected people what you told them they would be paid, on the day you told them it would land?
```

## Voice rules

- No em dashes.
- No banned vocabulary.
- No "X, not Y" patterns.
- No emojis.
- No corporate-speak euphemisms.
- Named responsibility from the executive.

## Related skills

- `hard-conversation` — for the one-on-one prep.
- `decision-log` — for capturing the reasoning behind the layoff for the executive's own record.
- `all-hands-remarks` — for the standing quarterly all-hands after the layoff dust settles.
