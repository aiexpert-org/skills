---
name: listing-presentation
description: "Draft a listing presentation for a specific seller and property. Pulls a CMA framing, marketing plan, timeline, expected outcome range, and next steps into a one-page deck the agent can walk through with a seller in 30 minutes. Trigger phrases include 'listing presentation', 'prep for listing appointment', 'prep for listing appt', 'list presentation for', 'seller presentation', 'pitch this listing', 'walk me into a listing appointment', 'seller appointment coming up', 'CMA plus marketing plan', 'draft the listing pitch', 'get me ready for the listing appt', 'listing appointment at 4pm', 'competing for the listing', 'why should they list with me'. Fires for any agent preparing to sit with a homeowner and win the listing. Do NOT trigger when the seller already signed the listing agreement (route to transaction-milestones once the property goes under contract), when the agent is asking for a market-wide CMA with no seller context (route to a comp-lookup tool), or when the agent needs the neighborhood brief without the pitch (route to neighborhood-brief). Altitude is planning + execution stage. Output is a formatted presentation the agent can print, PDF, or read from a tablet."
---

LAST-VERIFIED: 2026-07-06. Source: BNB AI Solutions agent workflow patterns, standard NAR listing presentation frameworks, and Buddy Buck's Duvall-market listing appointment cadence.

Real estate agents lose listings to agents who are 5% more prepared. Sellers pick the agent who walks in with a specific plan for their specific house. This skill produces that plan.

Output is permanent per appointment. Presentation lives at `listing-presentations/{address}-{date}.md` in the agent's HQ. Optional PDF export via a script in the bundle's scripts folder.

## When to use

- Any listing appointment on the calendar.
- Re-listings after a prior agent's contract expired.
- FSBOs who agreed to sit down (route from `fsbo-outreach`).
- Referrals from past clients where the seller wants a specific pitch.

## When NOT to use

- Seller already listed. Move to `transaction-milestones` at mutual acceptance.
- Pure market analysis with no seller in the picture. Use a comp-lookup tool.
- Neighborhood brief for a buyer or general market inquiry. Route to `neighborhood-brief`.

## What you'll produce

```
LISTING PRESENTATION
{Seller name(s)}
{Property address}
{Appointment date and time}

WHY YOU ({Agent name})
{3 sentences on positioning: local expertise, track record, AI-native operator stack.}

WHAT THE HOUSE IS WORTH
{Suggested list price range: $X to $Y.}
{Rationale in 3 bullets.}

COMPARABLE SALES (last 90 days)
- {Address}: {$}, {beds/baths/sqft}, {DOM}, {sale-to-list ratio}. {One-line vs subject.}
- {3 to 5 comps.}

CURRENT ACTIVE LISTINGS (competition)
- {Address}: {$}, {DOM}. {How subject beats it.}
- {2 to 4 comps.}

MARKETING PLAN
- Professional photography: {when.}
- Video walkthrough: {yes/no, when.}
- 3D tour: {yes/no.}
- MLS launch date: {date.}
- Social launch: {platforms, cadence.}
- Print marketing: {yes/no.}
- Open house: {dates.}
- Broker's open: {date.}
- Email blast to sphere: {when.}

TIMELINE
- List: {date}
- First price adjustment window: {date if applicable}
- Under contract target: {date}
- Close target: {date}

EXPECTED OUTCOME RANGE
- Best case: sell in {N} days at {$}.
- Base case: sell in {N} days at {$}.
- Slow case: sell in {N} days at {$}.

NEXT STEPS
- {Item}: {Owner.}
- Sign listing agreement.
- Schedule photography.
- Discuss staging.

SUGGESTED NEXT SKILLS
- Signed the listing? Move to `transaction-milestones` once under contract.
- Need the neighborhood brief for the seller's follow-up questions? Run `neighborhood-brief`.
```

## Instructions

**Step 0. Lock four things.**
1. **Property.** Address, beds, baths, sqft, lot, year built, condition notes.
2. **Seller.** Name(s), motivation (relocating, downsizing, upsizing, investor), timeline urgency, prior selling history.
3. **Appointment context.** Competing agents (yes/no, who), how the appointment was earned (referral, past client, FSBO conversion, sphere).
4. **Data sources.** MLS access, tax records, agent's marketing template.

State back. Get a nod.

**Step 1. Pull the comparable set.** Last 90 days sold, half-mile radius, same property type, within 15% of subject sqft. Note DOM and sale-to-list ratio. Compute suggested list price range.

**Step 2. Pull the active competition.** Currently on market. Any listing the seller might compare against. Note which the subject beats on price per sqft, condition, or location.

**Step 3. Draft the marketing plan.** Ask the agent which of their marketing options apply to this property. Populate the standard checklist with dates.

**Step 4. Draft the timeline.** From market conditions and comp DOM, project list date, adjustment window, under-contract target, close target.

**Step 5. Draft the outcome range.** Three scenarios with concrete numbers. Do not oversell certainty.

**Step 6. Write the next steps.** Concrete owner-action list.

## Examples

**Example 1.** Agent says "prep for listing appt at 4pm today, 1247 Oak, sellers are the Kims." Skill fires. Asks for beds/baths/sqft. Pulls comps. Drafts the presentation with a $625K-$650K range and a 21-day list-to-contract timeline.

**Example 2.** Agent says "seller presentation for a re-list, prior agent's contract just expired." Skill fires. Asks why the prior listing failed. Drafts positioning that addresses the failed prior effort head-on.

**Example 3.** Agent says "walking into a listing appointment tomorrow, competing with 2 other agents." Skill fires. Emphasizes differentiation and pre-answers "why you over them."

## Composes with

- `neighborhood-brief`. for the seller's neighborhood-context questions.
- `open-house-plan`. flows into the marketing plan.
- `transaction-milestones`. activates once the seller signs.
- `fsbo-outreach`. feeds into this skill when a FSBO agrees to meet.
