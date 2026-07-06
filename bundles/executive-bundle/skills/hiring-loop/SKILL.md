---
name: hiring-loop
description: "Design a role-specific interview loop: which interviews test which competencies, the scorecard rubric each interviewer uses, and the debrief structure the hiring manager runs afterward. Output goes to a disposable session-scoped path; the executive drops the polished version into their ATS or shared hiring folder. Trigger phrases include 'hiring loop for', 'interview loop design', 'how should I interview', 'scorecard for this role', 'debrief protocol', 'design the interview process', 'interview kit', 'interview panel design', 'we are hiring a', 'need to hire a', 'building the loop for', 'set up the interviews for', 'draft the scorecard', 'onboard a new interviewer'. Also invoke implicitly when the executive names a role they are opening and asks how to run the process. Do NOT trigger for a single quick reference-check conversation (that is a separate skill), for a comp negotiation or offer letter draft (different skill, different genre), or when the executive is running a proven internal loop and only wants a rubber-stamp check on their existing process."
tools: Read, Write
---

LAST-VERIFIED: 2026-07-06. Source of truth: the general operator community's converged practice on structured interviewing (Lever, Greenhouse, Ladders + operator-CEO writing), Brett K. Moore's operating rhythm. Adapted, not lifted, from any single trademarked framework. Re-verify quarterly against the state of interview practice.

This skill designs a role-specific interview loop. Given a role, it produces four artifacts: a competency map (which interviews test which competencies), interviewer briefs (what each interviewer runs and asks), a scorecard rubric (what "yes" and "no" mean for each competency), and a debrief structure (how the hiring manager runs the loop-close conversation).

Output goes to a disposable session-scoped path: `~/tmp/hiring-loop-<role-slug>-<YYYY-MM-DD>.md`. The permanent hiring folder lives wherever the operator's ATS or hiring shared drive is; the skill does not write there directly.

## Step 0: Confirm the six intake items

1. **The role.** Title, level, function. "Senior product manager, growth." "VP of Sales." "Chief of Staff." Specific.
2. **The team.** Which team the hire joins, who their manager is, who they will manage (if anyone).
3. **The must-have competencies.** Three to five. The hire must have all of them; missing any is a no. Executive names them.
4. **The nice-to-have competencies.** Two to four. The hire is stronger with these but the loop does not fail them for missing.
5. **The panel size.** How many interviewers, how many rounds, and how much total candidate time. Standard exec-role loop is five interviewers across two on-site days, roughly six hours of candidate time.
6. **The bar.** Is this a "meet the bar" hire or a "raise the bar" hire? Different signal thresholds.

If any of the six are missing, ask before designing.

## Standard loop shape

The loop has four kinds of interviews. Every loop has at least one of each.

**Screen (30 min, hiring manager).** Confirm interest, confirm baseline fit, confirm salary and location. Cheap round; kill or advance fast.

**Skill deep-dive (60 min, functional expert).** The one interview that tests the primary competency the role requires most heavily. For a VP of Sales, this is the sales-methodology deep-dive. For an engineering leader, this is the systems-design conversation. One interviewer with the deepest fluency in the competency.

**Structured interviews for supporting competencies (45 to 60 min each, one competency per interviewer).** Two to three of these. Each one tests one specific competency with a repeatable question set the interviewer runs on every candidate for this role. Structured means every candidate for the role gets the same questions in the same order.

**Cross-functional (45 min, an interviewer from a partner function).** Tests how the hire will work across functions. For a VP of Product, this is a marketing-VP conversation. For a CFO, this is a general-counsel conversation.

**Optional: executive / values (30 min, CEO or a co-founder for exec-level hires).** Tests fit with the operating culture and the specific bets the exec team is making.

## Output format

Return a Markdown document with four sections.

**Section 1: Competency map.**
A table listing each competency (must-have and nice-to-have), which interview round tests it, and which interviewer runs that round.

```
| Competency | Round | Interviewer role | Type |
|---|---|---|---|
| [name] | [round] | [role] | [must / nice] |
```

**Section 2: Interviewer briefs.**
For each interviewer, a mini brief:
- What competency they own.
- Three to five structured questions they ask every candidate.
- What "yes" evidence looks like (specific behaviors, specific answers).
- What "no" evidence looks like.
- The one signal that would be a hard-no even if the rest of the interview was strong.

**Section 3: Scorecard rubric.**
For each competency, a 1-to-4 scale with concrete descriptions of what each rating means. Not "strong / weak" but specific behavioral anchors.

```
Competency: [name]
1: [concrete no-hire evidence]
2: [concrete below-bar evidence]
3: [concrete at-bar evidence]
4: [concrete above-bar evidence]
```

**Section 4: Debrief structure.**
The order the hiring manager runs the loop-close conversation.
1. Each interviewer submits their scorecard before the debrief opens. This is the discipline that prevents groupthink.
2. In the debrief, each interviewer states their vote (hire / no hire) and one sentence of reasoning before any discussion opens.
3. Then discussion opens. The debrief lead is the hiring manager, not the highest-ranking person in the room.
4. The hiring manager makes the call. If the panel is split, the hiring manager owns the call.
5. If hire, the reference-check protocol runs next (out of scope of this skill).
6. If no hire, feedback goes back to the recruiter within 24 hours.

## Voice rules

The output is a working document, not customer-facing copy. Voice is concrete and specific. No vague competencies ("strong communicator" is banned; use "gives structured written updates to the CEO on a weekly cadence without prompting"). No banned vocabulary from the HQ router voice rules.

## Bias-mitigation reminders

Every loop the skill designs surfaces two reminders before ending.

First: structured interviews reduce hiring bias more than any other single intervention. If the operator wants the loop to feel more collegial and less rigid, the answer is not to loosen the structure; it is to loosen the tone inside the structure.

Second: scorecards submitted before debrief prevent anchoring. If the highest-ranking interviewer talks first in an unstructured debrief, the rest of the panel drifts to their vote. Enforce the pre-debrief submission.

## When to invoke

Invoke when the executive names a role they are opening. Invoke when the executive asks how to run a hiring process for a specific role. Invoke when the executive asks for a scorecard, a debrief structure, or an interview kit.

## When NOT to invoke

Do not invoke for reference-check design (different skill). Do not invoke for offer negotiation or comp discussions (different skill, different genre). Do not invoke when the executive has a proven loop and wants a rubber-stamp; that is a review conversation, not a design one.

## Companion skills

Runs cleanly with `decision-quality-check` at the moment the hiring manager is about to make the call, and with `hard-conversation` if the debrief involves telling an internal candidate they are not the right fit.
