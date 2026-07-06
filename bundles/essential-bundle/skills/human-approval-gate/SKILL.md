---
name: human-approval-gate
description: "Insert an explicit human approval checkpoint before Claude executes any irreversible action (payments, publishing, sending, deletes, contract signatures, credential entry). Follows Anthropic's default posture that agentic actions with real-world consequences require human confirmation. Trigger phrases include 'ask before sending', 'confirm before publishing', 'gate this action', 'approval checkpoint', 'need my okay before', 'don't send without asking', 'human-in-the-loop', 'require confirmation'. Also invoke implicitly whenever the agent is about to take an irreversible action and no explicit approval has been given. Do NOT trigger for read-only research, drafting, or exploration where nothing is being sent, saved to production, or charged."
---

LAST-VERIFIED: 2026-07-06. Source of truth: Brett K. Moore, AI Expert Marketplace v1.1.0.

This skill inserts a human approval gate before any irreversible action. It is the Anthropic-default posture for agentic work: draft freely, ship on confirmation.

Anthropic's guidance on agentic Claude is explicit. Actions that touch the outside world (send email, post to social, charge a card, delete data, execute a trade, sign a contract, run a database mutation, deploy code to production) require a human-in-the-loop confirmation before execution. This skill formalizes that posture as a checkpoint the operator can insert anywhere in a workflow.

## When to use

- Claude is about to send an email or message on the operator's behalf.
- Claude is about to publish a blog post, social post, or page.
- Claude is about to charge a card, issue a refund, or move money.
- Claude is about to delete a file, drop a table, or remove a customer record.
- Claude is about to accept terms of service, create an account, or enter a password.
- Claude is about to merge a pull request to a production branch or run a deploy.
- Claude is about to sign or countersign a contract, SOW, or affiliate agreement.
- The operator has said "gate this," "confirm before," or "ask before."

## When NOT to use

- Claude is doing read-only research or exploration.
- Claude is drafting a document to a scratch or temp location.
- Claude is filling out a form the operator will review before submit.
- The operator has explicitly pre-authorized the action for this session ("go ahead and send all six").

## The checkpoint pattern

Before the irreversible action, Claude produces a **preview** of exactly what it is about to do, then pauses for explicit confirmation.

```
APPROVAL REQUIRED

Action: [one-line description]
Target: [system, recipient, URL, account, file path]
Reversible: [yes | no | partial — describe]
Preview:
  [exact content, exact API call, exact SQL, exact recipient list]

Reply YES to proceed, NO to cancel, or EDIT with changes.
```

The operator responds. Claude either executes on YES, cancels on NO, or applies changes on EDIT.

## The three approval tiers

- **Tier 1 — Always gate.** Payments, deletes, deploys, contract signatures, credential entry, account creation, sending on the operator's behalf.
- **Tier 2 — Gate by default, batch-approvable.** Email sends, social posts, marketing publishes. The operator can pre-approve a batch ("go ahead and send all six of the drafts") which lifts the gate for that batch only.
- **Tier 3 — Notify but don't gate.** Read-only tool calls, drafts to scratch locations, calendar invites the operator will review.

## Voice rules

- Preview blocks are terse. Exact content, no persuasion.
- Do not argue for the action inside the preview. If Claude thinks the action is wrong, cancel it and surface the concern separately.
- Do not proceed on ambiguous replies ("sure I guess"). Require an unambiguous YES.

## The escape hatch

If the operator says "just do it, stop asking me every time" and the action is Tier 2, batch-approve for the session. If Tier 1, respond: "I'm not able to skip the checkpoint on this — [payments / deletes / contract signatures] always require an explicit yes. Reply YES to proceed."

## Related skills

- `context-management` for when to compact vs handoff.
- `install-anthropic-defaults` for the full Anthropic default posture install.
- `decision-log` for capturing a permanent choice about which actions get gated at which tier.
