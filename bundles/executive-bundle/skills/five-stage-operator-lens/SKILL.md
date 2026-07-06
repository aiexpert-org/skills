---
name: five-stage-operator-lens
description: "Identify which of five operating stages the executive is currently in (Vision, Strategy, Planning, Execution, Tracking) and calibrate the reply altitude to match. In-session output only; nothing written to disk. Trigger phrases include 'what stage am I in', 'operator lens', 'am I dreaming or executing', 'help me think this through', 'stage check', 'what mode am I in', 'am I in the weeds', 'am I in strategy or planning', 'lens check', 'meta this for me', 'zoom out', 'where are we in the process', 'I keep bouncing between'. Also invoke implicitly when the executive is thrashing between altitudes in the same conversation (dreaming, then executing, then dreaming again) and the agent senses a stage-lock would unstick the thinking. In that case offer 'Want me to run the operator lens on this?' rather than imposing it. Do NOT trigger when the executive has explicitly locked a stage and is asking for stage-appropriate execution, when the executive is mid-artifact (draft in flight, deck being cut), or when the request is a simple tactical question (a stage-check on a two-minute question is friction, not help)."
tools: Read
---

LAST-VERIFIED: 2026-07-06. Source of truth: HQ router CLAUDE.md, Operating Framework section, 5-Stage Operator Lens rule. Authored by Brett K. Moore. Re-verify if the operating framework changes.

This skill reads the current conversation, identifies which of the five operating stages the executive is in right now, and locks the reply altitude to that stage. The purpose is to prevent stage drift: the failure mode where an executive is dreaming and the agent drops into execution detail, or the executive is executing and the agent keeps opening new strategic frames. Neither serves the operator. The lens fixes the altitude, then the work proceeds at the correct altitude.

## The five stages

1. **Vision / Dreaming.** What is possible? First-principles thinking, beyond current constraints. Language of the stage: "what if," "imagine," "in ten years," "what could this become." The right response is expansion, not tightening.

2. **Strategy.** Trade-offs, leverage, resource allocation, non-obvious paths. Language of the stage: "which of these," "where do we place the bet," "if we do X we cannot do Y," "what is the leverage point." The right response is trade-off surfacing, not option generation and not execution steps.

3. **Planning.** Milestones, dependencies, risks, sequencing. Language of the stage: "when does this happen," "what depends on what," "what could break this," "who owns which piece." The right response is a plan with dependencies, risk flags, and sequencing. Not new options and not execution instructions.

4. **Execution.** Orchestrating the agents and humans doing the actual work. Language of the stage: "who does this," "when is this done," "what is the status of X," "why is Y late." The right response is task-level orchestration, blockers surfaced, and specific asks. Not a revisit of the plan and not a revisit of the strategy.

5. **Tracking.** KPIs, deviation surfacing, plan adjustments. Language of the stage: "how are the numbers," "are we on plan," "what is off," "what needs to be adjusted." The right response is measurement, comparison to plan, and an adjustment recommendation. Not new strategy and not new execution steps.

## How to identify the stage

Read the last three to five turns of the conversation. Ask three questions of the transcript:

1. What is the operator asking for? (An answer that lives at one specific altitude.)
2. What language is the operator using? (Match the language pattern to a stage using the vocabulary above.)
3. What would the operator do next if the current turn ended? (If they would go dream, they are in Vision. If they would go pick between options, they are in Strategy. And so on.)

If the answers point at the same stage, lock the stage. If they conflict, name the conflict to the operator and ask which stage they want to operate at right now.

## Output format

Hand back a short block in this exact shape:

```
STAGE READ
[one line naming the stage, and one sentence of why it reads that way]

WHAT THIS MEANS FOR THIS TURN
[one paragraph: what altitude the reply will operate at, what the reply will NOT do, and what the operator can expect from the next several turns while the stage holds]

INVITATION
[one sentence: an invitation for the operator to confirm or shift the stage; example: "Confirm this or tell me you want to shift into Planning."]
```

The block runs three to six sentences total. Any longer and the meta-reply eats the actual reply the operator came for.

## Stage-drift detection

If the operator's language shifts stages mid-conversation, surface the drift once. Example: "You opened this in Strategy (trade-off framing) and just moved into Execution (who owns what). Do you want to stay in Strategy and finish the trade-off pass, or move into Execution now?"

Do this once per conversation. If the operator keeps drifting after the surface, stop policing it; the drift is intentional and the operator is thinking in whole systems.

## When to invoke

Invoke at the start of a strategic conversation when the operator's stage is ambiguous. Invoke when the operator asks for a "meta" pass on their own thinking. Invoke when the operator says something that sounds like altitude confusion ("I keep bouncing between," "am I in the weeds," "I need to zoom out"). Invoke implicitly when the reply the agent is about to give is at the wrong altitude for the question being asked and the mismatch would waste the turn.

## When NOT to invoke

Do not invoke on a two-minute tactical question. If the operator asked "what time is the board call," the stage is irrelevant. Do not invoke when the operator has explicitly named the stage they are in and is asking for a stage-appropriate answer. Do not invoke when the operator is mid-draft on an artifact; the artifact is the work, the meta is friction.

## Companion skills

The lens is the anchor of the Executive Bundle. Companion skills that fire inside specific stages:

- `dream-escalation` fires in Vision and Strategy stages.
- `board-deck-draft`, `investor-update`, `hiring-loop`, `hard-conversation` fire in Planning and Execution stages.
- `weekly-executive-review`, `quarterly-strategy-reset`, `principle-check` fire in Tracking stage.
- `decision-quality-check` fires in Strategy or Planning stage, at the moment a decision is about to lock.
- `handoff` fires when the operator is ready to move a slice of work from their own hands to a lieutenant.

When the lens locks a stage, the model can auto-suggest which companion skill is stage-appropriate for the next turn.

## Anti-patterns

Do not run the lens as a preface to every reply. The lens is a stage-lock tool, not a warm-up ritual. If the operator's stage is obvious from the prior turn, skip the lens and reply at that stage.

Do not use the lens to defer answering. If the operator asked a real question, answer it, then (if useful) name the stage the answer landed at. Running the lens instead of answering is a stall tactic disguised as sophistication.

Do not layer the lens on top of `dream-escalation` in the same turn. Pick one. If the operator is in Vision, `dream-escalation` is the right tool. The lens is for stage identification when the stage is ambiguous, not for narrating what the operator is already doing.
