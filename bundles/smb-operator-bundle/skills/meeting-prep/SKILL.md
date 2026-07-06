---
name: meeting-prep
description: "Prep the operator for an upcoming meeting from all available context. Reads the calendar event, the attendees' prior notes and last contacts, any shared docs, and produces a one-page pre-meeting brief with an agenda, decisions to make, materials to bring, questions to ask, and desired outcome. Trigger phrases include 'prep me for [X] meeting', 'meeting agenda', 'board prep', '1:1 prep', 'sales call prep', 'prep this call', 'prep the meeting', 'meeting brief', 'what should I know for', 'get me ready for', 'brief me for tomorrow's meeting', 'agenda for [meeting]', 'prep sheet for'. Use before any meeting with real stakes: sales calls, board meetings, one-on-ones, partner sync, quarterly reviews. Do NOT trigger for meetings the operator is not attending, for casual internal chats where no prep is needed, or when the meeting is in less than 5 minutes (deliver a text summary only, not a full brief)."
---

LAST-VERIFIED: 2026-07-06. Source of truth: AI Expert operator playbook, Reid Hoffman 2026 prediction that agents will prep every meeting.

This skill turns 20 minutes of scattered prep into 3 minutes of scannable brief. Small business owners walk into meetings under-prepared because prep takes too long to do right. This skill does the prep for them. Reads the calendar, pulls the attendee context, pulls the shared docs, drafts the agenda, surfaces the decisions to make, hands back a one-pager.

Output: a one-page brief written to `meeting-briefs/YYYY-MM-DD-[meeting-slug].md` and delivered as a chat digest.

## When to use

- Before any sales call over $10K in potential value.
- Before board meetings, investor calls, or partner sync.
- Before one-on-ones with direct reports.
- Before customer QBRs or renewal conversations.
- Before any first meeting with a new stakeholder.

## When NOT to use

- The meeting is a casual internal chat or a stand-up.
- The operator is not attending.
- The meeting is less than 5 minutes away (deliver a summary only).
- No context exists on the attendees or the topic; the brief would be padded.

## What you'll produce

```
MEETING BRIEF
[Meeting name / [Date] [Time]]

ATTENDEES
- [Name, role, last contact date, one line on the relationship state]

DESIRED OUTCOME
[One sentence on what a good meeting looks like.]

AGENDA (owner-to-be-suggested)
1. [Item, X min]
2. [Item, X min]
3. [Item, X min]

DECISIONS TO MAKE
- [Decision, options, recommended default]

MATERIALS TO BRING
- [Doc, deck, ROI worksheet, contract]

QUESTIONS TO ASK
- [High-signal question that unlocks the room]

WATCH-OUTS
- [Any red flags or open loops from last conversation]

SUGGESTED NEXT SKILLS
- After the meeting, run `end-of-day-review` and log what happened.
- If you make a decision, run `decision-log`.
- If you need to hand something off after the meeting, run `handoff`.
```

## Instructions

**Step 0. Lock four things.**
1. **The meeting.** Name, date, time, who called it.
2. **The attendees.** Who's in the room? Roles, prior context if known.
3. **The desired outcome.** What does success look like for this specific meeting?
4. **The context sources.** Where does the operator's prior meeting history live? Calendar, Notes, CRM contact record, Drive folder for the counterparty.

**Step 1. Pull attendee context.** For each attendee: last meeting date, last message thread, any outstanding actions the operator owes them, any recent news about their company or role.

**Step 2. Pull topic context.** If the meeting has a stated topic, pull related docs: prior proposals, previous decks, product pages, contract drafts, or open Loom recordings.

**Step 3. Draft the agenda.** Time-boxed. Realistic. Includes intros only if the room is fresh.

**Step 4. Surface decisions and materials.** What is the operator being asked to decide in this meeting? What materials will they wish they had? Name each one.

**Step 5. Draft high-signal questions.** The 1-3 questions the operator can ask that will change the trajectory of the conversation. Not filler questions.

**Step 6. Flag watch-outs.** Anything from the last conversation that's still open. Any tension. Any promise that was made and not kept.

**Step 7. Deliver the brief.** Save it to `meeting-briefs/YYYY-MM-DD-slug.md` if the operator wants an archive; otherwise deliver as chat digest only.

## Examples

**Example 1.** Operator says "prep me for the Buddy sales call at 2 PM." Skill fires. Pulls Buddy's contact record from GHL. Pulls the last three email threads. Pulls the current proposal. Delivers a brief showing Buddy has been silent for 12 days after receiving pricing; recommends leading with a soft check-in question, then walking through the ROI worksheet.

**Example 2.** Operator says "board prep for Thursday." Skill fires. Pulls last board deck, quarter-over-quarter financials, and open board actions from previous meetings. Delivers a 5-item agenda with 15 min per item and the three decisions the board is being asked to make.

**Example 3.** Operator says "1:1 prep with Sarah tomorrow at 10." Skill fires. Pulls Sarah's last three 1:1 notes. Surfaces the two open promises the operator made last time. Drafts three high-signal questions for the check-in.

## Composes with

- `end-of-day-review`. logs what happened in the meeting after the fact.
- `decision-log`. captures any decision that came out of the meeting.
- `handoff`. briefs a team member on any follow-through action.
- `weekly-network-review`. the operator's meeting cadence is one input to the network review.
