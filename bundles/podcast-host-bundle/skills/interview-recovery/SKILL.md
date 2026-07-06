---
name: interview-recovery
description: "Recover an interview that has gone off-plan mid-conversation. Covers the four common failure modes (guest goes flat, guest gets defensive, guest overruns the format, guest reveals something they will regret) and the specific host moves for each. Trigger phrases include 'interview recovery', 'interview going sideways', 'guest went flat', 'guest defensive', 'interview off track', 'recover the interview', 'interview save'. Do NOT trigger for the question design (route to `interview-question-designer`) or for the post-recording follow-up (route to `guest-followup`)."
---

LAST-VERIFIED: 2026-07-06. Source of truth: Brett K. Moore, AI Expert Marketplace v1.1.0.

This skill covers what to do when an interview goes off-plan mid-conversation. The four common failure modes and the specific host moves for each.

Recording is live. Something will go wrong. The difference between an experienced host and a nervous host is not that experienced hosts have perfect interviews. It is that experienced hosts have a small set of recovery moves they can deploy without breaking the frame.

## When to use

- The host is prepping for a recording and wants the recovery playbook loaded.
- An interview has already gone sideways and the host wants to know how to save it in the edit.

## When NOT to use

- The interview is going well (do not overthink it).
- The interview failed because of the guest's category (that is a booking decision, not a recovery skill; route to `guest-outreach` and reset the guest list).

## The four failure modes

### 1. Guest goes flat

**Signal.** The guest gives short answers. Nods a lot. Says "yeah, exactly." Energy is low.

**Cause.** Guest is tired, the format is wrong for them, or the questions are landing too formal.

**Recovery moves.**
- Drop the anchor question format. Ask a story question: "walk me through the day you [specific event]."
- Get the guest's hands moving. Ask them to describe something visual.
- Call it out directly if the guest is willing: "I feel like we're in a formal frame. Do you want to go somewhere less formal?"
- If none of that works, wrap the recording at 30 to 40 minutes instead of 60. Publish it short.

### 2. Guest gets defensive

**Signal.** The guest starts qualifying every answer. Says "well, that depends" a lot. Pushes back on the frame of the question.

**Cause.** The host has landed on a topic the guest is protecting. Could be legal, could be personal, could be political.

**Recovery moves.**
- Do not chase. Move the question sideways rather than deeper.
- Acknowledge the tension explicitly: "sounds like there's something in that I don't know about — happy to go a different direction if this isn't the one."
- Move to a topic the guest brought up first in the pre-interview brief. Anchor in something they chose.
- If the defensiveness is legal or contractual, offer to cut the topic from the episode entirely.

### 3. Guest overruns the format

**Signal.** The guest gives 8-minute answers. The host is running out of time to hit the anchor questions.

**Cause.** The guest is a natural talker and the format hasn't been set.

**Recovery moves.**
- Interject with a specific follow-up rather than an anchor question. Follow-ups shorten answers.
- Do a hard reset: "let me pause here — I want to make sure we get to [next topic] because I think that's where the audience needs you to land."
- Cut 30 minutes in the edit. Publish the 45 to 60 minutes that carry the show.
- Book the guest back for a part 2 if the material warrants it.

### 4. Guest reveals something they will regret

**Signal.** The guest names a specific person negatively. Reveals a legal exposure. Discloses a private client detail. Or crosses a line the host knows the guest's team would want them to walk back.

**Cause.** The guest trusted the host and the recording felt private.

**Recovery moves.**
- Do not react in the moment. Stay in the interview.
- After recording, flag it to the guest: "there was a moment at [timestamp] where you mentioned [X] — I want to be sure that's on the record before we publish."
- Give the guest the option to cut it. Most professional guests will accept.
- If the moment is genuinely load-bearing to the episode and the guest wants it cut, negotiate: a paraphrase, a partial cut, a delay in publish.
- Never publish a moment a professional guest asked to cut without their explicit approval.

## Output shape

```
INTERVIEW RECOVERY PLAYBOOK: [show name]

## Failure mode 1 — Guest goes flat
- Signals: [list]
- Cause: [common cause]
- Moves: [3 specific recovery moves]

## Failure mode 2 — Guest gets defensive
- Signals: [list]
- Cause: [common cause]
- Moves: [3 specific recovery moves]

## Failure mode 3 — Guest overruns
- Signals: [list]
- Cause: [common cause]
- Moves: [3 specific recovery moves]

## Failure mode 4 — Guest reveals something they'll regret
- Signals: [list]
- Cause: [common cause]
- Moves: [4 specific recovery moves + the post-recording flag]

## In-session prompts (for the host)
- If the guest goes flat at any point, ask: [prompt]
- If the guest gets defensive, ask: [prompt]
- If the guest overruns, interject with: [prompt]
- If the guest reveals something regrettable, note: [note-to-self]
```

## The publish-decision discipline

Every failure mode has a publish-decision layer:

- Flat: publish short.
- Defensive: publish edited.
- Overrun: publish tight.
- Regret: publish with the guest's approval, or don't publish.

The host's reputation is worth more than any single episode's downloads.

## Voice rules

- No em dashes.
- Named recovery moves. Not "handle it gracefully."
- Do not blame the guest in the notes. Diagnose and recover.

## Related skills

- `interview-question-designer` — for the pre-interview design that prevents most of these.
- `guest-followup` — for the post-recording resolution.
- `podcast-transcription-workflow` — for locating the specific moment to cut.
- `hoard` — for saving the recovery lines that worked.
