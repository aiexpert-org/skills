---
name: context-management
description: "Teach the operator when to compact, when to hand off, and when to start fresh. Diagnoses the state of the current session's context window, names the failure mode the operator is running into (dilution, clobber risk, dumb-zone), and recommends the right hygiene move. Trigger phrases include 'should I compact', 'context feeling stuck', 'start fresh', 'compact or handoff', 'context window running low', 'response quality dropping', 'Claude is getting dumber', 'this session is going sideways', 'do I compact this', 'do I start over', 'session getting long', 'context is full', 'losing the plot', 'help me manage this context', 'this chat is too long'. Use when the operator is in a long session and quality is drifting. Do NOT trigger at the start of a fresh session, when the operator has already picked a hygiene move, or for a routine handoff (route to `handoff`) or a routine close (route to `end-of-day-review`)."
---

LAST-VERIFIED: 2026-07-06. Source of truth: Matt Pocock's `/handoff` video walkthrough of the "smart zone / dumb zone" context-window pattern (~120K useful tokens before dilution), extended with the three hygiene moves (compact, handoff, start fresh) as a decision framework.

This skill teaches the operator to manage their context window with intent. Operators hear "1 million token context window" and assume they can pile years of company docs into one chat. The useful window is smaller than the advertised window. Somewhere around 120,000 tokens attention starts diffusing and answer quality drops. This is the "dumb zone" Matt Pocock names in his `/handoff` video. This skill diagnoses where the operator is, names the failure mode they are hitting, and recommends the right hygiene move.

Output: in-session recommendation only. Nothing written to disk unless the operator picks `handoff` and routes to that skill.

## The three hygiene moves

1. **Compact.** Built-in `/compact` (Claude Code) or "clear history but keep summary" (Claude Desktop). Summarizes the conversation and starts a new session with the summary prepended. Preserves memory but loses fine-grained state. Best for: session that has stayed on-topic and is just getting long.
2. **Handoff.** Peel off a specific sub-task into a separate session while the original session stays pure. Runs the `handoff` skill. Best for: session that has picked up a scope that would derail the original goal.
3. **Start fresh.** Full new session. Zero prior context. Best for: session that has picked up so much wrong-direction sludge that even a compact summary would be polluted, or when the original goal is done and a new goal is starting.

## When to use

- The operator says the session feels stuck or the answers are getting worse.
- The operator hits a natural sub-task fork ("also, while we're here, let me...").
- The operator wants to spawn a follow-up but does not know which move to run.
- The session has crossed 100K+ tokens and answer quality is drifting.

## When NOT to use

- The session is fresh and productive.
- The operator has already picked a move and just wants to execute it.
- The operator only wants a scoped handoff (route directly to `handoff`).
- The operator only wants a daily close (route to `end-of-day-review`).

## Instructions

**Step 0. Diagnose the state.** Ask three quick questions:

1. **Is the current session on-topic?** If yes, compact is viable. If no (scope has drifted), handoff or start fresh is better.
2. **Is there a specific sub-task the operator wants to peel off?** If yes, handoff is the move (route to `handoff`).
3. **Is the original goal of the session done?** If yes, start fresh is the move. If no, compact or handoff.

**Step 1. Diagnose the failure mode.** Which of these is the operator hitting?

- **Dilution.** Session is long. Answers are getting less crisp. Attention is spread thin across a long chronology. Recommendation: compact if on-topic, handoff if a sub-task is emerging.
- **Clobber risk.** Compact would summarize away important state (a specific decision, a specific file path, a specific number). Recommendation: handoff the sub-task, keep the current session intact.
- **Dumb zone.** Session has crossed the useful-window threshold. Answers are visibly worse. Recommendation: start fresh, hand off the important state via `handoff` first.
- **Scope drift.** Session started on X, has spent the last 45 minutes on Y. Recommendation: handoff Y to a fresh session, return current session to X.

**Step 2. Recommend the move.** Give one clear recommendation, not three options. Name the failure mode, name the move, name the trade-off.

**Step 3. If the recommendation is `handoff`.** Route to the `handoff` skill. Do not draft the handoff doc here.

**Step 4. If the recommendation is `compact`.** Tell the operator to run their surface's compact command (`/compact` in Claude Code, "Clear history but keep summary" in Claude Desktop). Warn them of anything that might get clobbered.

**Step 5. If the recommendation is `start fresh`.** Suggest running `handoff` first to preserve any state that would otherwise be lost, then open a new session.

## Output format

Short in-session response in this shape:

```
CONTEXT DIAGNOSIS

State: [on-topic / drifted / done]
Failure mode: [dilution / clobber risk / dumb zone / scope drift]
Approximate session size: [short / medium / long / very long]

RECOMMENDATION
[Move]: [one-sentence why]

TRADE-OFF
[What the operator loses with this move.]

NEXT STEP
[Concrete action: run `handoff`, run `/compact`, or open a new session.]
```

## Examples

**Example 1.** Operator says "should I compact this?" after a 4-hour Claude Code session. Skill fires. Diagnoses: on-topic, long, dilution. Recommends compact. Warns that the exact file paths from earlier may need to be re-shared.

**Example 2.** Operator says "context feeling stuck, Claude keeps getting the pricing wrong." Skill fires. Diagnoses: scope drift plus dumb zone. Recommends `handoff` the pricing thread to a fresh session with only the pricing docs loaded, then start fresh on the current session.

**Example 3.** Operator says "start fresh, this session is going sideways." Skill fires. Diagnoses: dumb zone. Recommends running `handoff` first on any open decisions, then opening a new session. Delivers the handoff prompt.

## Composes with

- `handoff`. the actual handoff doc writer, invoked when handoff is the chosen move.
- `end-of-day-review`. sometimes the right hygiene move at the end of a long day is just close the day.
- `claude-md-hygiene`. if the same context problem keeps happening, the fix is often in CLAUDE.md.

## Credit

The "smart zone / dumb zone" framing comes from Matt Pocock's `/handoff` video walkthrough at [aihero.dev](https://aihero.dev). Matt's stated personal threshold is ~120K tokens before dilution kicks in on Claude Code sessions.
