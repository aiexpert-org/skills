---
name: decision-quality-check
description: "Run a decision through a rigorous quality filter before it locks: is this reversible, what would you need to see to change your mind, what is the cost of being wrong, who else should weigh in, and what is the pre-mortem picture. Surfaces the weak spots in the decision so the executive locks with eyes open or defers with a specific reason. In-session output only; nothing written to disk unless the executive asks. Trigger phrases include 'check this decision', 'am I ready to decide', 'decision quality', 'pre-mortem', 'pre mortem', 'stress test this decision', 'poke holes in this', 'am I missing something', 'is this a good call', 'ready to lock', 'about to lock this in', 'sanity check this call', 'am I sure about this'. Also invoke implicitly when the executive is on the verge of locking a decision that carries meaningful cost or reversibility risk. Do NOT trigger for reversible small decisions (a two-way door choice with a low cost of reversal is a stall generator), when the executive has already locked and is asking for execution guidance, or when the executive is in a time-boxed decision they cannot defer further (in that case, the check has to fit in three minutes)."
tools: Read
---

LAST-VERIFIED: 2026-07-06. Source of truth: the general operator-community practice on structured decision-making (drawn from Jeff Bezos's two-way-door framing, Annie Duke's decision-quality writing, standard pre-mortem practice from Gary Klein). Adapted, not lifted. Brett K. Moore's operating rhythm. Re-verify if the state of decision-science practice shifts.

This skill runs a decision through a five-question quality filter and surfaces the weak spots. The executive uses the output to decide whether to lock, defer, or refine. The skill does not make the decision. It exposes what the executive might be missing.

The check is deliberately short (five questions, under ten minutes) because a check that takes as long as the decision is a stall. Executives lock decisions all day; the check has to fit inside the decision-making moment, not replace it.

## Step 0: Confirm the decision

Restate the decision back to the executive in one sentence. If the sentence is ambiguous (multiple decisions, unclear scope, missing the actual choice), ask the executive to sharpen it before running the check. The most common failure of this skill is running the check against a fuzzy decision; the check produces fuzzy answers and the executive concludes the check is not useful.

Once the decision reads as one specific choice ("Do we sign the Acme deal at $2M over 12 months, or hold for the $3M annual we think is available if we push?"), proceed.

## The five questions

**Question 1: Reversibility.**
Is this a one-way door or a two-way door? If it is a two-way door (cost of reversal is small, timeline of reversal is short), lower the bar for locking. If it is a one-way door (cost of reversal is large, timeline is long, brand or trust damage is possible), raise the bar.

Concrete test: if the executive locks this decision today and it is wrong, how many weeks and how many dollars to reverse? If the answer is "days and low five figures," this is a two-way door. If the answer is "quarters and seven figures or reputation damage," this is a one-way door.

**Question 2: Cost of being wrong.**
Independent of reversibility, what does the wrong version cost? Money, time, morale, brand equity, key-person departure, board confidence, customer trust. Name the top two costs specifically. If the cost of being wrong is small, lower the bar. If it is meaningful, raise the bar and answer question 3 more rigorously.

**Question 3: Falsifiability.**
What would you need to see to change your mind? If the executive cannot name a specific piece of evidence that would flip the decision, the decision is not falsifiable and the executive is locking on gut alone. That is sometimes correct (some decisions have to be gut calls), but the executive should name the choice explicitly.

Concrete test: if the executive imagines the decision playing out for six months and it goes poorly, what specifically would they see that would make them regret it? If they cannot name what, the check has surfaced a blind spot.

**Question 4: Diverse input.**
Who else has skin in this decision or the closest information on it? Have you asked them? If the executive is locking without input from the two or three people closest to the actual situation, the check surfaces that gap. Sometimes the executive is right that they have the input they need; sometimes they are protecting themselves from feedback that would slow the decision. The check names the gap regardless.

**Question 5: Pre-mortem.**
Imagine it is six months from now and this decision failed. Not "went sideways." Failed. What is the story of the failure?

If the executive can tell a specific story of failure ("we locked Acme at $2M, they underused, they churned, we had to eat the annual contract and lay off two AEs to cover"), the failure mode is nameable and the executive can decide whether to lock with mitigations or defer. If the executive cannot tell a story of failure, the decision has not been stress-tested and the check surfaces that.

## Output format

Hand back a five-block response in this exact shape:

```
DECISION AS I HEARD IT
[one sentence, the executive's exact decision restated]

REVERSIBILITY
[one to two sentences, one-way door or two-way door, and what that means for the bar]

COST OF BEING WRONG
[one to two sentences naming the top two costs]

FALSIFIABILITY
[what evidence would flip the decision; if the executive cannot name it, flag that]

DIVERSE INPUT
[who else has skin in this decision, whether they have weighed in, and the recommendation on whether to consult them before locking]

PRE-MORTEM PICTURE
[the six-months-later story of failure, in three to five sentences]

RECOMMENDATION
[LOCK NOW, LOCK WITH MITIGATIONS (name them), DEFER (name what to gather first), or KILL. One paragraph of reasoning.]
```

The whole block runs 300 to 500 words. If it runs longer, the executive stalls; if shorter, the check does not do the work.

## When to invoke

Invoke when the executive names a decision they are about to lock. Invoke when the executive says "pre-mortem this" or "stress test this." Invoke implicitly when the executive is describing a decision with meaningful cost or reversibility risk and the reasoning has holes.

## When NOT to invoke

Do not invoke for two-way-door decisions with low reversal cost; running the check on those is a stall generator. Do not invoke after the executive has already locked; the check is a pre-lock tool, not a post-hoc audit. Do not invoke when the decision must be made in the next three minutes; the check does not fit the window.

## Anti-patterns

Do not use the check to steer the executive toward "defer." The check exposes what is missing; the executive decides whether the missing thing matters. If the check always concludes "defer," the executive stops running the check.

Do not use the check to signal the executive is not ready. The executive is running the check because they are ready to lock and want a final pass. Respect that. The check either confirms they can lock or names one specific gap to close.

Do not layer this skill with `dream-escalation` on the same decision. Escalation is a sizing tool; the quality check is a lock tool. Escalation happens before scope locks. The quality check happens as the decision inside the scope locks.

## Companion skills

Runs cleanly next to `dream-escalation` (which sizes the scope; the quality check locks the decision inside the sized scope), `principle-check` (which captures the reasoning after the lock), and `hard-conversation` (if the decision requires an executive to have a difficult conversation with a specific person before or after the lock).
