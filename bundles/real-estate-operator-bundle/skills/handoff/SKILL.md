---
name: handoff
description: "Hand off the current session or a specific slice of work to another person or another Claude session. Writes a briefing doc to a scratch location scoped for the receiver: what the work is, where it is, what's decided, what's open, what to do next. Requires a purpose argument that names the slice being handed off. Trigger phrases include 'hand this off', 'handoff to my TC', 'handoff to my transaction coordinator', 'handoff to my assistant', 'brief my team on this', 'brief my TC', 'brief my ISA', 'context dump for another agent', 'draft a handoff for', 'pass this to my broker', 'handoff to the lender', 'handoff to my staging vendor', 'hand this deal to another agent while I travel', 'need someone to pick this up'. Fires when a real estate agent is stepping away from work, delegating a slice, or handing off temporarily. Do NOT trigger without a purpose argument (ask what specifically is being handed off), when the agent is running a full weekly review (route to agent-weekly-review), or when the handoff is really a client-facing status update (route to transaction-milestones). Altitude is execution stage. Output is disposable and scoped: writes to a temp location the receiver reads once then discards. Borrowed from Matt Pocock's `/handoff` skill under MIT license. Adapted for real estate agent context (TCs, ISAs, brokers, vendors)."
---

LAST-VERIFIED: 2026-07-06. Source: Matt Pocock's `/handoff` skill in `mattpocock/skills` on GitHub (MIT license). Original design ported to real estate agent context. See `../references/handoff-origin.md` for full attribution.

Real estate agents work with a rotating team: transaction coordinators, inside sales assistants, brokers, lenders, title, showing assistants. Every handoff between the agent and a team member costs 10 minutes of context if the agent didn't leave a brief. This skill produces the brief.

Output is disposable. Written to a scratch location the receiver reads once. Do not archive.

## When to use

- Handing a live deal to a TC to run the paperwork.
- Delegating a showing sequence to a showing assistant while the agent travels.
- Passing a nurture cadence to an ISA to execute.
- Briefing a broker on a red-flag situation before escalation.
- Handing off temporarily during a vacation or personal time.

## When NOT to use

- Client-facing status update. Route to `transaction-milestones`.
- Weekly review. Route to `agent-weekly-review`.
- Without a purpose argument , always ask "what specifically are you handing off?" first.

## What you'll produce

```
HANDOFF BRIEF
Prepared by: {Agent name}
Handoff to: {Receiver name / role}
Slice: {Purpose argument in one line}
Date prepared: {YYYY-MM-DD}
Expected pickup by: {Date}

CONTEXT (30-second read)
{3 to 5 sentences on what the work is, who the client is, and the current state.}

DECISIONS ALREADY LOCKED
- {Item}: {What was decided.}

WHAT'S OPEN
- {Item}: {What needs to be resolved.}

WHAT TO DO NEXT
1. {Concrete action.}
2. {Concrete action.}
3. {Concrete action.}

ARTIFACTS AND LINKS
- {Contract PDF}: {location}
- {Buyer profile}: {location}
- {CRM record}: {location}
- {Client contact info}: {location}

CONSTRAINTS
- {Anything the receiver should not do.}
- {Anything time-sensitive.}
- {Anything sensitive to the client.}

WHEN TO CALL THE AGENT
- {Escalation triggers.}

SUGGESTED NEXT SKILLS FOR THE RECEIVER
- If the receiver needs to run the milestones: `transaction-milestones`.
- If the receiver needs to run follow-ups: `mls-follow-up`.
```

## Instructions

**Step 0. Lock the purpose argument.** If the agent did not specify what's being handed off, ask "what specifically are you handing off?" before writing anything. Also lock: receiver name and role, expected pickup date, whether this is a temporary handoff (agent will resume) or a full handoff (receiver owns it now).

State back. Get a nod.

**Step 1. Write the 30-second context.** 3 to 5 sentences. Assumes the receiver knows nothing about the deal.

**Step 2. List decisions locked.** Every material decision already made. Concrete. So the receiver doesn't re-litigate.

**Step 3. List what's open.** Every material item still unresolved. Prioritized.

**Step 4. Write what to do next.** 3 to 5 concrete actions in order. No aspirational language. Every item is a thing the receiver can start today.

**Step 5. List artifacts.** Concrete file paths, folder locations, CRM record IDs. Do not force the receiver to hunt.

**Step 6. Note constraints.** What the receiver should not do. Time-sensitive items. Client sensitivities.

**Step 7. Set escalation triggers.** When to call the agent. So the receiver doesn't over-escalate or under-escalate.

**Step 8. Write to a scratch location.** `handoffs/{YYYY-MM-DD}-{slice}.md` under the agent's HQ, or `/tmp/{slice}.md` for pure temp. Note in the response where the file lives.

## Examples

**Example 1.** Agent says "handoff the Ridgeway deal to my TC while I'm on vacation next week." Skill fires. Asks for TC name and vacation dates. Produces a brief covering the current milestone (inspection response deadline in 4 days), what to do (call the buyer, remind of deadline, submit response), and escalation triggers (broker call if seller counters the response).

**Example 2.** Agent says "brief my ISA on the nurture cadence for the 8 open house sign-ins from Sunday." Skill fires. Asks for the sign-in list. Produces a brief with a per-visitor customization guide.

**Example 3.** Agent says "hand this to my broker, I need her eyes on the contract." Skill fires. Asks what specifically to flag. Produces a brief scoping the contract review to the specific clause of concern.

## Composes with

- `transaction-milestones`. the receiver reads for deal detail.
- `mls-follow-up`. the receiver reads for the nurture sequence.
- `deal-doc-review`. sometimes bundled with a broker handoff.
- `hoard`. the receiver captures any new context back into the agent's vault.
