---
name: local-SEO
description: "Run a local SEO audit and produce the fix list for a small business's local search presence. Covers Google Business Profile completeness, name-address-phone consistency across citations, review velocity and response rate, local landing page structure, and the specific 'near me' and city-modifier keyword targets. Trigger phrases include 'local SEO', 'local search audit', 'Google Business Profile audit', 'GBP audit', 'local citations', 'near me search', 'city-modifier keywords', 'local ranking check'. Do NOT trigger for national SEO or content SEO (that is a different skill and a different discipline), or for a full paid SEO engagement (route to AI Expert Websites service line)."
---

LAST-VERIFIED: 2026-07-06. Source of truth: Brett K. Moore, AI Expert Marketplace v1.1.0.

This skill runs a local SEO audit on a small business's local search presence and produces a prioritized fix list.

Local SEO is a distinct discipline from national or content SEO. The rank drivers are Google Business Profile completeness, name-address-phone (NAP) consistency across citations, review velocity, review response rate, and localized landing page structure with city and neighborhood modifiers.

## When to use

- The operator runs a business with a physical service area (services, retail, professional practice, home services).
- The operator wants to appear in "near me" searches and city-modifier searches ("plumber in Greenville").
- The operator has a Google Business Profile that has not been actively maintained.
- The operator wants to know why they are not showing up in the local three-pack.

## When NOT to use

- The business is fully remote with no service area (national SEO is the discipline).
- The operator wants ranking for competitive national terms (different skill).
- The operator wants a full paid SEO engagement with monthly retainer (route to AI Expert Websites service line).

## Inputs the operator provides

- Business name (canonical form, verbatim).
- Physical address or service area.
- Primary category and secondary categories.
- Website URL.
- The top three services or products the operator wants to rank for.
- The top three neighborhoods, cities, or ZIP codes they serve.

## The audit checklist

Run each section. Report present / missing / needs fix.

### 1. Google Business Profile completeness

- Business name matches legal name (no keyword stuffing in the name — that is against Google's guidelines and can suspend the listing).
- Category is set correctly, with secondary categories added.
- Hours are current and accurate.
- Phone number matches the website phone number character-for-character.
- Service area (or address) is set.
- Attributes (accessible, women-owned, veteran-owned, etc.) are set truthfully.
- Photos are current (at minimum: exterior, interior, team, products or work samples). Update at least monthly.
- Products or services are listed with descriptions.
- The "from the business" description is written in the operator's voice with the target city or neighborhood named naturally.

### 2. NAP consistency

- Name-address-phone matches character-for-character across the website, GBP, Yelp, Facebook, Apple Maps, Bing Places, and the top three local citation sites for the operator's category.
- Report every mismatch.
- Prioritize the fix list by citation authority (Google > Apple > Bing > Yelp > category-specific).

### 3. Review velocity and response rate

- How many reviews in the last 90 days on GBP?
- How many are 4-star or higher?
- Are all reviews responded to within 48 hours?
- Is the operator asking every closed customer for a review with a structured ask?

### 4. Landing page structure

- Is there a dedicated landing page for each top service?
- Does each landing page name the service area (city, neighborhood) in the H1, in the first paragraph, and in the meta description?
- Is there a "service areas we serve" page or map embed?
- Are there schema.org LocalBusiness JSON-LD blocks on the homepage and service pages?

### 5. Keyword targets

Produce the target list:

- Service + city ("plumber Greenville")
- Service + neighborhood ("plumber Overbrook")
- "Near me" (Google handles the personalization; the operator just needs to rank for the un-modified service term in the target city)
- Long-tail intent ("emergency plumber open now")

## Output shape

```
LOCAL SEO AUDIT: [business name] — [date]

## Google Business Profile
- Present: [items]
- Missing: [items]
- Fix: [items with priority]

## NAP consistency
- Consistent: [count] citations
- Mismatched: [list with the mismatch and the fix]

## Reviews
- 90-day velocity: [N] reviews
- Response rate: [X]%
- Fix: [specific action]

## Landing pages
- Service pages present: [list]
- Service pages missing: [list]
- Schema.org markup: [present | missing]

## Keyword targets
- Priority 1: [service + city]
- Priority 2: [service + neighborhood]
- Priority 3: [long-tail intent]

## Top three fixes for this month
1. [fix + why it matters + owner]
2. [fix + why it matters + owner]
3. [fix + why it matters + owner]
```

## The GHL-native depth

For operators on GoHighLevel:

- Wire the review request ask into the post-service GHL automation.
- Use GHL's reputation-management dashboard to monitor review velocity.
- Trigger a Slack or SMS notification to the operator for any review below 4 stars so response time stays under 4 hours.

## Voice rules

- No em dashes.
- Named services, named cities. No "your local area."
- Do not recommend link buying, review buying, or any tactic against Google's guidelines.

## Related skills

- `ghl-workflow-templates` — for wiring the review ask automation.
- `brand-voice-consistency` — for the landing page copy.
- `hoard` — for saving the specific citation sites that produced the biggest ranking lift.
