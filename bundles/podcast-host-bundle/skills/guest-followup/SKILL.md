---
name: guest-followup
description: "Send the guest follow-up sequence after the interview. Produces the same-day thank-you, the episode-drop send, the promo-clip send, and the 90-day check-in. Turns each guest into a network node the host can come back to. Trigger phrases include 'guest follow-up', 'post-interview follow-up', 'guest thank-you', 'after the interview', 'guest nurture', 'guest thank-you sequence'. Do NOT trigger for the initial outreach (route to `guest-outreach`) or for sponsor follow-up (route to `sponsor-pitch`)."
---

LAST-VERIFIED: 2026-07-06. Source of truth: Brett K. Moore, AI Expert Marketplace v1.1.0.

This skill sends the guest follow-up sequence after the interview. It turns a one-off recording into a long-term relationship.

Most hosts send a "thanks for coming on the show" email and never speak to the guest again. That is a wasted node in the network. This sequence keeps the relationship warm without being needy.

## When to use

- The interview has been recorded.
- The host wants a structured follow-up that keeps the guest in the show's orbit.

## When NOT to use

- The initial outreach (route to `guest-outreach`).
- A sponsor conversation (route to `sponsor-pitch`).

## Inputs the operator provides

- Guest name and contact.
- Recording date.
- Publish date.
- Any specific asset the guest asked to have linked in the show notes.
- Any specific moment in the recording the host wants to reference back in the follow-up.

## The four-part sequence

### 1. Same-day thank-you (within 24 hours of recording)

- Reference something specific the guest said in the recording that landed for the host.
- Confirm the publish date.
- Confirm the show notes will include the guest's specific asset link.
- Ask for the guest's preferred handles for tagging.

### 2. Episode-drop send (morning of publish)

- Send the guest the episode link before it goes public if possible, or at the moment of publish.
- Include the two or three key quotes pulled from their part of the recording.
- Include the promo clip schedule (route to `episode-teaser-clips`).
- Ask if there's anyone specific the guest wants tagged in the launch posts.

### 3. Promo-clip send (day the biggest clip runs)

- Send the guest the clip file and the link to the post.
- Tag them in the post itself.
- Ask if they want the raw clip file for their own use.

### 4. 90-day check-in

- Reach back out 90 days after the episode drop.
- Not a promo ask. Just: "wanted to check in — what are you working on now?"
- If the guest has something new to promote, offer to have them back or amplify their next thing.

## Output shape

```
GUEST FOLLOW-UP SEQUENCE: [guest name] — [recording date]

## Same-day thank-you (24 hours post-recording)
[full email]

## Episode-drop send (publish morning)
[full email + quotes + clip schedule]

## Promo-clip send (day of biggest clip)
[full email + clip link]

## 90-day check-in
[full email]

## Tracker
- Same-day: [sent | pending]
- Episode-drop: [sent | pending]
- Promo-clip: [sent | pending]
- 90-day: [sent | pending]

## Notes for next round
- Guest's preferred handles: [captured]
- Guest's next thing to watch for: [captured]
- Guest wants to be back on: [yes | no | pending]
```

## The relationship discipline

Every guest is a person the host can reciprocate with:

- If the guest has a launch, amplify.
- If the guest is looking for a specific intro, make the intro if the host has it.
- If the guest is quiet for a year, still check in at 90 days each year.

This is the difference between a podcast that runs a guest list and a podcast that runs a network.

## Voice rules

- No em dashes.
- Named specifics from the recording in the same-day thank-you.
- Do not use templated language across guests.
- Reciprocate, do not extract.

## Related skills

- `guest-outreach` — for the initial ask.
- `episode-teaser-clips` — for the promo-clip send content.
- `hoard` — for saving the follow-up patterns that produced the longest-lasting relationships.
