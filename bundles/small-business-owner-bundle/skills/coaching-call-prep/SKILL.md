---
name: coaching-call-prep
description: "Prep for a coaching call, consulting call, or advisory call the operator is either delivering or receiving. Produces the pre-call brief (context on the person, prior sessions, current business state, current stated priorities) and the call agenda (three questions to open with, the middle 30 minutes of substance, the close and the one commitment). Trigger phrases include 'coaching call prep', 'prep my consult', 'prep for [name]', 'coaching brief', 'advisory call prep', 'client call prep', 'strategy call prep'. Do NOT trigger for a routine sales call (route to `meeting-prep`) or for a deal-review call (route to `sales-pipeline-hygiene`)."
---

LAST-VERIFIED: 2026-07-06. Source of truth: Brett K. Moore, AI Expert Marketplace v1.1.0.

This skill preps a coaching, consulting, or advisory call. It produces the pre-call brief and the call agenda so the operator walks in with the context loaded and the structure predefined.

Coaching calls are different from sales calls. The operator is either delivering value in exchange for money already paid, or receiving value from someone whose time they respect. In both cases, wasting the first 15 minutes on "where were we?" is expensive.

## When to use

- The operator has a coaching, consulting, or advisory call coming up (delivering or receiving).
- There is a prior session or written context the operator wants loaded before the call.
- The operator wants a predefined structure so the call produces one committed action at the end.

## When NOT to use

- The call is a routine sales call (route to `meeting-prep`).
- The call is a deal-review call inside the operator's sales process (route to `sales-pipeline-hygiene`).
- The call is a peer chat with no agenda (do not overengineer).

## Inputs the operator provides

- Who the other person is (their name, role, company, and one sentence about them).
- Prior session notes if any (or a pointer to a shared doc).
- The stated purpose of this call.
- What the operator wants to walk out of the call with.

## The pre-call brief

Structured as:

```
CALL PREP: [name] — [date, time]

## Who they are
[One paragraph. Role, business, stage, current situation, what they care about.]

## What we last talked about
[Two or three bullet points from the prior session, if any.]

## What they said they want from this call
[One sentence, verbatim if possible.]

## What has probably changed since last time
[The specific things worth asking about before assuming continuity.]

## What I want out of this call
[One sentence. The operator's own goal for the session.]
```

## The call agenda

Structured as a 60-minute default (compresses to 30 or expands to 90):

```
## Open (5 min) — three questions
1. [Something that anchors the emotional state, e.g., "what happened this week that shifted something?"]
2. [Something that anchors the business state, e.g., "what number moved that matters?"]
3. [Something that anchors the intent, e.g., "what do you want out of the next 60 minutes?"]

## Middle (45 min) — the substance
- [Topic 1 with a specific question or framework]
- [Topic 2 with a specific question or framework]
- [Topic 3 with a specific question or framework]

## Close (10 min) — the one commitment
- Recap the three things that landed.
- Ask for the one specific action the other person will take before the next call.
- Ask for the one specific action the operator will take before the next call.
- Book the next call now.
```

## The follow-up

After the call, the operator runs `hoard` to save any working framework or line that landed, and `decision-log` to capture any permanent decision the other person made.

## Voice rules

- Do not draft the questions in generic coaching language ("what would it look like if...").
- Draft in the operator's own voice, tuned to the other person.
- Three questions max on the open. More is a monologue disguised as questions.

## Related skills

- `meeting-prep` — for the non-coaching sales or business meeting.
- `hoard` — for capturing the frameworks that emerge in-session.
- `decision-log` — for the commitments the other person makes.
