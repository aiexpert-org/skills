---
name: deal-doc-review
description: "Review a real estate contract, addendum, or listing agreement and produce an agent-side risk read. Flags what's standard, what's non-standard, what to raise with the client before signing, and which negotiation levers are still on the table. Trigger phrases include 'review this contract', 'review the purchase agreement', 'check this addendum', 'purchase agreement review', 'listing agreement review', 'spot the traps', 'what should I flag in this contract', 'is anything unusual in this offer', 'red flags in this addendum', 'client is about to sign, anything I'm missing', 'walk me through this contract', 'what should my client know before signing', 'anything to negotiate on this', 'counter-offer prep'. Fires for purchase agreements, counter-offers, addendums, listing agreements, buyer representation agreements, and disclosure documents. Do NOT trigger when the transaction is already under contract and needs milestone tracking (route to transaction-milestones), when the agent needs to draft a new agreement from scratch, or when the question is a pure legal opinion (surface the disclaimer that this is an agent-side risk read, not legal advice). Altitude is execution stage. Output is an in-session brief plus, optionally, an annotated markdown copy of the doc saved to a contracts scratch folder. This skill NEVER signs anything, submits anything, or transmits documents. Human-in-the-loop always."
---

LAST-VERIFIED: 2026-07-06. Source: BNB AI Solutions agent workflow patterns, standard NAR contract templates (Form 21 in WA, TREC in TX, CAR RPA in CA, and other state-standard forms). Re-verify against local board forms if the agent's market form changes.

Real estate agents miss risk in contracts because they read hundreds and pattern-match. The unusual clause hides in plain sight. This skill runs a systematic read on the doc, flags what's off-pattern, and hands the agent talking points for the client conversation.

Output is in-session by default. Optional archive to `contracts/{buyer-or-property}/YYYY-MM-DD-{doc-type}.md` if the agent wants a record.

**Explicit disclaimer.** This skill produces an agent-side risk read. It does not give legal advice. Complex or unusual clauses should be routed to the agent's broker, transaction coordinator, or a real estate attorney.

## When to use

- Any purchase agreement or counter-offer landing in the agent's inbox before it goes to the client.
- Listing agreements before sending to a seller.
- Addendums proposed by the other side.
- Buyer representation agreements or exclusive buyer agency agreements.

## When NOT to use

- Already-under-contract deals that need milestone tracking. Route to `transaction-milestones`.
- Drafting a new agreement from scratch. This skill reads, does not write from zero.
- Pure legal opinions. Route to counsel.

## What you'll produce

```
CONTRACT RISK READ
Doc: {Type}
Property: {Address}
Parties: {Buyer / Seller}
Date reviewed: {YYYY-MM-DD}

ONE-LINE SUMMARY
{What this doc is and its net position.}

STANDARD CLAUSES CONFIRMED
{Yes/no on the standard elements the agent expects: purchase price, closing date, inspection period, financing contingency, appraisal contingency, earnest money, title, etc.}

NON-STANDARD OR UNUSUAL LANGUAGE
- {Clause or paragraph}: {What's unusual.} {What it means for the client.}
- {Add rows as needed.}

WHAT TO RAISE WITH THE CLIENT BEFORE SIGNING
- {Item}: {Client-facing explanation in plain language.}

NEGOTIATION LEVERS STILL AVAILABLE
- {Lever}: {How to use it.}

DEADLINES AND DATES TO TRACK
- {Date}: {What's due.}
- {Add rows as needed.}

QUESTIONS TO ASK THE OTHER SIDE
- {Question}: {Why.}

RED FLAG SUMMARY
{None / Minor / Moderate / Escalate to broker or attorney.}

SUGGESTED NEXT SKILLS
- Signed? Move to `transaction-milestones` to run the deal to close.
- Need to draft the counter? Route to a counter-offer skill or run this again on the counter.
```

## Instructions

**Step 0. Lock four things.**
1. **Document type.** Purchase agreement, counter, addendum, listing agreement, BRA, disclosure. Confirm.
2. **Agent side.** Buyer's agent or listing agent. This changes what "your client" means and which levers matter.
3. **Doc source.** Ask the agent to paste the doc text or attach the file. If neither, ask for the key terms and note the review is partial.
4. **State or market.** Different states use different standard forms. Confirm so the "standard clauses" check compares against the right template.

State the four back. Get a nod.

**Step 1. Run the standard-clauses check.** Walk the doc against the standard-form checklist for the state. Confirm each expected element is present (purchase price, closing date, inspection period, financing contingency, appraisal contingency, title, earnest money, disclosures). Flag anything missing.

**Step 2. Scan for non-standard language.** Any clause that deviates from the state standard form. Any handwritten or added language. Any addendum that changes a default. Any unusual timeline. Any unusual contingency wording.

**Step 3. Translate to client-facing language.** For each non-standard item and each risk flag, write a plain-English explanation the agent can use with the client. No legalese. No hedging.

**Step 4. Identify negotiation levers.** For each material term, note whether it's still negotiable, what the counterparty might accept, and what the agent's opening move should be.

**Step 5. List deadlines.** Every date the doc creates: inspection deadline, financing deadline, appraisal deadline, walkthrough window, closing date. Format as a punch list the agent can drop into their calendar or pass to `transaction-milestones`.

**Step 6. Rate the red flag summary.** None (proceed), Minor (raise with client and proceed), Moderate (raise with broker before signing), Escalate (attorney review before proceeding).

## Examples

**Example 1.** Agent says "review this purchase agreement, my client is about to sign." Skill fires. Asks for state and side. Runs the checklist. Flags a non-standard 5-day inspection period (state standard is 10). Recommends counter to 10.

**Example 2.** Agent says "any red flags in this addendum?" Skill fires. Asks doc source. Reads addendum. Flags that it waives the appraisal contingency without adjusting the price. Recommends the client understand the waiver before signing.

**Example 3.** Agent says "counter-offer prep, what levers do I have?" Skill fires. Reads the offer. Identifies price, closing date, contingency length, and earnest money as the four movable levers. Suggests opening positions.

## Composes with

- `transaction-milestones`. runs the deal from signed contract to close.
- `showing-prep`. sometimes runs before a re-showing tied to a counter negotiation.
- `handoff`. hand the contract read to the broker or attorney for higher-level review.
