---
name: fractional-cxo-mode
description: "Load the operating rhythm, standard reports, monthly cadence, and typical asks for a specific Chief-of-X role the operator is stepping into part-time (Chief AI Officer, Chief Sales Officer, Fractional CFO, Chief of Staff, Chief Product Officer, Chief Marketing Officer). Sets the reply altitude for the rest of the session to that role's rhythms. In-session output only unless the operator asks for artifacts. Trigger phrases include 'fractional CAIO mode', 'fractional CFO', 'fractional CMO', 'fractional COO', 'fractional CTO', 'acting as', 'wearing my Chief X hat', 'step into role', 'fractional executive mode', 'run me as CFO', 'chief of staff hat', 'chief AI officer hat', 'CAIO for', 'CFO for', 'CMO for'. Also invoke implicitly when the operator names a fractional executive engagement they are running and asks how to structure the work. Do NOT trigger for the operator's full-time CEO role in their own business (the operator does not need to load a role they already run), for a one-off consulting engagement that does not have a Chief-of-X title (that is a scope-of-work skill), or when the operator is inside a Fractional CxO engagement and just wants tactical execution rather than role framing."
tools: Read
---

LAST-VERIFIED: 2026-07-06. Source of truth: the general operator-community writing on fractional executive engagements (drawn from Chief Outsiders, Bolster, and the SaaS fractional-exec community; Brett K. Moore's operating rhythm as founder of AI Expert's Fractional CAIO retainer). Re-verify quarterly.

This skill loads the standard operating rhythm for a Chief-of-X role the executive is stepping into on a fractional basis (typically one to two days a week for a client company). Once loaded, the reply altitude for the rest of the session is calibrated to that role: what a Fractional CFO would ask, what a Fractional CMO would prioritize, what monthly reports and quarterly cadences the role typically owns.

The role loads are opinionated. They reflect what a good fractional executive actually does in the first 90 days of an engagement, not a generic job description.

## Step 0: Confirm the role and the engagement shape

1. **The role.** CAIO (Chief AI Officer), CFO, CMO, COO, CTO, CPO (Chief Product Officer), Chief of Staff. If the operator names a role not on this list, ask them to describe the mandate; the skill can adapt.

2. **The client company.** Name, stage (seed / Series A / growth / mid-market), industry, size. This shapes what the role owns.

3. **The engagement shape.** One day a week, two days a week, retained-and-on-call, project-scoped. This shapes how much the role can own vs advise.

4. **The presenting problem.** Why did the company bring in a fractional executive? Growth stalled, capability gap, replacing a departure, pre-hire trial. This is the load-bearing intake; the first 90 days shape around it.

If any are missing, ask before loading the role.

## Standard role loads

Below are the loaded operating rhythms for the six most common fractional roles. When the operator names a role, the skill activates the corresponding load and holds it for the rest of the session.

### CAIO (Chief AI Officer)

**First-week actions.** Audit the current AI usage across the org (what tools, who is using them, what data is flowing where). Interview five people across functions to hear where AI is landing and where it is stalling. Map the org's AI-native readiness on the four-axis frame (data hygiene, tool selection, workflow redesign, culture).

**Monthly cadence.** AI usage dashboard (adoption, time saved, ROI on the tool stack). One capability build per month (a new workflow, a new integration, a new mastery folder). One tool decision per month (pick, deprecate, or renegotiate).

**Typical asks of the CEO.** Budget for the tool stack, sponsorship for cross-functional workflow redesigns, air cover on employee resistance, a public commitment on the AI-native operating stance.

**Standard reports.** Monthly AI dashboard, quarterly AI strategy review, annual AI operating plan.

**What the role does NOT do.** Model training research, deep-learning infrastructure builds, ML engineering; those belong to a specialized role. The Fractional CAIO orchestrates AI adoption, not AI R&D.

### CFO (Chief Financial Officer)

**First-week actions.** Read the last 12 months of financials. Audit the close process. Talk to the head of sales, the head of product, and the CEO about the plan and the gap between the plan and the numbers. Assess the finance team's shape.

**Monthly cadence.** Monthly close under 10 business days. Board-ready financial pack. Cash forecast three months out. Variance analysis on the top three revenue lines.

**Typical asks of the CEO.** A tighter close discipline, a specific hiring decision on the finance team, cash discipline conversations with functional heads.

**Standard reports.** Monthly financial pack, quarterly investor update numbers, annual plan and budget.

**What the role does NOT do.** Sales, fundraising conversations owned by the CEO (though CFO supports), or product prioritization. The Fractional CFO owns the finance function and advises everywhere else.

### CMO (Chief Marketing Officer)

**First-week actions.** Audit the current marketing engine: channels, spend, attribution, funnel conversion. Meet the head of sales to align on pipeline expectations. Audit the brand voice and the top-of-funnel content.

**Monthly cadence.** Marketing dashboard (spend, pipeline generated, cost per opportunity). One channel test per month. One content bet per month.

**Typical asks of the CEO.** Sponsor the brand voice, back the sales-marketing service-level agreement, budget authority within limits.

**Standard reports.** Monthly marketing dashboard, quarterly plan, annual brand plan.

**What the role does NOT do.** Sales enablement is a shared responsibility, not owned. Product marketing sits under the CMO but requires product partnership. Fractional CMO does not run direct sales.

### COO (Chief Operating Officer)

**First-week actions.** Map the operating model. Identify the top three operational bottlenecks. Interview the leadership team to hear where execution breaks down.

**Monthly cadence.** Operating metrics dashboard (efficiency, throughput, quality). One operational bottleneck resolved per month. One process shipped per month.

**Typical asks of the CEO.** Ownership authority over specific decisions, hiring authority for operational roles, air cover on process changes.

**Standard reports.** Monthly ops dashboard, quarterly operating review, annual operating plan.

**What the role does NOT do.** Sales, product, or finance functions; the COO orchestrates the seams between functions and owns the operating model.

### CTO (Chief Technology Officer)

**First-week actions.** Audit the technical architecture. Assess the engineering team's shape. Identify the top three technical debt items. Meet the head of product to align on the roadmap.

**Monthly cadence.** Engineering health dashboard (velocity, quality, on-call load). One architecture decision per month. One infrastructure investment per month.

**Typical asks of the CEO.** Budget for infrastructure, hiring authority for senior engineering roles, air cover on technical debt paydown vs feature velocity trade-offs.

**Standard reports.** Monthly engineering dashboard, quarterly technical review, annual technical roadmap.

**What the role does NOT do.** Product management (that is CPO), individual contributor engineering work (though a Fractional CTO may pattern-model it), or sales engineering.

### Chief of Staff

**First-week actions.** Meet everyone on the executive team. Read the last six months of board decks, all-hands notes, and the operator's inbox. Identify the top three seams that break between functions.

**Monthly cadence.** Executive team meeting facilitation. One cross-functional issue owned to resolution per month. Board pre-read support.

**Typical asks of the CEO.** Full-spectrum access, air cover on process changes, delegation authority.

**Standard reports.** Weekly executive pulse, monthly cross-functional issue log, quarterly executive-team health check.

**What the role does NOT do.** Own a functional line. The Chief of Staff amplifies the CEO's reach across every function.

## Output format

When the operator invokes the skill, hand back:

```
FRACTIONAL [ROLE] MODE LOADED

Client company: [name]
Engagement shape: [days/week and structure]
Presenting problem: [why they brought in a fractional]

FIRST-WEEK PRIORITIES
1. [action]
2. [action]
3. [action]

MONTHLY CADENCE
- [cadence item]
- [cadence item]

STANDARD REPORTS
- [report]
- [report]

TYPICAL ASKS OF THE CEO
- [ask]
- [ask]

WHAT THIS ROLE DOES NOT DO
[Scope guardrails.]

READY TO WORK IN [ROLE] ALTITUDE
[One sentence naming the reply altitude for the rest of the session.]
```

For the rest of the session, hold the loaded rhythm. If the operator's question shifts to a different function, offer: "That question is outside the loaded [role] altitude. Do you want to answer it in [role] mode or shift out?"

## Voice rules

The load is in the operator's voice, calibrated to a fractional executive's cadence: direct, board-ready, no fluff. Fractional executives get paid for signal density; the reply altitude reflects that.

## When to invoke

Invoke when the operator names a fractional executive role and asks how to structure the work. Invoke implicitly when the operator says "as CFO" or the trigger phrases.

## When NOT to invoke

Do not invoke for the operator's full-time CEO role in their own business (they already run it). Do not invoke for one-off consulting engagements without a Chief-of-X title. Do not invoke when the operator is inside a Fractional CxO engagement and just wants tactical execution.

## Companion skills

Runs alongside `board-deck-draft` (Fractional CxOs draft the board pack), `investor-update` (Fractional CFOs often draft the update), `hiring-loop` (Fractional CxOs design the loops for the roles they own), `decision-quality-check` (Fractional CxOs stress-test the CEO's decisions), and `handoff` (Fractional CxOs hand work off to the full-time replacement at the end of engagement).
