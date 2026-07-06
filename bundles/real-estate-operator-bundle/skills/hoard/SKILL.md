---
name: hoard
description: "Capture a piece of information into the agent's AI Sphere vault (or Notes / Drive / CRM if no vault yet). Voice-friendly. Turns a scattered thought, a client conversation snippet, a market observation, or a quick note into a structured, tagged entry the agent can find again months later. Trigger phrases include 'hoard this', 'save this to my sphere', 'add to my vault', 'capture this', 'log this note', 'remember this about this client', 'jot this down', 'note to self', 'save that for later', 'add this to my brain', 'sphere this', 'quick note', 'file this', 'stash this insight', 'this is worth remembering', 'add this to my knowledge base'. Fires on any raw signal the agent wants preserved without opening a formal skill flow. Do NOT trigger when the agent wants a full decision logged with rationale (a decision log is different), when the agent is running structured intake (route to buyer-consultation), or when the note is really a task the agent will act on today. Altitude is any stage. Output is permanent: appends to sphere/YYYY-MM.md or the equivalent in the agent's HQ, tagged with people, properties, and topics for retrieval. Inspired by Simon Willison's low-friction capture pattern. Adapted for the real estate agent's AI Sphere vault schema used inside BNB AI Solutions."
---

LAST-VERIFIED: 2026-07-06. Source: BNB AI Solutions AI Sphere vault schema (voice-input, tagged, retrieval-first), Simon Willison's low-friction capture pattern for personal knowledge management. Re-verify against the BNB AI Solutions sphere schema if it evolves.

Real estate agents accumulate signal every day and lose it because there's no place to put it. The Ridgeways mentioned they might sell their current home in 12 months , that's a $700K listing in a year if the agent captures it. This skill captures every scrap and tags it for retrieval.

Output is permanent. Monthly sphere file at `sphere/YYYY-MM.md`. Optional structured schema if the agent uses the BNB AI Solutions AI Sphere vault.

## When to use

- Any time the agent has a thought worth remembering.
- Client conversations that surface future-transaction signals.
- Market observations that don't need formal analysis right now.
- Voice memos dictated between showings.
- Quick notes about a referral partner, a listing, a competitor, an area trend.

## When NOT to use

- Formal decision with rationale. Use a decision log.
- Structured buyer or seller intake. Route to `buyer-consultation` or `listing-presentation`.
- Task the agent will act on today. Add to the calendar or CRM, not the sphere.

## What you'll produce

```
SPHERE ENTRY
Date: {YYYY-MM-DD HH:MM}
Source: {conversation / observation / voice memo / other}

TAGS
- People: {names}
- Properties: {addresses}
- Areas: {zip codes, neighborhoods}
- Topics: {future-transaction, market-signal, referral-thread, competitor, listing-idea}

RAW NOTE
{The agent's raw content, verbatim if voice, cleaned lightly for legibility.}

RETRIEVAL HOOKS
- Search terms this entry should surface on: {}
- Related entries in the vault: {links if known}

FOLLOW-UP TRIGGER (if any)
- {When this entry should surface again.}
- {What action, if any.}

SUGGESTED NEXT SKILLS
- Signal is transactional and near-term? Consider `showing-prep` or `listing-presentation`.
- Signal is a referral thread? Update via `referral-tracking`.
- Signal is worth a scheduled follow-up? Add to `agent-weekly-review` reminders.
```

## Instructions

**Step 0. Lock two things.**
1. **The raw content.** Whatever the agent said. Preserve verbatim if voice.
2. **Whether the agent has an AI Sphere vault or needs a starter file.** Check `sphere/` folder. If nothing exists, offer to scaffold `sphere/README.md` and a monthly file convention.

Two, not four, because low-friction capture is the whole point. Do not over-ceremony this.

**Step 1. Tag the entry.** Extract people mentioned, properties mentioned, areas mentioned, topics implied. Pattern-match against the agent's existing sphere if available.

**Step 2. Clean the raw note lightly.** If it was voice, fix obvious transcription errors but preserve the agent's language. Do not summarize.

**Step 3. Add retrieval hooks.** Terms the agent might search for later to find this entry. Not marketing language. Real search phrases.

**Step 4. Set a follow-up trigger if the entry hints at one.** "Ridgeways mentioned selling in a year" implies a follow-up 9-10 months from now. Set a reminder trigger if the agent nods.

**Step 5. Append to the sphere file.** Add to `sphere/YYYY-MM.md` in append-only fashion. Never rewrite older entries.

**Step 6. Reply with the entry ID and where it lives.** So the agent knows the capture worked.

## Examples

**Example 1.** Agent says "hoard this: the Ridgeways mentioned they might list their Bellevue place in a year." Skill fires. Tags: Ridgeway, Bellevue, future-transaction. Sets a follow-up trigger for 10 months out. Logs.

**Example 2.** Agent says "add to my vault: 98077 median DOM has crept up from 14 to 22 in the last 60 days." Skill fires. Tags: 98077, market-signal. Logs.

**Example 3.** Agent voice-dictates a 3-minute rambling note about a competing agent's marketing strategy. Skill fires. Tags: competitor, marketing. Cleans lightly. Logs.

## Composes with

- `referral-tracking`. sphere entries that surface referral threads flow here.
- `buyer-consultation`. sphere entries about a specific person feed the profile.
- `agent-weekly-review`. surfaces follow-up triggers due this week.
- `mls-follow-up`. future-transaction signals feed the nurture cadence.
