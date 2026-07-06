---
name: podcast-guest-prep
description: "Prep the author for a podcast guest appearance. Researches the host, the show, and recent episodes; drafts the top 3 stories to tell, the top 3 questions to expect, what to plug (book / course / newsletter / next appearance), and the pre-show notes to send the host. Produces a one-page brief the author reads on the way to record. Trigger phrases include 'podcast guest prep', 'guest appearance prep', 'prep for [host name] podcast', 'guest on [show]', 'podcast interview prep', 'prep me for the [show] recording', 'podcast tomorrow', 'what should I plug on the podcast', 'stories to tell on [show]', 'brief me for the podcast', 'prep the podcast', 'guest spot prep'. Use when the author has an upcoming podcast guest appearance and wants a working brief. Do NOT trigger when the author is hosting their own show (that's a different prep pattern; route to a host-prep skill in a future release), when the author is prepping for a keynote (route to keynote-script), or when the author already recorded and wants to write post-episode follow-up (route to a promo pipeline skill). Altitude: authorship + platform. Output: a one-page brief saved to the operator's HQ."
---

LAST-VERIFIED: 2026-07-06. Source of truth: Brett K. Moore's podcast-guest pattern (used across Apex Podcast Co, PodcastNetwork.org, and Jesse Rhodes Jr's podcast circuit). Re-verify when PodcastNetwork.org v1 IP is locked.

This skill turns a "wait, when is that podcast again?" into a working brief. Podcast guest appearances are one of the highest-yield surfaces an author can use, and 80% of them get squandered because the author walks in cold. This skill front-loads the prep: know the host, know the show, know what stories land, know what to plug, know what to send the host afterward.

Output: a `podcast-<host-slug>-<YYYY-MM-DD>.md` file at the operator's canonical location (default: `podcasts/guest-appearances/`).

## When to use

- The author has an upcoming podcast guest appearance (24 hours to 30 days out).
- The author wants to know what to say when the host asks "so what should we talk about?"
- The author is guesting on a show they haven't listened to before.
- The author is guesting on a show they know well and wants to be sharp about what to plug.

## When NOT to use

- The author is hosting their own show (different prep pattern; not in this skill).
- The author is prepping for a keynote (route to `keynote-script`).
- The author is drafting post-episode promotional content (route to `evergreen-pipeline`).
- The interview is written (Q&A email), not audio (different shape).

## What you'll produce

```
# PODCAST GUEST BRIEF: [Show name] with [Host name]

**Recording date:** [Date and time]
**Format:** [Audio-only, video, live]
**Length:** [Expected episode length]
**Prep time:** [How long to run this brief before recording]

## The host in 30 seconds
- **Name:** [Host name]
- **Background:** [1 sentence]
- **Audience:** [Who listens]
- **Personal angle to warm the open:** [Something specific to reference in the first 90 seconds]

## The show in 30 seconds
- **What it's about:** [1 sentence]
- **Typical episode shape:** [Interview, panel, monologue]
- **Recent episodes worth referencing:**
  - [Episode 1, guest, why it's worth referencing]
  - [Episode 2, guest, why it's worth referencing]
  - [Episode 3, guest, why it's worth referencing]

## Top 3 stories to tell
1. [Story 1, one line hook, when to deploy it]
2. [Story 2, one line hook, when to deploy it]
3. [Story 3, one line hook, when to deploy it]

## Top 3 questions to expect and the answer to lead with
1. [Question 1]. Answer opens with: [phrase]
2. [Question 2]. Answer opens with: [phrase]
3. [Question 3]. Answer opens with: [phrase]

## What to plug
- **Primary plug:** [The one thing. Book, course, newsletter, next book launch.]
- **Secondary plug:** [Optional. Only if the host asks "anything else?"]
- **Where to send listeners:** [URL. Track UTM.]

## Pre-show notes to send the host
[Draft of the email the author sends the host 24 to 48 hours before recording. 5 to 8 bullets on what the author is happy to talk about. Keeps the host in the driver's seat but gives them the sharpest angles.]

## Post-show follow-up plan
- [Thank-you note within 24 hours]
- [Cross-promote when episode airs]
- [Repurpose 2 to 3 clips via evergreen-pipeline]
```

## Instructions

**Step 0. Lock five things.**

1. **The show and host.** Show name, host full name, recording date, recording time.
2. **The format.** Audio-only, video, live-to-air. This affects tone and prep.
3. **The primary plug.** What is the author trying to move? Book, course, newsletter, next appearance, mailing list. Pick one primary.
4. **The author's material bank.** Which stories, frameworks, and data points does the author have available. Read the author's hoard file if it exists.
5. **The output location.** Default: `podcasts/guest-appearances/podcast-<host-slug>-<YYYY-MM-DD>.md`. Confirm or override.

**Step 1. Research the host.** If web access is available, look up the host's background, their prior work, their audience. Pull the personal angle to open with in the first 90 seconds. If web access is not available, ask the author for what they know about the host.

**Step 2. Research the show.** What is the show about? What's the typical episode shape (interview, panel, monologue)? Identify 3 recent episodes worth referencing (either the guest, the topic, or a callback the host will appreciate). If web access is not available, ask the author for recent episodes.

**Step 3. Draft the top 3 stories.** From the author's material bank, pick 3 stories that match the show's audience. Each story: 1-line hook, and when to deploy it (open, mid-interview, close). Stories are the load-bearing move of any interview. Choose specifically.

**Step 4. Draft the top 3 questions to expect.** Based on the show's shape and the author's positioning, predict the 3 questions the host will most likely ask. For each, draft the opening phrase the author should lead with. Not the full answer. The opening phrase primes the author to land the story in Step 3.

**Step 5. Lock the plug.** Primary plug (the one thing). Secondary plug (optional). Where to send listeners (URL, UTM tracked). If the author already has an active launch runway, pull the launch-appropriate plug.

**Step 6. Draft the pre-show notes to the host.** 5 to 8 bullets. Not a script. The bullets give the host the sharpest angles without cornering them. This is the surface that separates prepared guests from every other guest.

**Step 7. Draft the post-show follow-up plan.** Thank-you note. Cross-promotion timing. Which 2 to 3 clips to atomize via `evergreen-pipeline` when the episode drops.

**Step 8. Write the file.** Save to the output location. Deliver the path in chat.

**Step 9. Suggest next skills.** `evergreen-pipeline` when the episode airs to repurpose clips. `hoard` for capturing any new story the author lands during the interview.

## Examples

**Example 1.** Author says "prep me for the Chris Do podcast next Tuesday." Skill fires. Looks up Chris Do (The Futur), notes his design and business background, pulls 3 recent episodes. Drafts 3 stories the author can tell (the "leaving corporate" story, the "$0 to $500K in year one" story, the "AI-native business" story). Predicts 3 questions Chris typically asks. Locks the plug (the new book). Drafts pre-show note to Chris.

**Example 2.** Author says "guest on Amy Porterfield next month, prep me." Skill fires. Amy hosts an online-business podcast. Author's stories reshape to fit an online-business audience. Plug is the coaching-program waitlist, not the book.

**Example 3.** Author says "prep me for the podcast tomorrow." Skill fires. Asks which podcast. Author names it. Skill produces a 24-hour turnaround brief with pre-show note the author sends host tonight.

## Composes with

- `evergreen-pipeline`. repurposes the episode into short-form when it airs.
- `hoard`. captures any new story the author landed during recording.
- `brand-voice-consistency`. voice-checks the pre-show note to the host.
- `handoff`. hands the post-episode promotion to a VA.
- `launch-runway`. aligns the podcast plug with the active launch calendar.
