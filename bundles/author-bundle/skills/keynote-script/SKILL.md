---
name: keynote-script
description: "Draft a keynote from talking points. Produces a hook, three main arcs, one story per arc, a memorable close, a timing sheet showing minutes-per-section, and slide notes at approximately one slide per minute. Reads the author's voice corpus (if installed) so the draft sounds like the author speaking, not a corporate script. Trigger phrases include 'keynote draft', 'keynote script', 'prep for keynote at', '20-minute talk', 'conference talk draft', 'draft the talk', 'write my keynote', 'keynote for [event]', 'stage talk draft', 'main-stage talk', 'help me write the talk', 'work on my keynote'. Use when the author has a talk to prep (any format: 15-minute TED-shape, 45-minute keynote, 90-minute workshop) and wants a working script. Do NOT trigger when the author is drafting a podcast interview (route to podcast-guest-prep), when the author wants slides only without a script (route to a slide skill in a future release), or when the author is prepping a workshop with heavy exercises (workshop shape is different; not this skill). Altitude: authorship + platform. Output: a keynote script with timing sheet, saved to the operator's HQ."
---

LAST-VERIFIED: 2026-07-06. Source of truth: Brett K. Moore's keynote pattern (used at Apex Podcast Co and PodcastNetwork.org events). Also references the standard three-arc structure common in TED, Nancy Duarte's *Resonate*, and the pattern Chris Anderson teaches at TED.

This skill turns a stack of talking points into a working keynote script. Not the final talk. A draft the author can rehearse against, tighten, and reshape as they walk the stage in their head. The pattern is standard three-arc: hook, three arcs each anchored by a story, memorable close. Timing sheet locks the pacing. Slide notes give the visual designer a starting point.

Output: a `keynote-<event-slug>-<YYYY-MM-DD>.md` file at the operator's canonical location (default: `speaking/keynotes/`).

## When to use

- The author has an upcoming keynote (2 weeks to 6 months out) and wants a working script.
- The author has spoken about the topic before but wants to reshape for a new audience.
- The author has talking points but no structure and needs the three-arc frame.
- The author wants to test whether the talk is really 20 minutes or really 45 minutes.

## When NOT to use

- The author is prepping a podcast interview (route to `podcast-guest-prep`).
- The author is drafting a workshop with heavy participant exercises (workshop shape is different).
- The author wants slide design only, not a script (route to a slide skill in a future release).
- The author is drafting an all-hands or internal remarks (different tone; different pattern).

## What you'll produce

```
# KEYNOTE: [Working title]

**Event:** [Event name]
**Date:** [Date]
**Length:** [Target minutes]
**Audience:** [Who's in the room]
**Primary takeaway:** [What the audience walks out believing or doing]
**Primary plug:** [Book, course, next event; where to send them]

## Timing sheet
| Section | Minutes | Cumulative |
|---|---|---|
| Hook | 2:00 | 2:00 |
| Arc 1: [Title] | 5:00 | 7:00 |
| Arc 2: [Title] | 5:00 | 12:00 |
| Arc 3: [Title] | 5:00 | 17:00 |
| Close and CTA | 3:00 | 20:00 |

## The hook (2:00)
[300 to 400 words. Opens with a specific moment, a specific person, or a concrete question. Not "today I want to talk about...". The hook does 3 things: gets attention, previews the argument, earns the next 18 minutes.]

## Arc 1: [Title] (5:00)
**The story:** [400 to 500 words. One specific story that anchors this arc.]
**The move:** [The argument or shift this arc makes.]
**The bridge:** [One sentence into Arc 2.]

## Arc 2: [Title] (5:00)
**The story:** [400 to 500 words.]
**The move:** [The argument.]
**The bridge:** [One sentence into Arc 3.]

## Arc 3: [Title] (5:00)
**The story:** [400 to 500 words.]
**The move:** [The argument.]
**The bridge:** [One sentence into the close.]

## The close (3:00)
[400 to 500 words. Callback to the hook. State the primary takeaway. Deliver the plug. Land on a memorable line the audience will repeat.]

## Slide notes (approximately 1 slide per minute)
[Per-minute: a title, a visual direction, and any on-screen text. Not a slide deck. A starting point for the designer.]

## Rehearsal notes for the author
- [Anywhere the pacing is likely to run long.]
- [Anywhere the story needs a beat of silence.]
- [Anywhere to expect audience laughter or reaction.]
- [Anywhere to check the room and adjust.]
```

## Instructions

**Step 0. Lock six things.**

1. **The event.** Event name, date, format (main stage, breakout, virtual, workshop-style keynote).
2. **The length.** Target minutes. 15, 20, 30, 45, 60, 90.
3. **The audience.** Who is in the room? Founders? Real estate agents? Church leaders? Corporate executives? Be specific.
4. **The primary takeaway.** What does the audience walk out believing or doing? One sentence.
5. **The primary plug.** What are you moving? Book, course, next event, mailing list. Pick one primary.
6. **The output location.** Default: `speaking/keynotes/keynote-<event-slug>-<YYYY-MM-DD>.md`. Confirm or override.

**Step 1. Build the timing sheet first.** Divide the total length into the five sections (hook, 3 arcs, close). Standard split: 10% hook, 25% per arc, 15% close. Adjust for length (a 15-minute talk collapses the arcs; a 60-minute talk expands them or adds a fourth arc).

**Step 2. Draft the hook.** Open with a specific moment, a specific person, or a concrete question. The hook has to earn the next 18 minutes. Avoid: "today I want to talk about." "It's an honor to be here." "How many of you have...". Instead: drop the audience into a scene. Show a number that stops them. Ask the question the whole talk answers.

**Step 3. Draft each arc.** For each arc: pick the story first (from the author's hoard, material bank, or a fresh story they mentioned). The story anchors the arc. Then draft the move (the argument this arc makes). Then draft the bridge into the next arc.

**Step 4. Draft the close.** Callback to the hook. State the primary takeaway explicitly. Deliver the plug clearly (where to go, what to do next). Land on a memorable line. The last sentence is the sentence the audience quotes on the way out.

**Step 5. Draft the slide notes.** One slide per minute of talk, on average. For each slide: title, visual direction, on-screen text (if any). This is not a slide deck. This is a starting point for the visual designer.

**Step 6. Draft the rehearsal notes.** Where the pacing runs long. Where a beat of silence lands. Where to expect audience reaction. Where to check the room.

**Step 7. Voice check.** Scan against the voice corpus. The talk should sound like the author speaking, not a corporate script. Flag off-voice sentences.

**Step 8. Write the file.** Save to the output location. Deliver the path in chat.

**Step 9. Suggest next skills.** `brand-voice-consistency` for a second-pass voice polish. `evergreen-pipeline` when the talk airs to atomize the recording. `hoard` for capturing any new story the author lands on stage.

## Examples

**Example 1.** Author says "keynote script for the eXplore conference, 20 minutes, main stage." Skill fires. Locks the audience (5,000 real estate agents). Locks the plug (Fractional CAIO consultation). Drafts hook opening on the "Wednesday morning stand-up" story from the hoard. Three arcs. Close callbacks to the hook. Timing sheet totals 20:00.

**Example 2.** Author says "prep for keynote at Church Media Summit, 45 minutes." Skill fires. Locks the audience (church tech leaders). Locks the primary takeaway. Expands the arcs to 10 minutes each (45-minute shape). Adds a workshop-style beat in Arc 2 where audience does a 3-minute exercise.

**Example 3.** Author says "20-minute talk, I have four bullets, help me draft." Skill fires. Asks for the four bullets. Asks for the audience. Asks for the primary takeaway. Drafts the script.

## Composes with

- `evergreen-pipeline`. atomizes the recorded keynote into short-form pieces.
- `brand-voice-consistency`. voice-polish pass on the draft.
- `hoard`. captures any new story the author lands on stage.
- `launch-runway`. aligns the plug with the active launch calendar.
- `podcast-guest-prep`. the stories in the keynote seed podcast appearances.
