---
name: evergreen-pipeline
description: "Atomize one long-form piece (a book chapter, a keynote recording, a podcast interview, a workshop transcript, a newsletter) into 5 to 7 short-form pieces spanning LinkedIn posts, X threads, newsletter clips, quote cards, and audio-podcast clips. Reads the long-form input, extracts the load-bearing moves, and drafts each short-form piece in the author's voice with format-appropriate structure. Trigger phrases include 'evergreen content', 'repurpose this', 'content pipeline', 'make short-form from this', 'content atomization', 'atomize this', 'repurpose the keynote', 'repurpose the podcast', 'repurpose the chapter', 'break this into posts', 'turn this into content', 'content pipeline from', 'atomize the [X]', 'repurpose the [X]'. Use when the author has one big piece of content and wants a batch of short-form derivatives. Do NOT trigger when the author is drafting the long-form piece itself (route to chapter-draft, keynote-script, or thought-leadership-post), when the author is running the launch content sequence (route to launch-runway which then invokes this skill), or when the source is a single quote or observation (route to thought-leadership-post directly). Altitude: platform. Output: 5 to 7 short-form drafts delivered in-chat, plus optional save."
---

LAST-VERIFIED: 2026-07-06. Source of truth: Brett K. Moore's content atomization pattern used across AI Expert, brettkmoore.com, PodcastNetwork.org, and Apex Podcast Co. Also references Jesse Rhodes Jr's content flywheel methodology.

This skill compounds every long-form piece the author produces. A 45-minute keynote is not one asset. It is 5 to 7 short-form assets waiting to be atomized. A drafted chapter is not one asset. It is a LinkedIn post, an X thread, a newsletter section, a pull quote card, and a podcast talking point. The pattern is simple: extract the load-bearing moves, then draft each derivative in the format-appropriate shape.

Output: 5 to 7 short-form drafts delivered in-chat by default. Optional save to `content/atomized/<source-slug>-<YYYY-MM-DD>/` for launch-runway integration.

## When to use

- The author just recorded a keynote and wants to atomize the recording.
- A podcast episode aired and the author wants to repurpose 2 to 3 clips.
- A chapter drafted for the book has a section worth extracting for social.
- The author is prepping the launch runway and wants a content batch from a single long-form source.
- A newsletter drop has an insight the author wants to spin into standalone posts.

## When NOT to use

- The author is drafting the long-form piece itself (route to `chapter-draft`, `keynote-script`, or `thought-leadership-post`).
- The source is a single quote or a shower thought (route to `thought-leadership-post` directly).
- The author is running the full launch content sequence (route to `launch-runway`; that skill invokes this one).
- The source is proprietary client work that shouldn't be public.

## What you'll produce

```
# EVERGREEN ATOMIZATION: [Source name]

**Source:** [Keynote, podcast, chapter, workshop, newsletter, other]
**Source length:** [Minutes or word count]
**Source date:** [When it was recorded or drafted]
**Atomization date:** [Today]
**Target channels:** [LinkedIn, X, newsletter, Instagram, TikTok, etc.]

## Load-bearing moves extracted
1. [Move 1: what the source argued or showed]
2. [Move 2]
3. [Move 3]
4. [Move 4]
5. [Move 5]

## Short-form derivative 1: LinkedIn post
[Draft ready to publish. 200 to 400 words. Uses the four-move shape from thought-leadership-post. Anchored on Move 1.]

## Short-form derivative 2: X / Twitter thread
[Draft ready to publish. 5 to 9 tweets. Anchored on Move 2.]

## Short-form derivative 3: Newsletter clip
[Draft ready for the next newsletter drop. 100 to 200 words. Anchored on Move 3.]

## Short-form derivative 4: Quote card
[Text for a designer to lay out. 1 to 3 sentences. Anchored on Move 4.]

## Short-form derivative 5: Audio-podcast clip (if source is audio)
[Timestamp range from the source. 30 to 90 seconds. Suggested caption for the clip post.]

## Short-form derivative 6 to 7 (optional)
[Additional derivatives if the source has more than 5 load-bearing moves.]

## Publishing sequence recommendation
- Week +1: [Derivative 1]
- Week +2: [Derivative 2]
- Week +3: [Derivative 3]
- Week +4: [Derivative 4]
- Week +5: [Derivative 5]

## Tracking
- Where each piece will publish
- Owner (author, VA, launch partner)
- Which pieces should link back to the source
```

## Instructions

**Step 0. Lock six things.**

1. **The source.** Path to the file, URL, or transcript. Read the source end to end before drafting.
2. **The source type.** Keynote recording, podcast episode, book chapter, workshop transcript, newsletter drop, blog post.
3. **The target channels.** LinkedIn (default), X/Twitter, newsletter, Instagram caption, TikTok script, quote card. Which channels does the author actually publish on. Do not draft for channels the author does not use.
4. **The launch context.** Is this atomization part of a launch runway or standalone? Launch context changes the CTA (drives to launch page) vs. standalone (drives to newsletter or general list).
5. **The voice corpus.** Path to the author's voice skill folder. If missing, load 3 to 5 voice samples.
6. **The output location.** Default: in-chat delivery. Override to `content/atomized/<source-slug>-<YYYY-MM-DD>/` if the author is running a content calendar.

**Step 1. Read the source end to end.** Extract the 5 load-bearing moves (arguments, stories, shifts, frameworks, data points). If the source has fewer than 3 load-bearing moves, the source is not a candidate for atomization. Surface that to the author and stop.

**Step 2. Draft the LinkedIn post.** Uses the four-move shape from `thought-leadership-post`: hook, insight, story or data, takeaway, engagement question. Anchor on the strongest load-bearing move.

**Step 3. Draft the X / Twitter thread.** 5 to 9 tweets. Tweet 1 is the hook (drops the reader in). Tweets 2 to 8 build the argument, each on a separate line-broken tweet. Tweet 9 is the CTA and the source link.

**Step 4. Draft the newsletter clip.** 100 to 200 words. Fits into the next newsletter drop as a standalone section. Anchor on a load-bearing move different from Steps 2 and 3.

**Step 5. Draft the quote card.** 1 to 3 sentences. Extractable line the designer lays out visually. Anchor on the source's most quotable moment.

**Step 6. Identify the audio-podcast clip (if source is audio).** Timestamp range from the source. 30 to 90 seconds. Suggested caption for the clip post.

**Step 7. Add optional derivatives 6 and 7.** If the source has more than 5 load-bearing moves, draft the extras. Instagram caption. TikTok script. Reddit AMA snippet. Whatever fits the author's channels.

**Step 8. Draft the publishing sequence.** Recommend which week each piece publishes. If this is part of a launch runway, align with the runway. If standalone, spread across 5 weeks.

**Step 9. Voice check.** Scan every derivative against the voice corpus. Kill banned words. Kill em dashes. Kill off-tone sentences.

**Step 10. Deliver in-chat.** Every derivative ready to publish or hand to a VA. Include the tracking block (where, owner, backlinks).

**Step 11. Suggest next skills.** `brand-voice-consistency` for second-pass polish. `hoard` for capturing any framework the author wants to reuse. `launch-runway` if this batch feeds into a launch. `handoff` if the batch goes to a VA for scheduling.

## Examples

**Example 1.** Author says "repurpose the Jesse keynote into short-form content." Skill fires. Reads the 45-minute keynote transcript. Extracts 6 load-bearing moves (the opening story, the three-arc frame, the AI-native shift, the coaching-program story, the close CTA). Drafts 6 derivatives: LinkedIn post on the opening story, X thread on the three-arc frame, newsletter clip on the AI-native shift, quote card on the memorable close line, audio clip at 12:34 to 13:20, Instagram caption on the coaching story.

**Example 2.** Author says "make short-form from this chapter." Skill fires. Reads the chapter. Extracts 5 load-bearing moves. Drafts LinkedIn post, X thread, newsletter clip, quote card. Skips audio clip (source is text).

**Example 3.** Author says "content pipeline from the podcast with Ryan Deiss." Skill fires. Loads the aired episode transcript. Extracts 5 moves. Drafts LinkedIn post (Ryan tagged), X thread (Ryan tagged), newsletter clip, quote card, audio clip suggested at 22:10 to 22:55.

## Composes with

- `thought-leadership-post`. shape used for each derivative.
- `brand-voice-consistency`. voice-polish pass across all derivatives.
- `launch-runway`. feeds the atomized batch into the runway.
- `hoard`. captures the working atomization patterns for reuse.
- `handoff`. hands the batch to a VA for scheduling.
- `podcast-guest-prep`. the source of many atomizations.
- `keynote-script`. the source of the highest-yield atomizations.
- `chapter-draft`. the source of pre-launch atomizations.
