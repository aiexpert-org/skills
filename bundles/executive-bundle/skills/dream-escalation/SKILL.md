---
name: dream-escalation
description: "Apply a scale-escalation pass to any idea the executive shares before settling on the size. Surface the 10x, 100x, and 1000x versions as present-tense scope altitudes the executive can choose to operate at right now, then recommend which altitude is the right one given capital, time, risk tolerance, and current bandwidth. In-session output only; nothing written to disk. Trigger phrases include 'dream escalate', 'escalate this', '10x this', '100x this', 'what would the biggest version look like', 'how big could this be', 'dream check', 'small vision', 'think bigger', 'what's the trillion-scale version', 'am I thinking too small', 'give me the bigger frame', 'run the escalation pass'. Also invoke implicitly when the executive shares an idea with conviction and the agent senses the stated framing is below the actual ceiling of the idea; in that case offer 'Want me to run the escalation pass on this before we lock scope?' rather than imposing it. Do NOT trigger when the executive is in Execution or Tracking stage and a stretch reframe will derail what they are shipping, when the executive has already locked scope and explicitly wants to ship at the chosen size, when the idea is genuinely small and escalating would dilute focus, or when the executive is upset, exhausted, or operating from constraint rather than possibility."
tools: Read
---

LAST-VERIFIED: 2026-07-06. Source of truth: HQ router CLAUDE.md, Dream Escalation rule under Operating Framework, and Brett K. Moore's `System/skills/dream-escalation/SKILL.md` v2.0 (2026-06-12). This is the portable Marketplace shape; the internal Brett-vault version is verbatim identical in methodology.

This skill runs an escalation pass on any idea the executive shares. It surfaces bigger versions of the stated dream so the operator can choose which altitude to operate at right now. The goal is the right altitude for the operator's capital, time, risk tolerance, and current bandwidth. The goal is not always the biggest altitude. The goal is never to sequence the tiers across calendar windows.

## What the pass is

When an executive shares an idea, the natural ceiling on that idea is usually below their actual ceiling. They have constrained the dream to what feels achievable from where they are sitting today. The escalation pass breaks that constraint by showing bigger orders of magnitude as present-tense altitude options the operator can choose to operate at now. The operator sees the 10x, 100x, and 1000x versions of their own idea as live altitudes. Then they pick where to play with full information about what was on the table.

The five-step methodology:

1. Validate the dream as stated. Honor the original framing. Do not dismiss it or correct it before exploring it.
2. Describe the 10x altitude. What is 10x the scale or impact of this exact idea, described as a present-tense scope choice the operator can make right now?
3. Describe the 100x altitude. What is 100x with first-principles reasoning (not 10x with bigger adjectives), described as a present-tense scope choice?
4. Describe the 1000x altitude if it is relevant to the operator's actual position. Same rule. Present tense. Scope altitude, not future milestone.
5. Recommend which altitude to operate at. Based on capital, time, risk tolerance, current bandwidth, and what the operator is already shipping, which altitude is the right one to operate at right now? The recommendation is altitude selection, not altitude sequencing.

## The critical reasoning rule

Every tier is a present-tense scope altitude. Not a future destination. Not a phase in a roadmap. Not a milestone that follows the previous tier.

When an operator chooses to operate at the 1000x altitude, every decision they make today is filtered through "does this serve becoming the 1000x version?" The smaller tiers are byproducts of operating at the bigger altitude. They are not stepping stones the operator has to walk through on the way to the bigger altitude.

This matters because the failure mode this skill exists to prevent is the operator re-anchoring the dream back to current resource constraints. The most common way that happens is by assigning each tier to a calendar window ("next 30 days the 10x, next 90 days the 100x"). That framing collapses the entire frame back to "what can I afford right now."

## Hard guardrails on output

1. No calendar references in any tier description. No "next 30 days," "next quarter," "by year-end," "12 months from now," "long-term," "eventually," "down the line," "phase 2," "after we ship X." Every tier is a live altitude available today.
2. No "we'll get to X eventually" language. Every tier is viable today as a scope choice.
3. The recommendation describes altitude selection, not altitude sequencing. The verb is "operate at," not "build toward" or "work up to."
4. The maximal tier is a live scope choice. The phrase "currently impossible" is banned.
5. The recommendation reasoning is grounded in capital, time, risk tolerance, and bandwidth. Not calendar position.

## When to invoke

Invoke in Vision stage and Strategy stage. Invoke during ambiguous strategic conversations where the operator is sizing something. Invoke when the operator says "I am thinking about doing X" or "what if I built X" or "I want to launch X." Invoke implicitly when the operator shares an idea with conviction and the stated framing sits below their actual ceiling. Offer, do not impose.

## When NOT to invoke

Do not invoke in Execution or Tracking stage. Do not invoke when scope is locked. Do not invoke when the idea is genuinely small. Do not invoke when the operator is upset, exhausted, or operating from constraint.

## Output format

Hand back a five-block response in this exact shape:

```
DREAM AS STATED
[restate the idea in the operator's own framing, validated]

10x ALTITUDE
[the same idea at 10x scale or impact, described as a present-tense scope choice with one to three concrete moves that operating at this altitude would mean today]

100x ALTITUDE
[the same idea at 100x, reasoned from first principles, described as a present-tense scope choice with concrete moves]

1000x ALTITUDE
[the same idea at 1000x if relevant, described as a present-tense scope choice with concrete moves; if not relevant, say so and explain why]

RECOMMENDATION
[which altitude to operate at right now, given the operator's capital, time, risk tolerance, and current bandwidth; explicit reasoning for the altitude selection]
```

Each altitude tier is one to three short paragraphs. The recommendation block is one paragraph. The operator should be able to read the recommendation and see the trade-off the agent is making on their behalf, then agree or push back.

## Self-check before delivering

1. Did I describe each tier as a present-tense scope altitude?
2. Any calendar references? (Search for "30 days," "quarter," "year," "eventually," "long-term," "phase," "after we ship." If any hit, rewrite.)
3. Is my recommendation altitude selection or altitude sequencing? (Should be selection.)
4. Did I describe the maximal tier as "currently impossible" or as a live scope choice? (Should be the latter.)
5. Are the tiers structurally different, or is it adjective inflation? (10x is throughput at the same model. 100x is a structural change to delivery. 1000x is a structural change to category.)

If any check fails, redo before delivering.

## Pushback rules

If the operator keeps shrinking the dream after you escalate it, surface the pattern once. If they confirm they want the smaller altitude, the smaller altitude is the right answer. Move on.

If the operator inflates without basis (proposing a 1000x altitude that assumes a sales force, a fundraising round, and a runway they have not mentioned), surface that too. The operator's actual position is the gate.

If the operator describes the recommendation as a sequence ("so I do the 10x first and then move to the 100x later"), surface the reasoning rule: the tiers are not a sequence, they are altitudes. Choose one and operate at it. The smaller tiers become byproducts of operating at the bigger one.

## Companion skills

Runs cleanly next to `five-stage-operator-lens` (which locks the stage) and `decision-quality-check` (which stress-tests the altitude choice before it locks). Feeds `quarterly-strategy-reset` (which uses the chosen altitude as the frame for the next quarter's focus).
