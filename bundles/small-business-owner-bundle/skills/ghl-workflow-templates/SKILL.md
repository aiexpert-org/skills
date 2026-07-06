---
name: ghl-workflow-templates
description: "Ship a ready-made GoHighLevel workflow for a common SMB flow. Covers order confirmation, kickoff scheduling, dunning, review request, referral capture, appointment reminder, no-show recovery, upsell after purchase, subscription cancellation save, and lead nurture. Outputs the trigger, action steps, wait times, message templates, and step-by-step click instructions to build it in the operator's GHL sub-account. Trigger phrases include 'GHL workflow', 'automate this in GHL', 'set up a workflow for', 'GHL template', 'high level workflow', 'GHL automation', 'build the automation for', 'workflow for [order confirmation / kickoff / dunning / review / referral]', 'automate the customer flow for', 'set this up in high level'. Use when the operator has a repeatable customer flow they want to automate. Do NOT trigger when the operator is asking about GHL as a platform generally, when the flow is one-off and not repeatable, or when the operator's tools stack does not include GHL (route to their platform, e.g. HubSpot, Zapier)."
---

LAST-VERIFIED: 2026-07-06. Source of truth: GHL platform docs as of 2026-07, Brett K. Moore ghl-master and ghl-mastery skills in the vault.

This skill turns a described flow into a shippable GHL workflow. Small business owners buy GHL, then use 5% of it because building workflows is intimidating. This skill removes the intimidation. The operator describes the flow in plain English; the skill hands back the trigger, the actions, the delays, the message templates, and the click path in the GHL UI.

Output: a Markdown workflow spec plus a step-by-step build guide.

## When to use

- The operator has a repeatable flow they run manually (kickoff, dunning, review requests).
- The operator wants to automate an appointment reminder cascade.
- The operator lost a customer and wants a save flow.
- The operator wants to capture referrals systematically after purchase.

## When NOT to use

- The operator uses HubSpot, ActiveCampaign, or Zapier as their primary automation tool.
- The flow is a one-time send, not repeatable.
- The operator is asking about GHL as a product ("should I use GHL?"). That's a platform selection question.
- The workflow needs custom code or a private API integration outside GHL's native surface.

## What you'll produce

A workflow spec in this shape:

```
GHL WORKFLOW: [Name]

TRIGGER
- Type: [Form submitted / Order placed / Appointment booked / Tag added]
- Filter: [any conditional logic]

STEP 1: [Action name]
- Type: [Send SMS / Send Email / Wait / Add Tag / Update Contact / Webhook]
- Wait: [instant / X hours / X days]
- Template: [message body]

STEP 2: ...

BUILD PATH (in GHL UI)
1. Automation > Workflows > Create Workflow > Start from Scratch
2. Add Trigger: [click path]
3. Add Action: [click path]
4. ...

TEST PLAN
- Enter test contact
- Confirm messages fire
- Confirm tags apply

SUGGESTED NEXT SKILLS
- Want to draft the message copy in your voice? Run `ghost-writer-me`.
- Want to log this workflow as a locked automation decision? Run `decision-log`.
```

## Instructions

**Step 0. Lock four things.**
1. **The flow.** Which common flow is being built? Confirm one of the templates below or capture a custom flow.
2. **The trigger.** What event kicks off the automation?
3. **The channel mix.** SMS, email, or both? What's the operator's stance on aggressive follow-up cadence?
4. **The voice.** Which voice do the messages use? Load the operator's voice canon or ask.

**Step 1. Load the template.** Templates covered:
- **Order confirmation.** Trigger: order placed. Sends receipt SMS + email, adds "customer" tag, starts onboarding sequence.
- **Kickoff scheduling.** Trigger: paid invoice. Sends kickoff booking link, 3 reminders, escalates to owner if unbooked at day 7.
- **Dunning.** Trigger: payment failed. Sends polite retry email + SMS at day 1, day 3, day 7. Escalates to owner at day 10.
- **Review request.** Trigger: service delivered tag applied. Waits 3 days. Sends review link (Google + Yelp + Facebook rotation).
- **Referral capture.** Trigger: 5-star review left OR positive NPS. Sends referral offer with unique code.
- **Appointment reminder.** Trigger: appointment booked. Sends confirmation immediately, reminder 24h before, reminder 2h before.
- **No-show recovery.** Trigger: appointment marked no-show. Sends re-book link within 15 min, escalates to owner if unbooked at 24h.
- **Post-purchase upsell.** Trigger: order tag applied. Waits 7 days. Sends related-product offer with time-limited discount.
- **Cancellation save.** Trigger: cancel-subscription form submitted. Fires save-offer sequence over 3 days.
- **Lead nurture.** Trigger: form submission or lead-magnet download. 5-touch educational sequence over 14 days.

**Step 2. Customize the template.** Replace placeholders with the operator's specifics: business name, offer name, price, timing. Load the operator's voice canon and rewrite message bodies in voice.

**Step 3. Draft the click path.** GHL UI is menu-driven and click paths change. Use the current 2026-07 UI as documented at highlevel.com. If the UI shifted, describe the intent and let the operator find the current button.

**Step 4. Deliver the test plan.** Test steps the operator runs before turning the workflow live for real customers. Enter test contact, confirm messages fire, confirm tags apply.

**Step 5. Offer next moves.** Rewrite the message bodies in voice? Log this workflow as a locked automation decision? Ship a companion analytics dashboard?

## Examples

**Example 1.** Operator says "set up a review request workflow in GHL." Skill fires. Loads review-request template. Customizes for the operator's Google Business Profile. Delivers the workflow spec + 8-step click path. Operator builds it in 12 minutes.

**Example 2.** Operator says "I need to automate my dunning flow, payments are failing and I'm losing customers." Skill fires. Loads dunning template with 3-touch retry sequence. Delivers messages + click path.

**Example 3.** Operator says "build the automation for referral capture after a 5-star review." Skill fires. Loads referral-capture template with unique code generation via GHL custom fields.

## Composes with

- `ghost-writer-me`. drafts message copy in operator voice.
- `cold-outreach-discipline`. verifies sender reputation before any workflow that sends to cold contacts.
- `decision-log`. logs the automation as a locked business decision.
