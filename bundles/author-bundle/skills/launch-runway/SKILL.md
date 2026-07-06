---
name: launch-runway
description: "Plan an 8-week runway backwards from a book, course, or product launch date. Produces weekly focus targets, a prelaunch waitlist plan, a launch-week cadence, and a 4-week post-launch nurture plan. Reads the author's active surfaces (podcast, keynotes, newsletter, social channels) and books them against the runway. Trigger phrases include 'launch runway', 'book launch plan', 'course launch', 'product launch calendar', '8-week launch', 'launch plan for [product]', 'runway for the [book/course]', 'plan the launch', 'launch calendar', 'countdown to launch', 'book launch runway', 'course launch cadence'. Use when the author has a launch date locked and needs a working runway. Do NOT trigger when the launch date is not set yet (ask for the date first), when the author is drafting a single launch email (route to ghost-writer-me in Essential Layer or a copy skill), or when the launch is a keynote (route to keynote-script). Altitude: platform + planning. Output: a runway plan saved to the operator's HQ."
---

LAST-VERIFIED: 2026-07-06. Source of truth: Brett K. Moore's launch pattern used across AI Expert Quick Start rollout, Legacy Publishing author launches, and BNB AI Solutions Agent AI Native launch. Also references Jesse Rhodes Jr's book launch cadence and PodcastNetwork.org's Pre-Sold Author Package methodology. Re-verify when PodcastNetwork.org launch playbook v0.1 ships.

This skill turns "I'm launching October 15" into a working 8-week runway. Every launch that doesn't have a runway becomes a scramble in the last two weeks and a fizzle after launch day. The runway front-loads the audience-building work, sequences the plug across the author's active surfaces (podcast appearances, keynotes, newsletter, thought-leadership posts), and preserves the 4-week post-launch nurture window that determines whether the launch is a spike or a curve.

Output: a `launch-runway-<product-slug>-<YYYY-MM-DD>.md` file at the operator's canonical location (default: `launches/<product-slug>/launch-runway.md`).

## When to use

- The author has a launch date locked (book, course, product, event) 6 to 12 weeks out.
- The author is between launches and wants to plan the next one.
- The author has run launches before that fizzled and wants a working plan.
- The author is co-launching with a partner and needs a shared runway.

## When NOT to use

- The launch date is not set yet (ask for the date first).
- The author is drafting single-piece launch copy (a launch email, a sales page). Different shape.
- The launch is a keynote (route to `keynote-script`).
- The launch is a podcast appearance (route to `podcast-guest-prep`).

## What you'll produce

```
# LAUNCH RUNWAY: [Product name]

**Launch date:** [Date]
**Product:** [Book, course, product, event, program]
**Price:** [If applicable]
**Where the launch lives:** [URL, page, platform]
**Primary CTA:** [What the audience does]
**Success metric:** [How the launch is measured: preorders, first-week sales, waitlist signups]

## The runway at a glance

| Week | Focus | Deliverables |
|---|---|---|
| Week -8 | Waitlist setup + audience wake-up | Signup page, first email, LinkedIn tease |
| Week -7 | Podcast recording burst | 3 to 5 guest spots recorded |
| Week -6 | Newsletter thematic pivot | Two newsletter drops on the launch topic |
| Week -5 | Keynote or talk with the plug | On-stage or on-podcast plug |
| Week -4 | Preorder open (books) or beta open (course) | Landing page live, first offer email |
| Week -3 | Story sequence begins | 3 to 5 story-driven posts and emails |
| Week -2 | Testimonial and proof sequence | Testimonial requests out, proof drops |
| Week -1 | Countdown | Daily posts, final email, host asks |
| Week 0 (launch week) | Live launch | Launch day + day 3 + day 7 email sequence |
| Week +1 to +4 | Post-launch nurture | New reader / buyer nurture, ask for reviews |

## Week -8: Waitlist setup + audience wake-up
- **Focus:** [One sentence]
- **Deliverables:**
  - [Deliverable, owner, due]
  - [Deliverable, owner, due]
- **Skills to invoke:** [launch-runway, thought-leadership-post, ...]

[repeat for every week]

## Launch-week cadence

**Launch day.**
- 6am: [Newsletter drops]
- 9am: [LinkedIn post]
- Noon: [Podcast episode drops]
- 3pm: [Community drops]
- 6pm: [Ask for shares]

**Day +3.**
- [What ships]

**Day +7.**
- [What ships]

## Post-launch nurture (weeks +1 to +4)
- Week +1: [New buyer nurture]
- Week +2: [Review request sequence]
- Week +3: [Story-driven follow-up posts]
- Week +4: [Retention or upsell move]

## Author surfaces booked
- **Podcast guest spots:** [List]
- **Keynote appearances:** [List]
- **Newsletter drops:** [Count]
- **LinkedIn posts:** [Count]
- **Twitter/X threads:** [Count]

## Risks and watch-fors
- [Anywhere the author's calendar is likely to break]
- [Anywhere the audience will be fatigued]
- [Anywhere the plug is likely to feel heavy]

## Sanity checks
- Is the waitlist actually growing before launch? (Track weekly.)
- Is the podcast schedule holding? (Confirm 3 weeks ahead.)
- Is the launch page tested and working? (2 weeks before.)
- Is the CTA the right one? (Reconfirm 1 week before.)
```

## Instructions

**Step 0. Lock six things.**

1. **The launch date.** Specific date, not "October." If the author is fuzzy on the date, force the pin. The runway is date-anchored.
2. **The product.** Book, course, product, event, program. And the price if applicable.
3. **Where the launch lives.** The URL, the sales page, the platform. If it doesn't exist yet, that's a Week -8 deliverable.
4. **The success metric.** How the launch is measured. Preorders, first-week sales, waitlist signups, new members. Force a specific number if possible.
5. **The author's active surfaces.** Podcast (own or guest), keynotes, newsletter, LinkedIn, X, Instagram, YouTube. Which surfaces are live and posting.
6. **The output location.** Default: `launches/<product-slug>/launch-runway.md`. Confirm or override.

**Step 1. Draft the 8-week backwards.** Every week has a focus, deliverables, and a set of skills the author will invoke. Work backwards from launch day.

**Step 2. Front-load the waitlist and audience wake-up.** Week -8 is signup page live, first tease email, first LinkedIn tease. Every launch that skips this week fizzles.

**Step 3. Book the podcast burst in Week -7.** The author records 3 to 5 guest spots at Week -7 that will air Week -4 through Week 0. Podcast production timing matters. Book back-calculating from the air dates.

**Step 4. Sequence the plug across surfaces.** Week -5 is on-stage or on-podcast plug (whichever comes first). Week -4 is landing-page-live plus first offer email. Week -3 is story sequence. Week -2 is proof and testimonials. Week -1 is countdown. Week 0 is live launch.

**Step 5. Design the launch-week cadence.** Launch day: newsletter drop, LinkedIn post, podcast episode (if applicable), community drops, ask for shares. Day +3: milestone email. Day +7: recap and thank-you.

**Step 6. Draft the post-launch nurture (weeks +1 to +4).** New buyer nurture. Review request sequence. Story-driven follow-up posts. Retention or upsell move. This window separates spike launches from curve launches.

**Step 7. Book the author's surfaces.** List every podcast guest spot, keynote, newsletter drop, and social post the runway needs. Assign owners (author, VA, publisher, launch partner).

**Step 8. Draft the risks and watch-fors.** Where is the author's calendar likely to break? Where is the audience going to feel fatigued? Where is the plug going to feel heavy? Name them so the author has the mid-launch adjustment plan.

**Step 9. Add the sanity checks.** Weekly waitlist growth. Podcast schedule holding. Launch page tested. CTA reconfirmed. These are the milestones the author checks off week by week.

**Step 10. Write the file.** Save to the output location. Deliver the path in chat. Recommend the author add the launch date and key milestones to their calendar.

**Step 11. Suggest next skills.** `podcast-guest-prep` for each booked spot. `keynote-script` for each keynote in the runway. `thought-leadership-post` for the weekly post cadence. `testimonial-request` for Week -2. `evergreen-pipeline` for atomizing recorded content across the runway.

## Examples

**Example 1.** Author says "plan an 8-week runway for the book launch on October 15." Skill fires. Locks October 15. Product: book. Success metric: 500 preorders in first week. Surfaces: LinkedIn (weekly), newsletter (biweekly), 2 podcast appearances booked. Runway drafts back from October 15. Podcast burst Week -7. Preorder page live Week -4. Launch-week cadence. 4-week nurture.

**Example 2.** Author says "book launch plan, launching in 10 weeks." Skill fires. Reframes to 10-week runway (skill accommodates flexible length). Adds a Week -10 for foundation setup (waitlist page architecture, signup form, tag structure). Everything else shifts.

**Example 3.** Author says "course launch calendar for the Sprint program." Skill fires. Product: coaching program. Success metric: 15 first-cohort members. Surfaces: newsletter, LinkedIn, 3 podcast spots. Runway includes application-based enrollment cadence (open Week -4, close Week -1).

## Composes with

- `podcast-guest-prep`. every podcast spot in the runway.
- `keynote-script`. every keynote in the runway.
- `thought-leadership-post`. weekly post cadence during the runway.
- `testimonial-request`. Week -2 testimonial burst.
- `evergreen-pipeline`. atomizes recorded content into launch-week micro-content.
- `handoff`. hands specific runway weeks to a VA or launch partner.
