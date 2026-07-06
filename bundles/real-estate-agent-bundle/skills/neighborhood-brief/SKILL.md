---
name: neighborhood-brief
description: "Generate a neighborhood brief for a buyer, seller, or referral partner. Pulls schools, comparable sales activity, market temperature (buyers or sellers market), HOA notes, commute times to specified anchors, and community vibe (parks, dining, walkability, community events). Uses public data sources only. Trigger phrases include 'neighborhood brief', 'area analysis for', 'market brief on', 'neighborhood report', 'community overview', 'brief me on this neighborhood', 'what should I know about this area', 'client asking about this neighborhood', 'is this a good area', 'schools in this zip', 'commute from this neighborhood to', 'HOA info for this subdivision', 'walkability in this area', 'give me a hyperlocal brief', 'send my buyer a neighborhood overview'. Fires for buyer education, seller pitch prep, or a referral partner asking for background on an area. Do NOT trigger when the agent is asking for a full listing presentation (route to listing-presentation), when the agent is running a full CMA on a specific property, or when the agent wants a general market forecast beyond a specific neighborhood. Altitude is planning + execution stage. Output is disposable to permanent depending on use: in-session for one-off questions, saved to buyers/{name}/neighborhoods/{name}.md when the agent wants to share with a buyer."
---

LAST-VERIFIED: 2026-07-06. Source: BNB AI Solutions hyperlocal community resource thesis (livinginDuvall.com model), Buddy Buck's neighborhood positioning patterns, and standard public data sources (GreatSchools, WalkScore, US Census, MLS aggregates).

Real estate agents win with hyperlocal knowledge. A buyer from out of state has no context for the neighborhood; the agent's job is to compress everything the buyer needs to know into 5 minutes of reading. This skill produces that brief.

Output axis depends on use. In-session for the agent's quick prep. Permanent when saved to a buyer's folder for sharing.

## When to use

- Buyer asking about a specific neighborhood.
- Seller wanting to understand where their area sits in the broader market.
- Referral partner asking for background on where their client is moving.
- Content generation for a hyperlocal community resource page.

## When NOT to use

- Full CMA on a specific property. Different skill / different scope.
- Listing presentation to a seller. Route to `listing-presentation` (which pulls a neighborhood brief inside its process).
- General market forecast beyond a specific neighborhood. Out of scope.

## What you'll produce

```
NEIGHBORHOOD BRIEF
{Neighborhood name or zip code}
Prepared for: {Buyer / Seller / Partner name}
Date: {YYYY-MM-DD}

ONE-LINE READ
{15-word summary of what this neighborhood is.}

MARKET TEMPERATURE (last 90 days)
- Median sale price: ${}
- Median DOM: {}
- Sale-to-list ratio: {}
- Homes sold: {}
- Homes currently active: {}
- Absorption rate: {months of inventory}
- Buyers vs sellers market: {}

SCHOOLS
- Elementary: {name, rating}
- Middle: {name, rating}
- High: {name, rating}
- Private options within 5 miles: {names}
- School district notes: {}

HOA (if applicable)
- HOA name: {}
- Monthly dues: {}
- What's included: {}
- Rules of note: {}

COMMUTE
- To {anchor 1}: {drive time / transit time}
- To {anchor 2}: {}
- Traffic pattern notes: {}

COMMUNITY VIBE
- Walkability score: {}
- Dining nearby: {}
- Parks and open space: {}
- Community events: {}
- Notable local businesses: {}
- What locals love: {}
- What locals wish were different: {}

WHO THRIVES HERE
{One sentence on the archetypal resident: young families, empty nesters, remote workers, retirees.}

BUYER-FIT SIGNALS
- If the buyer values {X}, this neighborhood is a {yes / maybe / no}.
- If the buyer values {Y}, this neighborhood is a {}.

SELLER-FIT SIGNALS
- Time-to-sell expectation: {days}.
- Buyer pool at current price: {thin / moderate / deep}.
- Best marketing angles: {}.

DATA SOURCES USED
- {source 1}, {source 2}, {source 3}. Last verified: {date}.

SUGGESTED NEXT SKILLS
- Buyer wants to see homes here? Run `showing-prep` for a specific listing.
- Seller wants a listing pitch based on this area? Run `listing-presentation`.
```

## Instructions

**Step 0. Lock four things.**
1. **Neighborhood target.** Zip code, subdivision name, or well-known neighborhood label. If ambiguous, ask the agent to disambiguate.
2. **Audience.** Buyer, seller, referral partner, agent self-education, content generation. Different audiences get different emphasis.
3. **Buyer context if applicable.** Family status, commute anchor, price range, must-haves. Pulls from `buyers/{name}/profile.md` if it exists.
4. **Data source access.** Ask which of: MLS export, tax records, WalkScore, GreatSchools, GoogleMaps. Note gaps.

State back. Get a nod.

**Step 1. Compute market temperature.** Pull last 90 days sold, active listings, and cancellations. Compute median sale price, median DOM, sale-to-list ratio, absorption rate. Rate as buyers market (>6 months inventory), balanced (3-6), sellers market (<3).

**Step 2. Pull school data.** Elementary, middle, high with ratings. Note the assigned school district and any private options nearby.

**Step 3. Pull HOA if applicable.** Name, dues, what's included, notable rules (rental restrictions, pet limits, architectural review).

**Step 4. Compute commute.** For each buyer-relevant anchor, drive time at peak and off-peak. Note transit options.

**Step 5. Capture community vibe.** WalkScore, dining, parks, community events, notable local businesses, what locals love and complain about. This is the section that separates a data dump from a brief that a human wants to read.

**Step 6. Rate the buyer-fit and seller-fit signals.** Explicit yes/no/maybe against each buyer priority. Explicit market read for sellers.

**Step 7. Cite sources and date the brief.** Data goes stale fast in real estate.

## Examples

**Example 1.** Agent says "brief me on Snoqualmie Ridge for the Ridgeways." Skill fires. Reads Ridgeway profile (2 kids, tech worker, commute to Bellevue). Produces the brief with commute time to Bellevue emphasized.

**Example 2.** Agent says "client asking about schools in Duvall." Skill fires. Focuses on the schools section, keeps market temp brief.

**Example 3.** Agent says "neighborhood report for a seller in Redmond Ridge." Skill fires. Emphasizes seller-fit signals and buyer pool depth.

## Composes with

- `showing-prep`. deeper property-specific version of the same area context.
- `buyer-consultation`. captures the buyer's neighborhood criteria used here.
- `listing-presentation`. pulls neighborhood brief into the seller pitch.
- `open-house-plan`. pulls community vibe into the promotion copy.
