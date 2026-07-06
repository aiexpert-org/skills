---
name: investor-update
description: "Draft a monthly investor update in the operator's voice, using the standard format that Jason Lemkin, OpenView, and most Y-Combinator-trained founders converged on. Pulls this month's results, next month's plan, key risks, and any asks the operator wants to surface. Output goes to a disposable session-scoped path; the executive polishes and sends from their own email client. Trigger phrases include 'monthly investor update', 'investor letter', 'shareholder update', 'board note', 'draft investor comms', 'draft the investor update', 'investor email', 'time for the monthly update', 'it is investor update day', 'need to send the investors a note', 'update the investors', 'send an update to the cap table', 'the monthly investor', 'draft this month for the cap table'. Also invoke implicitly at the end of a month when the executive has not yet drafted the update. Do NOT trigger during an active fundraise (fundraise updates follow a different pattern and should be routed to a separate skill), when the operator's voice corpus has not been captured yet (route to voice-corpus-builder first, if installed), or when the operator explicitly says they will draft it themselves and just wants review coaching."
tools: Read, Write
---

LAST-VERIFIED: 2026-07-06. Source of truth: Jason Lemkin's monthly-investor-update SaaStr posts, OpenView Partners investor-update template, the archetype format cited across the operator-CEO writing community, Brett K. Moore's operating rhythm. Re-verify if the standard template shifts.

This skill drafts a monthly investor update in the operator's voice. The output is an email-ready Markdown document with subject line, greeting, five to seven standard sections, and a signature block. The executive reviews, edits, and sends from their own email client.

Output goes to a disposable session-scoped path: `~/tmp/investor-update-<YYYY-MM>.md`. The operator's canonical archive of past updates is separate; the skill does not write there directly.

## Step 0: Confirm the four intake items

1. **The reporting month.** October 2026, or whatever period the update covers. Confirm.
2. **The distribution list.** Full cap table, just lead investors, board plus observers. This determines what disclosure level the draft assumes.
3. **This month's numbers.** MRR, ARR, cash, runway, headcount, hires closed, hires open, product ships, customer wins, customer losses. Ask for what the operator has. Do not fabricate.
4. **What the operator is currently thinking about.** The strategic thread running under the numbers. This is the section that separates a professional update from a template fill-in.

If any are missing, ask. If the operator does not have current numbers, hold the draft until they do; a fabricated number in an investor update is the single fastest way to lose credibility.

## Standard section shape

Every monthly update built by this skill has the same shape. The shape is boring on purpose; investors read many of these and the standardized structure is a feature, not a bug.

**Subject line.** `[Company Name] Monthly Update, [Month YYYY]`. Simple. Searchable. Filed in seconds.

**Opening (2 to 3 sentences).** The single most important thing this month. If the investor reads only the opening, they should walk away knowing the one thing that matters.

**Section 1: Key metrics.** MRR, ARR, growth rate, cash on hand, runway, headcount. Compared to prior month and to plan. Numbers in a small table if the operator's email tool supports it, otherwise inline.

**Section 2: Wins.** Two to five bullets. Customer signs, product ships, hires closed, strategic partnerships. Specific.

**Section 3: Losses and hard things.** Two to five bullets. Customer churn, deals lost, hires missed, launches slipped, hard decisions made. Honest.

**Section 4: What is on my mind.** Two to four paragraphs. This is the strategic-thinking-out-loud section. The bet the operator is considering, the market shift they are watching, the trade-off they are weighing. Investors read this section first after the opening; it is what makes them useful advisors instead of passive scorekeepers.

**Section 5: Asks.** Named, specific. Introductions to X, opinions on Y, warm intros to Z investors for the next round. If there are no asks, say "no asks this month" and skip.

**Signature block.** The operator's name and role. Plus a short close ("thanks for the support," "grateful as always," in the operator's actual voice, not a form phrase).

## Output format

Return a Markdown document in this shape:

```
Subject: [Company Name] Monthly Update, [Month YYYY]

Hi all,

[Opening, 2 to 3 sentences.]

**Key metrics**

| Metric | This month | Last month | vs plan |
|---|---|---|---|
| ARR | [$X] | [$Y] | [+/-Z%] |
| MRR growth | [+X%] | [+Y%] | [+/-Zpp] |
| Cash | [$X] | [$Y] | [runway note] |
| Headcount | [X] | [Y] | [open reqs] |

**Wins**
- [bullet]
- [bullet]

**Losses and hard things**
- [bullet]
- [bullet]

**What is on my mind**

[Two to four paragraphs of strategic-thinking-out-loud.]

**Asks**
- [Specific ask, or "no asks this month"]

Thanks,
[Operator name]
[Role, Company]
```

## Voice rules for the draft

The draft is in the operator's voice. If a voice corpus is available (from `voice-corpus-builder` or an equivalent skill installed on the operator's system), read the corpus and match cadence. If not, default to conversational and confident, no em dashes, no banned vocabulary.

Investors read many updates. The ones they remember have a distinctive voice and are honest about hard things. The template-shaped ones blend in and get skimmed.

## Sensitive material discipline

If the update names specific customers, specific deal sizes, litigation, competitive threats, or employee-departure details, flag at the top: `SENSITIVE MATERIAL, RESTRICT TO INVESTORS UNDER NDA.` The operator decides distribution; the skill does not auto-send.

If the operator's cap table includes both investors under NDA and observers not under NDA, draft two versions: a full version for NDA'd investors and a redacted version for observers. Name both files distinctly in the output.

## Fabrication rule

Never fabricate a number. If the operator did not give you MRR, do not invent MRR. If a number is missing, mark it `[TBD]` and list it in a "missing before send" block at the bottom of the draft.

## When to invoke

Invoke at the end of a reporting month. Invoke when the operator asks for the monthly update draft. Invoke implicitly when the operator names the current month in passing and has not yet drafted an update.

## When NOT to invoke

Do not invoke during an active fundraise; the fundraise-update pattern is different. Do not invoke if the operator has not run a voice corpus and prefers not to. Do not invoke when the operator says they will draft it themselves.

## Companion skills

Runs after `voice-corpus-builder` (if installed) so the draft matches the operator's cadence. Precedes `ghost-writer-me-exec` for polish on any sensitive section. Feeds into `principle-check` if the "what is on my mind" section is exposing a decision the operator is about to lock.
