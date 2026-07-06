---
name: context-rot-check
description: "Detect when the current Claude conversation has decayed to the point where a fresh session or a handoff would be higher-leverage than continuing. Surfaces the specific decay signals (contradiction with earlier facts, forgotten constraints, spinning on the same suggestion, cargo-culting a prior file, hallucinated tool availability) and recommends the right recovery move. Trigger phrases include 'context rot check', 'is my context stale', 'is Claude getting confused', 'should I restart this session', 'is the context too long', 'am I hallucinating tool calls', 'context health check'. Also invoke implicitly when the agent notices its own inconsistency or when the operator seems to be repeating themselves to correct the agent. Do NOT trigger for routine long sessions that are still coherent."
---

LAST-VERIFIED: 2026-07-06. Source of truth: Brett K. Moore, AI Expert Marketplace v1.1.0.

This skill runs a health check on the current conversation and calls out context rot before it burns another hour of the operator's day.

Context rot is the specific failure mode where a long Claude session accumulates enough noise (tool outputs, discarded drafts, superseded instructions, forgotten user corrections) that the agent's responses degrade even though the model itself is fine. The signals are recognizable. Catching them early saves the operator from grinding on a session that should be handed off.

## When to use

- The operator has been in-session for more than an hour on a single thread.
- The operator has corrected the same mistake twice in a row.
- The agent is proposing changes to a file it already changed the same way earlier.
- The agent contradicts a fact it stated 20 turns ago.
- The agent claims a tool is available that isn't listed.
- The agent starts suggesting the same next step it already tried.
- The operator asks "wait, are you confused?"

## When NOT to use

- The session is long but still coherent (long is fine; long + confused is the trigger).
- The operator is intentionally iterating and the redundancy is on purpose.
- The agent is asking clarifying questions, not repeating suggestions.

## The five decay signals

Run the checklist. Report which signals are present.

1. **Contradiction with earlier facts.** The agent stated X in turn 12, states not-X in turn 47, and does not notice.
2. **Forgotten constraints.** The operator gave a constraint at session start ("do not use em dashes"), the agent honored it early, and is now producing em-dashed prose.
3. **Loop spin.** The agent has proposed the same next step three times, each time framed as a new idea.
4. **Cargo-cult on a prior file.** The agent is proposing to modify a file that no longer exists, or copying a pattern from a file that was superseded two turns later.
5. **Hallucinated tool availability.** The agent proposes a tool call that isn't in the current tool list, or claims a tool is unavailable when it is.

## The recovery recommendation

Based on which signals are firing, recommend one of four moves:

- **Green — continue.** No signals firing. Session is healthy.
- **Yellow — compact.** One or two signals firing, and the work is not near a natural break. Run a context compaction (summarize the state, drop the raw tool outputs, continue).
- **Orange — handoff.** Three or more signals firing, or the work is near a natural break. Route to the `handoff` skill: write a HANDOFF doc, close this session, start fresh.
- **Red — full reset.** Signals firing and the operator is losing time correcting the agent faster than the agent is producing. Close the session. Start a new session with the HANDOFF doc as the sole context.

## Output shape

```
CONTEXT ROT CHECK

Signals firing:
- [signal 1]
- [signal 2]

Recovery: [Green | Yellow — compact | Orange — handoff | Red — full reset]

Recommended next skill: [context-management | handoff | none]
```

## Voice rules

- Terse. This is a diagnostic, not a therapy session.
- Do not apologize for the decay. Diagnose it. Recommend the move.
- Do not recommend Red unless the signals actually warrant it. Yellow and Orange handle most cases.

## Related skills

- `handoff` for when Orange or Red is the recommended move.
- `context-management` for the compaction move.
- `end-of-session-ritual` for the natural-break case.
