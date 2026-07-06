---
name: testimonial-request
description: "Draft a personalized testimonial request to a specific person (client, reader, podcast guest, program alum). Reads the author's voice corpus and the recipient's history with the author, then drafts a short, specific ask that tells the recipient exactly what to speak to. Not a template. Not a generic ask. Trigger phrases include 'testimonial request', 'ask for testimonial', 'request a review', 'quote request', 'endorsement ask', 'ask [name] for a testimonial', 'reach out to [name] for a quote', 'testimonial email to', 'endorsement for the book', 'book blurb request', 'blurb ask', 'ask for a review'. Use when the author needs a testimonial, quote, or endorsement from a specific person. Do NOT trigger when the author is drafting a batch request to many recipients (that's a launch email; route to a sequencing skill), when the author is asking for a book blurb from someone they haven't met (different pattern; needs a warm intro), or when the request is for a formal legal endorsement (not this skill). Altitude: platform. Output: a testimonial request email drafted in the author's voice, delivered in-chat."
---

LAST-VERIFIED: 2026-07-06. Source of truth: Brett K. Moore's testimonial-request pattern used across AI Expert clients (Emily Farmer, Buddy Buck), Legacy Publishing author launches, and the Session-997 program follow-up. Also references Jesse Rhodes Jr's client testimonial cadence.

This skill drafts a testimonial ask that lands. Generic asks ("would you be willing to write me a testimonial?") get generic testimonials, or worse, no reply. The pattern is specific: name what the recipient specifically saw the author do, tell them what to speak to, keep the ask short, make it easy to say yes. This is the same pattern that produces the endorsement quotes on the back of Legacy Publishing titles.

Output: a testimonial request email drafted in-chat (default) or saved to `content/testimonial-requests/<recipient-slug>-<YYYY-MM-DD>.md` if the author is running batches.

## When to use

- The author wants a testimonial from a specific person (client, reader, program alum, podcast guest).
- The author is prepping a launch and needs 5 to 10 fresh testimonials.
- The author is updating a sales page and wants to refresh the quotes.
- The author is asking for a book blurb from someone in their network.

## When NOT to use

- The author is drafting a batch template to send to many recipients at once (that's a sequencing skill).
- The author is asking a stranger for a blurb (needs a warm intro pattern first; not this skill).
- The author is asking for a formal legal endorsement (not this skill).
- The author is asking for a video testimonial with production timeline (different shape).

## What you'll produce

```
# TESTIMONIAL REQUEST: [Recipient name] for [Purpose]

**Recipient:** [Name, relationship to author]
**Purpose:** [Sales page, book back-cover blurb, program landing page, general use]
**Deadline:** [When the author needs the testimonial by]

## Draft email

Subject: [Short, specific subject line]

Hi [First name],

[Opening line. Personal. References something specific from the recipient's experience with the author. Not "hope you're well."]

[Middle paragraph. States the ask specifically. Tells the recipient what to speak to (2 to 3 concrete things they saw or experienced). Gives them permission to keep it short (2 to 4 sentences). Notes the deadline.]

[Optional: sample structure or a prompt if the recipient asks. Not a template to complete. A "here's the shape if it helps".]

[Closing line. Warm. Thanks in advance. Signs off in the author's normal way.]

[Signature]

## Format notes
- Length: [word count]
- Where the testimonial will live: [URL, back-cover, page]
- Follow-up cadence: [1 week if no response, then 2 weeks, then let it go]
```

## Instructions

**Step 0. Lock five things.**

1. **The recipient.** Full name, first name, relationship to author (client, reader, program alum, podcast guest, colleague, mentor).
2. **The recipient's history with the author.** What did they specifically see or experience? A specific coaching outcome, a specific chapter of the book they read early, a specific keynote they attended. This is the load-bearing input. If the author is fuzzy, force the specificity.
3. **The purpose.** Sales page, book back-cover blurb, program landing page, general use. Different purpose = different length and different framing.
4. **The deadline.** When does the author need the testimonial by? If launch is 4 weeks out, deadline is 2 weeks out.
5. **The output location.** Default: in-chat delivery. Override to `content/testimonial-requests/<recipient-slug>-<YYYY-MM-DD>.md` if the author is running batches.

**Step 1. Draft the subject line.** Short. Specific. Personal. Not "Testimonial request." Instead: "Quick ask for the launch on October 15" or "Small favor about the coaching program" or "Quote for the book back-cover."

**Step 2. Draft the opening line.** Reference something specific. Not "hope you're doing well." Instead: "That thing you said at the offsite last month has been rattling around in my head all week." Or: "Saw the win you posted on LinkedIn. Congrats." The opening earns the ask.

**Step 3. Draft the ask.** State the ask specifically. Tell the recipient what to speak to. Give them 2 to 3 concrete things they saw or experienced. Give them permission to keep it short (2 to 4 sentences is enough). Note the deadline.

Example ask shape: "For the launch of the book, I'm asking a small handful of people who've seen the work up close for a short back-cover quote. Would you be up for 2 to 4 sentences on what shifted for you during the Sprint program, specifically the offer sequence work in weeks 3 and 4? I'd love to have it by August 30 if you can, and no worries at all if not."

**Step 4. Draft the optional sample structure.** If the recipient asks "what should I say?" the author needs a follow-up. Include an optional shape: "If it helps, quotes like these usually land on: what was true before, what shifted, what's true now. Any of that lands." Not a template to complete. A shape.

**Step 5. Draft the close.** Warm. Thanks in advance. Signs off in the author's normal way (voice-check).

**Step 6. Voice check.** Scan the draft against the voice corpus. No banned words. No em dashes. Sounds like the author, not a marketing agency.

**Step 7. Deliver in-chat.** Draft ready to copy-paste. Include the format notes (word count, where the testimonial will live, follow-up cadence).

**Step 8. Suggest next skills.** `handoff` if the author is delegating the testimonial batch to a VA. `hoard` if the ask lands and produces a working template pattern the author will reuse. `launch-runway` if this is one testimonial in a launch-week 2 batch.

## Examples

**Example 1.** Author says "ask Buddy for a testimonial for the sales page." Skill fires. Loads Buddy's history with the author (co-founder relationship, BNB AI Solutions launch). Drafts email opening on the "napkin lunch" story. Ask is specific: "For the AI Expert Fractional CAIO page, would you write 3 sentences on what shifted for you after the first month of the retainer?" Deadline: 10 days. Voice-check clean.

**Example 2.** Author says "reach out to Michele for a book blurb." Skill fires. Loads Michele's Legacy Publishing engagement. Ask is specific: "Would you write 2 to 4 sentences on the developmental edit process, specifically the moment we broke the structural problem in chapter 5?" Deadline: 3 weeks before launch.

**Example 3.** Author says "request a review from Emily." Skill fires. Loads Emily's Create Church Media engagement (pro bono AI Expert client). Ask is specific: "For the AI Expert clients page, would you write 3 sentences on what shifted after we installed the Cowork workflow?" Includes the optional shape prompt because Emily has asked for it before.

## Composes with

- `launch-runway`. testimonials are a Week -2 deliverable in the standard runway.
- `brand-voice-consistency`. voice-check pass on the drafted email.
- `hoard`. captures the working ask shape for reuse across future asks.
- `handoff`. hands a testimonial batch to a VA for send-and-track.
