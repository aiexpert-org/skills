---
name: transaction-milestones
description: "Run a real estate transaction from mutual acceptance to close. Maintains the milestone checklist (inspection period, appraisal, loan approval, disclosures, title, walkthrough, closing), drafts the status update to the client at each milestone, and sets calendar reminders for every deadline window. Trigger phrases include 'transaction status', 'transaction milestones', 'milestone check', 'where are we on this deal', 'update on the deal', 'close date update', 'client status update', 'send a status update to the buyer', 'send a status update to the seller', 'inspection deadline coming up', 'appraisal is due', 'loan contingency date', 'walkthrough scheduled', 'closing in X days', 'run the milestone check on my active deals'. Fires per-deal or as a portfolio roll-up across all active transactions. Do NOT trigger when the deal is not yet under contract (route to deal-doc-review), when the transaction is closed (route to referral-tracking for the referral thank-you), or when the agent is asking a pure legal question about a contract clause. Altitude is execution + tracking stage. Output is permanent: writes to a transaction log per deal and drops calendar reminders. Client-facing messages are drafts; the agent sends them, not the skill."
---

LAST-VERIFIED: 2026-07-06. Source: BNB AI Solutions Producer Pack (Tuesday client update automation), standard real estate transaction cadences, and typical mutual acceptance to close timelines (25 to 45 days).

Real estate transactions die in the gap between mutual acceptance and closing. Buyers ghost their agent because they got no updates. Sellers panic because they don't know if the loan cleared. This skill runs the transaction like a project manager: every milestone tracked, every client kept warm.

Output is permanent. Per-deal log at `transactions/{address-or-buyer}/log.md`. Milestone reminders written to a calendar file the agent syncs with Google Calendar or GHL calendar.

## When to use

- Every new deal, immediately after mutual acceptance.
- Any milestone hit or approaching (48-hour lookahead).
- Any deal that has gone quiet and the agent isn't sure what's next.
- Portfolio roll-up when the agent has 3+ deals in play.

## When NOT to use

- Deal is not yet under contract. Route to `deal-doc-review`.
- Deal already closed. Route to `referral-tracking` to log the thank-you.
- Pure legal question. Route to counsel or the broker.

## What you'll produce

For a single deal:

```
TRANSACTION STATUS
Property: {Address}
Client(s): {Buyer or Seller}
Under contract: {Date}
Close date: {Date} ({N days from today})

MILESTONE CHECKLIST
- [x] Mutual acceptance ({date})
- [x] Earnest money delivered ({date, amount})
- [ ] Inspection ({deadline, N days from today})
- [ ] Inspection response deadline ({date})
- [ ] Financing contingency ({deadline})
- [ ] Appraisal ordered / completed ({status})
- [ ] Title report reviewed ({status})
- [ ] Disclosures signed ({status})
- [ ] Loan approval ({status})
- [ ] Final walkthrough ({date})
- [ ] Closing ({date})

WHAT'S DUE IN THE NEXT 7 DAYS
- {Item}: {Date}. {Client action / agent action.}

WHAT'S OVERDUE OR AT RISK
- {Item}: {Days overdue.} {Recovery move.}

CLIENT UPDATE DRAFT (send today)
{3-to-5-sentence status update in agent voice. What's done, what's next, when to expect the next update.}

CALENDAR REMINDERS TO SET
- {Date, time}: {Reminder}
- {Add rows as needed.}

SUGGESTED NEXT SKILLS
- Deal at risk? Run `deal-doc-review` on the disputed clause.
- Deal closing this week? Run `referral-tracking` to prep the referral thank-you.
```

For a portfolio roll-up:

```
ACTIVE TRANSACTIONS ({N deals})
- {Address}: {Days to close}. Next milestone: {item, date}. Status: {green / yellow / red}.

RED-STATUS DEALS
- {Address}: {What's wrong.} {Recovery move.}

CLIENT UPDATES DUE THIS WEEK
- {Client}: {Milestone that triggers update.}
```

## Instructions

**Step 0. Lock four things.**
1. **Deal identity.** Address, buyer/seller name, mutual acceptance date, close date.
2. **Contract terms.** Purchase price, inspection period, financing contingency window, appraisal deadline, disclosures owed.
3. **State or market.** Different states have different milestone defaults.
4. **Today's date.** Run date verification.

State back. Get a nod.

**Step 1. Build or refresh the milestone checklist.** From contract terms, compute every deadline. If the transaction log already exists, compare current state to expected and flag drift.

**Step 2. Identify what's due next 7 days.** Any milestone with a deadline in the next 7 calendar days. Note the responsible party (client vs agent vs lender vs title). Draft the specific ask if action is needed.

**Step 3. Identify what's overdue or at risk.** Any milestone past its deadline or trending late. For each, propose a recovery move (call the lender, extend the inspection response, escalate to the other agent).

**Step 4. Draft the client update.** Agent voice. 3 to 5 sentences. What's complete, what's next, when the next update lands. Do not oversell certainty. Match voice corpus if available.

**Step 5. Write the calendar reminders.** Concrete dates and times. Format for Google Calendar import or GHL calendar drop.

**Step 6. Offer next moves.** Send the client update now (agent copies and pastes)? Add the calendar reminders? Roll up all active deals?

## Examples

**Example 1.** Agent says "milestone check on 823 Main." Skill fires. Reads the transaction log. Notes inspection deadline is in 4 days, buyer hasn't scheduled the inspector yet. Flags red. Drafts a client message asking the buyer to schedule today.

**Example 2.** Agent says "client status update for the Ridgeways." Skill fires. Reads the log. Drafts a 4-sentence update: financing cleared today, appraisal ordered, walkthrough on the 12th, close on the 15th.

**Example 3.** Agent says "where are we on all my deals." Skill fires. Runs portfolio roll-up. Flags 2 green, 1 yellow (loan late), 1 red (inspection response overdue by 2 days).

## Composes with

- `deal-doc-review`. invoked mid-transaction if a disputed clause or addendum lands.
- `referral-tracking`. invoked at close to log the referral source thank-you.
- `agent-weekly-review`. pulls transaction status into the weekly view.
- `mls-follow-up`. invoked after close for the client-side long nurture.
