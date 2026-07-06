---
name: hard-conversation
description: "Prep a difficult conversation with a specific person: purpose, opening line, what they will likely say, your response tree, best case, worst case, probable case, and the one-line resolution the executive is aiming for. Output goes to a disposable session-scoped path; the executive uses it to rehearse and then destroys it after the conversation. Trigger phrases include 'prep hard conversation', 'difficult chat with', 'how do I tell [name]', 'conversation script', 'confrontation prep', 'need to have a talk with', 'sit down with', 'firing conversation', 'letting go', 'performance conversation', 'push back on', 'call out', 'need to raise this with', 'tough talk', 'hard talk', 'this conversation is going to be hard'. Also invoke implicitly when the executive names an upcoming conversation they are dreading. Do NOT trigger for standard one-on-ones or scheduled reviews (different genre, different prep), for HR-mandated termination conversations that require Legal review (route to Legal first, not to a skill), or when the executive is mid-conversation and needs in-the-moment coaching rather than prep."
tools: Read, Write
---

LAST-VERIFIED: 2026-07-06. Source of truth: Kim Scott's practice on direct feedback, Marshall Goldsmith's practice on stakeholder conversations, the general operator-community writing on tough conversations, Brett K. Moore's operating rhythm. Adapted, not lifted. Re-verify quarterly.

This skill preps a hard conversation before the executive has it. The output is a working document the executive uses to rehearse and destroys after the conversation happens. Prep matters because most hard conversations go sideways at the opening line; if the executive rehearses the opening and the first three exchanges, the whole conversation gets easier.

Output goes to a disposable session-scoped path: `~/tmp/hard-convo-<person-slug>-<YYYY-MM-DD>.md`. The executive is responsible for destroying the file after the conversation or moving specific decisions into a permanent record.

## Step 0: Confirm the four intake items

1. **Who.** The specific person. Name, role, relationship to the executive (direct report, peer, board member, investor, customer).
2. **What.** The specific thing the executive needs to say. In one sentence. If the executive cannot state it in one sentence, the conversation is not ready yet; help them sharpen before drafting.
3. **The desired outcome.** What does the executive want the other person to walk out believing, feeling, or committed to? If the executive cannot name an outcome, the conversation is a vent, not a work conversation; ask them to clarify.
4. **The stakes.** Why is this conversation hard? Long relationship, power imbalance, prior avoidance, high emotional charge, financial or legal exposure. Naming the stakes shapes the tone.

If any of the four are missing, ask before drafting.

## Standard prep shape

The prep has seven elements. Every hard-conversation prep built by this skill runs the same seven.

**Element 1: The one-sentence purpose.**
What the executive is there to say. Restated in one clean sentence. If the executive cannot lock this sentence, they are not ready to have the conversation.

**Element 2: The opening line.**
The literal words the executive says first. Not a summary of what they will say. The actual sentence. Rehearsable. If the opening runs longer than three sentences, cut it. Openings that run long telegraph that the executive is stalling.

**Element 3: Anticipated responses (three).**
What the other person will most likely say in response to the opening. Draft three possible responses: the defensive response, the deflecting response, the accepting response. For each, draft the executive's next line.

**Element 4: The response tree.**
Two levels deep on each anticipated response. If they defend, executive says X. If then they push back on X, executive says Y. Two exchanges past the opening is enough; further ahead than that becomes fiction because the conversation has diverged from the tree.

**Element 5: Three outcome scenarios.**
- **Best case.** What is the version of this conversation the executive would take? One paragraph.
- **Worst case.** What is the version the executive is dreading? One paragraph.
- **Probable case.** What is the realistic middle? One paragraph. This is the one to plan for.

**Element 6: The one-line resolution.**
The specific thing the executive wants recorded, agreed, or committed by the end of the conversation. One sentence. If the resolution is "they will think about it," the conversation ends without a lock and the executive plans a follow-up cadence.

**Element 7: The escalation trigger.**
The specific thing that, if it happens in the conversation, moves this out of a working conversation and into an HR or Legal conversation. Named in advance so the executive does not improvise the escalation while emotional.

## Output format

Return a Markdown document in this shape:

```
# Hard Conversation Prep, [Person Name], [YYYY-MM-DD]

**Purpose (one sentence).**
[Locked sentence.]

**Desired outcome.**
[What the other person walks out believing, feeling, or committed to.]

**Opening line (literal).**
"[The actual sentence the executive says first.]"

**Anticipated responses.**

*Defensive.* They say: [likely defensive response]. Executive says: [next line].
*Deflecting.* They say: [likely deflecting response]. Executive says: [next line].
*Accepting.* They say: [likely accepting response]. Executive says: [next line].

**Response tree (two levels).**
[For each of the three anticipated responses, draft two more exchanges.]

**Best case.**
[One paragraph.]

**Worst case.**
[One paragraph.]

**Probable case.**
[One paragraph. Plan for this one.]

**One-line resolution.**
"[The specific thing the executive wants at the end of the conversation.]"

**Escalation trigger.**
[If X happens in the conversation, executive pauses, ends the conversation, and routes to HR or Legal. Named in advance.]

**Reminder.**
This document is disposable. Destroy after the conversation. Move specific commitments into a permanent record (DECISIONS.md, meeting notes, one-on-one log).
```

## Voice rules for the draft

The draft is in the operator's actual voice, not a smoothed-out version. Hard conversations fail when the executive delivers language that does not sound like them. The prep should sound like the operator. Read prior writing in the corpus if a voice corpus is available.

## Emotional-safety discipline

The prep is prep, not therapy. If the executive is deeply distressed about the conversation and using the prep to process rather than plan, name it once. "You are working out how you feel about this in real time. Do you want to stop the prep and just talk through the situation for ten minutes, then come back to the plan?" The executive decides.

The prep is also not a script. The executive is not reading lines. The prep is a rehearsal that lets them show up more themselves, not less. Say this in the reminder block at the bottom of the document.

## When to invoke

Invoke when the executive names a difficult conversation coming up. Invoke when the executive says "how do I tell." Invoke implicitly when the executive names an upcoming interaction and their language signals dread.

## When NOT to invoke

Do not invoke for standard one-on-ones (different genre). Do not invoke for HR-mandated termination conversations that require Legal review; those need Legal, not a skill. Do not invoke mid-conversation for in-moment coaching.

## Companion skills

Runs cleanly next to `decision-quality-check` (if the conversation is downstream of a decision the executive is about to lock), `ghost-writer-me-exec` (if the conversation requires a written follow-up in the executive's voice), and `handoff` (if the conversation ends with a piece of work moving from the executive to a lieutenant).
