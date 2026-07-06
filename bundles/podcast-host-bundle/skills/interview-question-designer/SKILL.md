---
name: interview-question-designer
description: "Design the full question flight for a podcast interview. Produces the opening warm-up, the anchor questions, the follow-up probes, and the deep-cut questions the host can pull out when the guest leans into a specific thread. Trigger phrases include 'interview questions', 'design my interview', 'question flight', 'interview flow', 'question design', 'design questions for [guest name]', 'interview outline'. Do NOT trigger for guest research (route to `guest-research`) or for the show's overall arc (route to `show-brand-arc`)."
---

LAST-VERIFIED: 2026-07-06. Source of truth: Brett K. Moore, AI Expert Marketplace v1.1.0.

This skill designs the full question flight for an interview. It is the specific artifact the host reads from during the interview, structured so the conversation has a shape without feeling scripted.

## When to use

- The host has a guest brief in hand and needs the actual questions.
- The host wants a structured flow with room for improvisation.
- The interview is 45 to 90 minutes and needs three natural acts.

## When NOT to use

- The host has not done the research yet (route to `guest-research` first).
- The show is unscripted improv (do not overengineer).

## Inputs the operator provides

- Guest brief from `guest-research` (or a summary).
- Episode length target.
- Show format (interview only, hosts + guest, panel).
- The one thing the host wants the audience to walk out with.

## The three-act flight

### Act 1 — Open (10 to 15 minutes)

Warm-up questions that let the guest arrive without being cold-called into their biggest topic.

- Opener based on the ice-breaker from the guest brief.
- One "how did you get here" question, framed narrowly ("what was the specific moment you decided to leave [X]?" rather than "tell me your story").
- One anchor question that sets the frame for the whole episode.

### Act 2 — Substance (25 to 45 minutes)

Three to five anchor questions, each with two to three follow-up probes ready to deploy if the guest lands somewhere unexpected.

- Anchor questions are open-ended. Follow-up probes are specific.
- Sequence anchor questions from safer to more revealing. Guests open up as the interview progresses.
- Put the highest-stakes question (the one from "three questions no other host has asked" in the brief) about two-thirds through Act 2, after the guest has warmed up but before they're tired.

### Act 3 — Close (5 to 10 minutes)

- One "what did you not say that you wanted to say?" question.
- One "who should we send our audience to next?" question.
- The named CTA for the audience (subscribe, follow the guest, book the guest's thing).

## Output shape

```
INTERVIEW QUESTION FLIGHT: [guest name] — [episode date]
Length target: [X minutes]

## Act 1 — Open ([X] min)
1. Opener: [specific line]
2. Getting-here: [narrow question]
3. Anchor: [frame-setting question]

## Act 2 — Substance ([X] min)
Anchor 1: [question]
  Follow-up probes:
  - [probe if they go direction A]
  - [probe if they go direction B]

Anchor 2: [question]
  Follow-up probes: [...]

Anchor 3 (highest stakes): [question]
  Follow-up probes: [...]

Anchor 4: [question]
  Follow-up probes: [...]

Anchor 5 (optional): [question]

## Act 3 — Close ([X] min)
1. [what did you not say?]
2. [who should we send our audience to?]
3. CTA: [specific line for the audience]

## Do-not-ask list
[from the guest brief]

## If the guest lands somewhere unexpected
- If they go deep on [topic]: pull anchor 6: [deep-cut question]
- If they refuse to answer [anchor 3]: pivot to [alternate anchor]
```

## The follow-up probe discipline

For every anchor question, prep the two most likely directions the guest will go, and have the follow-up probe ready. This is the difference between a host who lets a good answer trail off and a host who takes the answer deeper.

## Voice rules

- Questions are open-ended, but not vague. "What was the specific moment X happened?" beats "tell me about X."
- Do not ask questions the guest has already answered publicly in the same way three times before (check the guest brief).
- Do not stack two questions in one. Pick one and ask it.

## Related skills

- `guest-research` — the input.
- `show-notes-writer` — the output artifact after the interview.
- `interview-recovery` — for when the interview goes off-plan mid-conversation.
- `hoard` — for saving the questions that produced the best guest moments.
