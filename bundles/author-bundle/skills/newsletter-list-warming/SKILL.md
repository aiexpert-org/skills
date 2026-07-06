---
name: newsletter-list-warming
description: "Warm the author's email newsletter list ahead of a launch, event, or offer. Produces the 30-day warming sequence, the 7-day pre-launch build, and the launch-week email cadence. Distinct from a broadcast blast: this skill re-engages the list by giving before asking, so the launch send lands on a warmed audience rather than a cold one. Trigger phrases include 'warm my list', 'newsletter warming', 'pre-launch email sequence', 'list warming', 'warm the newsletter', 'launch runway emails', 'newsletter re-engagement'. Do NOT trigger for a single broadcast blast (that is a targeted send) or for a full launch runway (route to `launch-runway`, which this skill is a component of)."
---

LAST-VERIFIED: 2026-07-06. Source of truth: Brett K. Moore, AI Expert Marketplace v1.1.0.

This skill warms an author's email newsletter list ahead of a book launch, event, or offer. Warming = giving before asking, so the launch send lands on a re-engaged audience.

The alternative — sending a launch email to a cold list that has not heard from the author in 90 days — is where most author launches fail. Open rates crash. Unsubscribes spike. The list itself gets deprioritized by the ESP. This skill prevents that.

## When to use

- The author is 30 to 45 days out from a book launch, event, or offer.
- The author's list has been idle for more than 30 days.
- The author wants the launch email to land on a warm list, not a cold one.

## When NOT to use

- The list is already warm (weekly cadence, high engagement) — send a one-off launch email is fine.
- The launch is more than 60 days out (too early to start warming; start when 30 days out).
- The author wants a single broadcast blast (that is a different, one-off send).

## Inputs the operator provides

- List size and current engagement rate.
- Time since last send.
- Launch date and offer.
- The author's three most valuable pieces of unshared content (drafts, essays, chapter excerpts, frameworks).
- Any planned events or public moments during the warming window.

## The 30-day warming sequence

### Days 30 to 21 (week 1) — give without asking

Two sends this week, both giving. No mention of the upcoming launch.

- **Send 1 (day 30).** A "here's what I've been thinking about" long-form email. 800 to 1,200 words. Author's actual voice. No CTA.
- **Send 2 (day 25).** A useful framework, checklist, or tool the reader can use immediately. 400 to 600 words. Soft CTA to reply with what they think.

### Days 20 to 14 (week 2) — signal the launch is coming

One send this week. Mention the launch is coming, but do not ask for anything yet.

- **Send 3 (day 17).** "Here's what I've been building and why." A behind-the-scenes email on the book. What was hard about writing it, what changed the author's mind mid-draft, what the reader will get from it. Signal: "I'll share more in the coming weeks."

### Days 13 to 7 (week 3) — build anticipation

Two sends this week.

- **Send 4 (day 12).** A chapter excerpt or a chapter opening. Give the reader something real from the book.
- **Send 5 (day 8).** An endorsement quote or reader testimonial (if any exist) plus a specific date the launch happens. Ask readers to save the date.

### Days 6 to 0 (launch week)

Three sends this week: launch morning, day 3, and last-chance.

- **Send 6 (launch day, morning).** The launch email. Direct ask. Buy link, launch bonus, one clear CTA.
- **Send 7 (launch day + 3).** Social proof. What buyers are saying. Second ask.
- **Send 8 (launch day + 6).** Last-chance email if the launch has a window (bonus expires, price rises, event enrollment closes).

## Output shape

```
NEWSLETTER LIST WARMING: [book / event / offer] — [launch date]

## List state
- Size: [N]
- Engagement (open rate on last 3 sends): [X]%
- Days since last send: [N]

## The 30-day sequence

### Week 1 (give without asking)
- Send 1 (day 30): [subject line + first 200 words]
- Send 2 (day 25): [subject line + first 200 words]

### Week 2 (signal)
- Send 3 (day 17): [subject line + first 200 words]

### Week 3 (build)
- Send 4 (day 12): [subject line + first 200 words]
- Send 5 (day 8): [subject line + first 200 words]

### Week 4 (launch)
- Send 6 (launch day AM): [subject line + first 200 words + CTA]
- Send 7 (launch + 3): [subject line + first 200 words + CTA]
- Send 8 (launch + 6): [subject line + first 200 words + CTA]

## Expected engagement
- Open rate on send 1: [X]% (baseline)
- Open rate on send 6 (launch): [X]% (target, higher than baseline due to warming)

## Next skill
- Route to `launch-runway` for the full launch campaign integration.
- Route to `book-pitch-guest-appearance` for the parallel media push.
```

## The list-hygiene note

If the list has been idle for 90+ days, do a re-permission send before the warming sequence starts. Ask readers to click a "yes, keep me on the list" link. Anyone who does not click gets moved to a suppression list. This preserves the ESP's deliverability rating for the remaining warm subscribers.

## Voice rules

- No em dashes.
- Do not use "friend" as a greeting. Use the reader's first name or no greeting.
- Do not oversell the book in the warming sends. The whole point is to give first.
- Do not mass-personalize with brackets. Send in real, specific language.

## Related skills

- `launch-runway` — for the broader launch campaign.
- `evergreen-pipeline` — for the post-launch nurture.
- `book-endorsement-outreach` — for the endorsement quotes used in send 5.
- `hoard` — for saving the subject lines that produced the highest open rates.
