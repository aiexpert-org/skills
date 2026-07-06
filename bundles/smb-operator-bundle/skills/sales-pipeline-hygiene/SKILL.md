---
name: sales-pipeline-hygiene
description: "Run the weekly pipeline hygiene pass on the operator's CRM. Scans open deals in GHL or HubSpot, surfaces deals past their stage SLA, drafts a next action for each stuck deal, flags deals to nurture versus kill, and estimates the quarter-close forecast. Trigger phrases include 'check my pipeline', 'stale deals', 'deals that need attention', 'pipeline hygiene', 'pipeline review', 'quarterly close forecast', 'clean up my CRM', 'audit the pipeline', 'what's stuck in my pipeline', 'which deals are dying', 'run pipeline hygiene', 'sales review', 'sales hygiene', 'pipeline check'. Use when the operator is running the weekly or monthly sales operating rhythm. Do NOT trigger when the operator is trying to close one specific deal (route to that deal's specific context), when the operator is asking for a full CRM data-migration (route to CRM admin work), or when no CRM is connected."
---

LAST-VERIFIED: 2026-07-06. Source of truth: AI Expert operator playbook for weekly sales rhythm.

This skill turns a messy pipeline into a punch list of moves. Most SMB operators check their pipeline once a quarter and realize half the deals died months ago. Weekly hygiene fixes that. Output is a short digest showing which deals need a nudge, which need a nurture, and which need to be killed off the board.

Output delivered as a chat digest. Optionally written to `pipeline-reviews/YYYY-MM-DD.md`.

## When to use

- Weekly sales rhythm (Monday morning or Friday close).
- Before a monthly one-on-one with a sales lieutenant.
- Before a quarter close when the operator wants a realistic forecast.

## When NOT to use

- The operator wants deep help closing one specific deal. Load that deal's file instead.
- The operator has no CRM. Surface the gap; do not invent deals.
- The operator wants a data migration or CRM admin work. That is a different job.

## What you'll produce

```
PIPELINE HYGIENE
[Date]

STUCK DEALS ([N])
- **[Deal name / contact]:** [stage] for [X days], SLA breach. [Suggested next action.]

NURTURE QUEUE ([N])
- **[Deal name]:** cold but not dead. [Suggested light-touch move.]

KILL LIST ([N])
- **[Deal name]:** [reason to close-lost]. [Suggested close-lost note.]

QUARTER-CLOSE FORECAST
- Weighted pipeline: $[X]
- 80%+ probability: $[X]
- New deals needed to hit target: [N]

SUGGESTED NEXT SKILLS
- Want me to draft the follow-up emails? Run `ghost-writer-me`.
- Want to lock the kill-list decisions? Run `decision-log`.
```

## Instructions

**Step 0. Lock four things.**
1. **The CRM source.** Connected GHL, HubSpot, Pipedrive, or a spreadsheet.
2. **Stage SLAs.** Default: qualifying = 14 days, proposal = 21 days, negotiation = 30 days. Operator can override.
3. **Today's date.** Run `date +%Y-%m-%d`.
4. **Weighted probabilities.** Default: qualifying 10%, proposal 30%, negotiation 60%, verbal 80%, closed-won 100%.

**Step 1. Read the pipeline.** Pull every open deal. For each: current stage, days in stage, deal value, last activity date.

**Step 2. Bucket the deals.**
- **Stuck:** past stage SLA and no activity in 14 days. Needs a nudge.
- **Nurture:** no clear path to close but the buyer is real. Light touch keeps it warm.
- **Kill:** the deal is dead or the buyer went dark 60+ days ago. Close-lost with a reason.

**Step 3. Draft the digest.** One line per deal in each bucket. Suggested action must be concrete. Not "follow up." Instead: "Send the ROI worksheet you promised on May 3."

**Step 4. Run the forecast math.** Sum weighted pipeline. Sum 80%+ probability. Compare to the operator's target. State how many new deals at the average deal size are needed to hit target.

**Step 5. Offer next moves.** Draft the follow-ups? Lock the kill list as a decision? Update the CRM stages to reflect reality?

## Examples

**Example 1.** Operator says "pipeline hygiene, we're two weeks from quarter close." Skill fires. Pulls 34 open deals. Flags 8 stuck, 12 nurture, 4 to kill. Forecast shows $180K weighted vs $250K target; recommends 4 new proposals this week to close the gap.

**Example 2.** Operator says "check my pipeline, feels like a lot of dead weight." Skill fires. Focuses on the kill list first. Delivers close-lost notes for each dead deal in the operator's voice.

**Example 3.** Operator says "which deals are stale in HubSpot?" Skill fires. Filters to deals past SLA. Returns stuck list only.

## Composes with

- `ghost-writer-me`. drafts the nudge and close-lost messages in operator voice.
- `decision-log`. locks the kill decisions.
- `weekly-review`. pipeline hygiene is one segment of the full weekly review.
