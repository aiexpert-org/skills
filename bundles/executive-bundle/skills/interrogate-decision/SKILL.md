---
name: interrogate-decision
description: "Run an adversarial interrogation on a high-stakes decision BEFORE the operator commits. Walks the operator through five sharp-edged questions designed to surface blind spots, unstated trade-offs, and the failure mode the operator is not yet talking about. Pre-decision skill; runs before `decision-quality-check` (which is the go/no-go filter) and before `decision-log` (which captures the locked decision). In-session output only; nothing written to disk unless the operator asks for a transcript. Trigger phrases include 'interrogate this decision', 'grill me on this', 'grill me on this decision', 'stress test this choice', 'before I commit', 'pre-commit interrogation', 'poke holes in this', 'what am I missing', 'adversarial review of this decision', 'red team this', 'red team this decision', 'argue against this', 'argue the other side', 'devil's advocate this', 'talk me out of this', 'gut check this', 'am I fooling myself', 'push back on my logic'. Also invoke implicitly when the operator is describing a high-stakes choice (large financial commitment, one-way door, reputational bet, key-person hire, partnership lock-in) with unusual confidence and no counter-argument in the reasoning. Do NOT trigger for low-stakes two-way-door decisions (interrogation is a stall generator on reversible small choices), for post-lock rationalization (the interrogation is a pre-commit tool, not a post-hoc audit), when the operator is already in `decision-quality-check` (the two skills are sequential, not overlapping), or when the operator explicitly says they want validation rather than adversarial review (respect the stated altitude)."
tools: Read
---

LAST-VERIFIED: 2026-07-06. Source of truth: Matt Pocock's `/grill-me` skill (see the YouTube walkthrough at youtube.com/watch?v=6BB6exR8Zd8). Matt built `/grill-me` for coding decisions, then retired it in favor of `/grill-with-docs` for coding, but explicitly kept `/grill-me` alive for non-code use (eulogies, life decisions, hard choices). This skill ports the relentless-interviewer pattern into operator-flavored form for high-stakes executive and authority-based choices. Credit: Matt Pocock, aihero.dev, MIT licensed at github.com/mattpocock/skills. Adapted, not lifted. Re-verify if Matt ships a v2 of `/grill-me`.

The operator is about to commit. Big hire, big spend, big partnership, big pivot, big public position. Before the commit, an adversarial pass surfaces the blind spot. This skill does not talk the operator out of the decision. It asks the questions the operator is avoiding.

The interrogation runs five questions. Each question is designed to expose a specific class of blind spot. The operator answers out loud (or in prose). The skill does not accept vague answers; it asks the same question a second way when the answer dodges.

## When to use

- The operator names a decision they are about to commit to and the reasoning has holes.
- The operator is unusually confident about a high-stakes choice with no counter-argument in the frame.
- The operator asks for pushback ("grill me," "poke holes," "argue against this").
- A one-way door is about to close: partnership lock-in, key executive hire, public position on a contested issue, meaningful capital deployment.
- The operator wants a red-team pass before running `decision-quality-check` and locking the decision in `decision-log`.

## When NOT to use

- Low-stakes two-way-door decisions. Interrogation is a stall generator when the cost of reversal is small.
- Post-lock rationalization. This is a pre-commit tool. If the decision is already locked, route to `decision-log` for capture or `principle-check` for pattern extraction.
- When `decision-quality-check` is already running. The two skills are sequential (interrogation surfaces blind spots; the quality check runs the go/no-go filter); do not overlap them.
- When the operator explicitly asks for validation instead of interrogation. Respect the stated altitude. Reflect back what the operator is describing without adversarial edge.

## Output format

In-session dialogue. No file written unless the operator asks for a transcript at the end.

The dialogue runs in six blocks:

```
THE DECISION AS I HEARD IT
[one sentence, the operator's exact decision restated]

INTERROGATION
Q1: [question]
A1: [operator's answer, captured verbatim]
Q1 follow-up (if the answer dodged): [sharper phrasing]

Q2: [question]
A2: [operator's answer]
...

Q5: [question]
A5: [operator's answer]

BLIND SPOTS SURFACED
- [one line per blind spot the interrogation exposed]

WHAT THE OPERATOR STILL BELIEVES AFTER THE INTERROGATION
- [one line per belief that survived]

NEXT MOVE
[one of: RUN `decision-quality-check` NOW, DEFER (name what to gather first), REFRAME THE DECISION (name the new decision), or LOCK WITH MITIGATIONS (name the mitigations)]
```

Whole block runs 400 to 700 words. If it runs longer, the interrogation is not converging.

## The five questions

Ask them in this order. Each is designed to expose a different class of blind spot.

**Question 1: What are you avoiding by picking this?**
Every decision closes a door. Name the door. If the operator says "nothing, this is just the right call," push once: "What would you have to do differently if you didn't pick this? What conversation would you have to have that you're not having?" Real answers surface the avoidance. Common patterns: avoiding a hard conversation, avoiding a smaller-but-better version of the same idea, avoiding admitting a prior decision was wrong.

**Question 2: What would you need to see to change your mind?**
Direct falsifiability probe. If the operator cannot name a specific piece of evidence that would flip the decision, the decision is not falsifiable and the operator is committing on gut. Sometimes gut is correct; sometimes it's a way to skip the inconvenient evidence. Force the specificity: "What number, what quote, what event? Not a category. A specific thing."

**Question 3: Who is this decision made easier for at the expense of whom?**
Every consequential decision moves cost from one party to another. Investors to employees. Employees to customers. Present-you to future-you. Existing team to new hire. Name the shift. If the operator says "everyone wins," the interrogation has not landed; ask again with a sharper phrasing: "If this succeeds, who has more work than they did before? Who has less power? Who has less flexibility?"

**Question 4: What's the worst-case outcome you're not talking about?**
Operators talk about the base case. The worst case is what stays quiet. Force it into words. "Imagine six months from now this decision produced the worst outcome you can name. What does the outcome look like? Who told you first? What did they say?" If the operator says "there's no realistic worst case," the interrogation has surfaced a blind spot: the decision has not been stress-tested against downside.

**Question 5: If you had 90 days to reverse this, what would the reversal cost?**
Reversibility probe with a specific time-box. "Money, time, brand equity, relationships, credibility. Name the top three costs of reversal specifically." If the reversal cost is low, the operator can commit fast. If the reversal cost is high, the operator now knows the price of being wrong and can decide whether to buy insurance (mitigations) or defer.

## Interrogation discipline

- **Do not accept vague answers.** "I think it'll be fine" is not an answer. Ask again with a sharper phrasing.
- **Do not editorialize.** The skill asks questions; the operator answers. If the operator's answer is thin, ask the question a second way, not "that's a weak answer."
- **Do not stack the questions.** Ask Q1. Wait for the answer. Then Q2. Sequential.
- **Do not talk the operator out of the decision.** The skill's job is to expose blind spots. The operator decides whether the exposed spot matters. If the interrogation always concludes "don't do it," the operator stops running the interrogation.
- **Do not pre-judge the answer.** The operator may have already thought through every question and still land on the same decision. That is a legitimate outcome. The interrogation surfaces the reasoning; the operator confirms or refines.

## Composes with

- `decision-quality-check`. Sequential pairing. `interrogate-decision` surfaces blind spots BEFORE the go/no-go filter. `decision-quality-check` runs the go/no-go filter after the blind spots are named. Do not run both on the same decision at once; run interrogation first, then the quality check.
- `decision-log`. Post-decision capture. Once the decision locks, log it (with the blind spots that got named surviving as risks in the log entry).
- `principle-check`. Post-decision pattern extraction. If the interrogation exposed a recurring class of blind spot, promote it to a principle so it fires next time.
- `hard-conversation`. If Question 1 ("what are you avoiding") surfaces a conversation the operator has been avoiding, route to `hard-conversation` next.
- `dream-escalation`. If Question 3 ("made easier for whom at expense of whom") or the reframe step surfaces that the operator is playing small, route back to `dream-escalation` for a scale pass.

## Credit

Matt Pocock's original `/grill-me` skill (github.com/mattpocock/skills, MIT) is the origin of the relentless-interviewer pattern used here. Matt himself preserved `/grill-me` for non-code use after retiring it for coding in favor of `/grill-with-docs`. This bundle version ports the pattern from code decisions into operator decisions (partnerships, hires, capital commitments, public positions). Credit and thanks to Matt.
