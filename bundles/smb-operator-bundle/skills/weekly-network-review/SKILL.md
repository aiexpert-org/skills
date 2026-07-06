---
name: weekly-network-review
description: "Run the weekly relationship review on the operator's contact list. Loads the operator's contacts (GHL, HubSpot, a spreadsheet, or a Markdown CRM), surfaces contacts who have gone cold, contacts who owe a response, birthdays and anniversaries in the next 14 days, and open follow-ups. Produces a 5 to 10 person reach-out list with a one-line reason for each. Trigger phrases include 'weekly network review', 'weekly review', 'who should I reach out to', 'who's gone cold', 'who's gone dark', 'who owes me what', 'reach-out list', 'follow-up queue', 'Sunday review', 'Monday planning', 'relationship review', 'reconnect list', 'dormant contacts', 'quarterly touchpoint audit'. Use when the operator is setting up their week and wants a scannable punch list of people to touch. Do NOT trigger when the operator is mid-execution on one specific relationship, when the operator is asking for a single cold intro to a stranger (route to cold-outreach-discipline instead), or when the operator has no contact list connected."
---

LAST-VERIFIED: 2026-07-06. Source of truth: adapted from Brett K. Moore's `System/skills/weekly-network-review/SKILL.md` in the Brett K Moore HQ vault. Re-verify against the source skill if Brett's convention updates.

This skill turns a decaying contact list into a warm operating network. Small business owners lose deals not because their pitch is wrong but because their relationships go cold. The weekly review is the ritual that fixes that. It scans the contact list, flags what has decayed, and hands back a small, owned punch list the operator can actually execute in a week.

Output is delivered as a chat digest and, optionally, written to `network-reviews/YYYY-MM-DD.md` under the operator's home directory or Drive folder if the operator wants an archive.

## When to use

- Sunday evening or Monday morning weekly planning.
- Any time the operator says "who am I forgetting to reach out to."
- Before the end of a quarter to run a quarterly touchpoint audit.

## When NOT to use

- The operator wants help writing one cold email to a stranger. Route to `cold-outreach-discipline`.
- The operator is in the middle of an active deal and needs one-off relationship advice.
- The operator has no CRM, no spreadsheet, and no Markdown contact list. Surface the gap and offer to scaffold one; do not invent contacts.

## What you'll produce

A single-message digest in this shape:

```
WEEKLY NETWORK REVIEW
[Date]

REACH-OUTS THIS WEEK ([N] contacts)
- **[Name]:** [days cold / owed action / birthday note]. [Suggested move]. [Owed by date if any.]

ALSO-RANS ([N] contacts; pull if budget allows)
- [Name, one-phrase reason]

DATA GAPS ([N] contacts)
- [Name, why the CRM can't tell if they're cold]

NETWORK HEALTH NOTE
[One line: overall state of the network this week.]

SUGGESTED NEXT SKILLS
- Want me to draft each reach-out in your voice? Run `ghost-writer-me`.
- Want to log a decision that surfaced during this review? Run `decision-log`.
```

Digest fits on one screen. Reads in under 90 seconds.

## Instructions

**Step 0. Lock four things before reading anything.**
1. **The contact source.** Ask the operator where their contacts live. Check in this order: (a) a connected GHL / HubSpot MCP, (b) an exported CSV, (c) a `network.md` file in their HQ, (d) a Google Sheet. If none, surface the gap and offer to scaffold a starter file.
2. **The cadence convention.** Ask the operator how they think about touch frequency. If no answer, default to: weekly = active clients, monthly = referral partners, quarterly = warm network, annual = loose ties. Cold = past the threshold by 30+ days.
3. **Today's date.** Run `date +%Y-%m-%d` to verify. Never infer.
4. **Punch list size.** Default 5 to 10 reach-outs. Cap can be raised or lowered per operator preference.

State the four back to the operator. Get a nod before reading.

**Step 1. Read the contact list and compute decay.** Walk every contact. For each: days since last touch, decay bucket (green / yellow / red), any inbound flag (they reached out and got no reply), any birthday or anniversary in the next 14 days, any open follow-up action.

**Step 2. Draft the punch list.** Priority order:
1. Inbound owed responses (they reached out; you never replied).
2. Contacts gating an active deal or project this week.
3. Birthday / anniversary watches with dates in the next 14 days.
4. Red-bucket decay (worst decay first).
5. Yellow-bucket decay fills remaining slots.

Each line: name, reason, suggested move, owed-by date if any. Under 30 words per line.

**Step 3. Add also-rans and data gaps.** Also-rans are yellow-bucket contacts that did not make the list. Data gaps are contacts missing last-touch dates or cadence categories. Both lists short.

**Step 4. Add the health note.** One line on the overall state. Examples: "Network is warm; three red decays this week, all manageable." "Network has 14 red decays accumulating; recommend a longer push this week."

**Step 5. Offer next moves.** Draft the outreach in the operator's voice? Update the CRM's next-action fields? Schedule a Friday check-in on what landed? Operator picks zero, one, or all.

## Examples

**Example 1.** Operator says "Sunday review time, who should I reach out to this week?" Skill fires. Reads GHL contacts. Surfaces 6 red-bucket contacts + 1 inbound owed + 1 anniversary. Delivers digest. Operator picks "draft the messages" and skill hands off to `ghost-writer-me`.

**Example 2.** Operator says "who's gone dark?" Skill fires. Reads spreadsheet. Filters to contacts past their cadence threshold. Returns punch list ordered by worst decay first.

**Example 3.** Operator says "I want to make sure I don't lose the referral partners I built up last quarter." Skill fires. Filters contact source to referral partners. Returns quarterly touchpoint audit list.

## Composes with

- `ghost-writer-me`. drafts each reach-out message in the operator's voice.
- `decision-log`. captures any decision that surfaces during the review.
- `end-of-day-review`. logs the week's completed reach-outs at week close.
