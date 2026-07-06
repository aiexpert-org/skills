# Changelog. Real Estate Operator Bundle

All notable changes to this bundle are documented here. The bundle follows [semantic versioning](https://semver.org).

## [1.0.0] , 2026-07-06

Initial release.

### Added
- 13 skills: `showing-prep`, `mls-follow-up`, `deal-doc-review`, `referral-tracking`, `transaction-milestones`, `listing-presentation`, `buyer-consultation`, `open-house-plan`, `neighborhood-brief`, `agent-weekly-review`, `fsbo-outreach`, `handoff`, `hoard`.
- Install runbook at `install/INSTALL.md` covering plugin marketplace, curl script, and manual install paths.
- MIT + AI Expert commercial license split (see `LICENSE.md`).
- BNB AI Solutions perpetual royalty-free bundle grant.

### Compatibility
- Claude Code >= 1.0.0.
- Claude.ai (upload skills to personal skill area).
- Codex, Cursor, and any harness that reads the `SKILL.md` spec.

### Known limitations
- The `deal-doc-review` skill assumes state-standard contract forms (WA Form 21, TREC in TX, CAR RPA in CA). Skills targeted at other markets receive a "confirm state" prompt at Step 0.
- The `neighborhood-brief` skill relies on public data sources (GreatSchools, WalkScore, US Census, MLS aggregates). Data freshness depends on those sources.
- `hoard` writes to a monthly file at `sphere/YYYY-MM.md`. Buyers using the BNB AI Solutions AI Sphere vault get the structured schema; buyers without a vault get a starter file scaffold.

---

_Next planned release: 2026-08-01._
