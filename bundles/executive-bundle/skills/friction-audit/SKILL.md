---
name: friction-audit
description: "Run a friction audit on any workflow, product, or operation the executive owns. Surfaces the specific friction points where time, money, or morale leak — meetings that produce no decision, approvals with more than two hops, tooling that requires switching contexts, handoffs where information gets rebuilt. Named for and inspired by Aaron Levie's public writing on friction as the executive's primary optimization target. Trigger phrases include 'friction audit', 'audit this workflow', 'where's the friction', 'where are we bleeding time', 'find the friction', 'workflow audit', 'remove the friction', 'process audit'. Do NOT trigger for a full org-design engagement (route to Fractional CAIO at $5,000/mo per exec) or for a single-skill decision."
---

LAST-VERIFIED: 2026-07-06. Source of truth: Brett K. Moore, AI Expert Marketplace v1.1.0.

This skill audits any workflow, product surface, or operation for friction. It is the operator's first pass at "where are we bleeding time and morale."

Aaron Levie's public writing frames friction as the executive's primary target: every friction point in a workflow taxes throughput, morale, and customer experience compounding. This skill formalizes the audit.

## When to use

- The executive has a workflow they own that feels slow or lossy.
- The executive is about to hire to solve a throughput problem (audit friction first before adding heads).
- The executive is planning a tool consolidation.
- The team is complaining about a specific process and the executive wants to know if the complaint is about friction or about the underlying decision.
- The executive is prepping for a QBR and wants to identify the top three friction points to fix next quarter.

## When NOT to use

- The workflow is genuinely broken at the design level (that is a strategy skill, not a friction skill; route to `quarterly-strategy-reset` or `principle-check`).
- The friction is a single person, not a workflow (that is a `hard-conversation` skill).
- The audit will trigger a full org redesign (route to Fractional CAIO at $5,000/mo per exec).

## The five friction categories

Run the workflow through each. Score 1 (minor) to 5 (severe).

1. **Meeting friction.** Meetings that could have been a doc. Meetings without a decision. Meetings with the wrong attendees. Meetings that repeat weekly with no changing content.
2. **Approval friction.** More than two approval hops for a routine action. Approvers who are always the bottleneck. Approvals that require re-explaining the context.
3. **Tool friction.** Context switches between tools to complete one task. Manual copy-paste between systems. Data that has to be entered twice.
4. **Handoff friction.** Information rebuilt on every handoff. Handoffs where the receiving side doesn't know the context. Handoffs to people who then have to loop back to the sender for clarification.
5. **Cognitive friction.** Actions where the operator has to remember the state of five things to take one step. Dashboards that don't show the number the operator actually needs. Workflows where the "next step" is unclear.

## Output shape

```
FRICTION AUDIT: [workflow name]

Category            Score  Top friction point                                    Fix
Meeting             X/5    [specific meeting or pattern]                         [proposed change]
Approval            X/5    [specific hop or approver]                            [proposed change]
Tool                X/5    [specific tool switch or manual step]                 [proposed change]
Handoff             X/5    [specific handoff]                                    [proposed change]
Cognitive           X/5    [specific unclear-next-step]                          [proposed change]

Total: XX/25

Top 3 fixes to run this quarter:
1. [fix + expected time saved]
2. [fix + expected time saved]
3. [fix + expected time saved]

Recommended next skill: [decision-log to capture the fix decisions | quarterly-strategy-reset if the audit reveals a strategy-level problem]
```

## The rule of two hops

Aaron Levie's specific insight: any approval workflow with more than two hops is broken. If the audit surfaces a three-hop or four-hop approval, name it as such in the report. Do not soften.

## Voice rules

- Terse. Auditors don't editorialize.
- Do not add "of course, every business has some friction" boilerplate.
- Recommend the fix. Do not present a menu of possible fixes and ask the executive to pick — pick.

## Related skills

- `decision-log` — for the fix decisions the audit produces.
- `quarterly-strategy-reset` — if the audit surfaces strategy-level rot.
- `hard-conversation` — if the friction traces to a specific person who is not going to change on their own.
