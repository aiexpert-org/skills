---
name: glossary-builder
description: "Build and maintain a domain glossary (`glossary.md` at project root) so fresh agents, teammates, and future you speak the same language as the operator on day one. Captures every term of art, business jargon, product name, internal shorthand, and non-obvious noun in one machine-readable file that CLAUDE.md points at. Trigger phrases include 'build a glossary', 'glossary for this project', 'define our terms', 'domain terms', 'domain glossary', 'shared language', 'what does X mean here', 'canonical definitions', 'term of art', 'ubiquitous language', 'jargon file', 'business dictionary', 'onboarding glossary', 'start a glossary', 'add to glossary', 'term dictionary', 'lock our vocabulary', 'the agent keeps re-explaining X', 'we keep re-defining X every session'. Also invoke implicitly when a new domain term gets coined mid-session (product rename, new SKU, internal shorthand) or when a fresh project spins up and needs its lexicon pinned before real work begins. Writes and maintains a permanent artifact at `glossary.md` (project root), plus a one-line pointer inside `CLAUDE.md`. Do NOT trigger for one-off decision capture (route to `decision-log`), for voice or tone rules (route to `voice-corpus-builder`), for keeping CLAUDE.md itself clean (route to `claude-md-hygiene`), for session handoff (route to `handoff`), or when the operator wants a full brand style guide (that's a bigger artifact; the glossary is the noun layer only)."
---

LAST-VERIFIED: 2026-07-06. Source of truth: Matt Pocock's `/grill-with-docs` skill (see the YouTube walkthrough at youtube.com/watch?v=6BB6exR8Zd8) and the ubiquitous-language pattern from Eric Evans's Domain-Driven Design (the big blue book). Credit: Matt Pocock, aihero.dev, MIT licensed at github.com/mattpocock/skills. This Essential Bundle version extracts the ubiquitous-language half of Matt's skill and generalizes it from codebase glossaries to operator-domain glossaries. The interrogation half of Matt's skill lives separately as `interrogate-decision` in the Executive Bundle and the Author-Speaker-Coach Bundle. Re-verify if Matt ships a v2 or if the DDD community shifts the pattern.

Every business runs on jargon. PREP, Prepisode, Weekly Show, Fractional CAIO, Pipeline License, Pre-Sold Author Package, five-stage operator lens. Fresh agents don't know any of it. New teammates don't know any of it. Your Monday-morning self forgot half of it. This skill pins the vocabulary in one file so nobody has to re-explain it.

Output: a Markdown file at the project root, default filename `glossary.md`. If a project already uses `context.md` or `ubiquitous-language.md`, honor the existing filename. Permanent artifact. Lives with the project.

## When to use

- The operator or their AI keeps re-explaining what a term means across sessions.
- A new domain term just got locked (product rename, new SKU, coined internal phrase).
- A fresh project spins up and its lexicon needs to be captured before serious work begins.
- The operator hands work to a teammate or fresh agent and wants them to speak the language on day one.
- The AI is being verbose ("the video that is not connected to a lesson or a course") because it doesn't have the short form ("standalone video").
- The operator notices a term appearing three or more times in a session without a shared definition anchor.

## When NOT to use

- One-off decision capture. Route to `decision-log`.
- Voice, tone, banned words. Route to `voice-corpus-builder`.
- Keeping CLAUDE.md itself clean and current. Route to `claude-md-hygiene`.
- Session handoff. Route to `handoff`.
- A full brand style guide. That's a bigger artifact; the glossary is the noun layer only.

## What you'll produce

```
# Glossary
Project: [name]
Last updated: [YYYY-MM-DD]

## [Term]
Short definition. One sentence.
Long form. Two or three sentences on what this means, why it exists, and any edge cases.
Related: [other terms in this glossary]
See also: [file path or link if there's a fuller doc]

## [Term]
...
```

Alphabetical. Flat. No headers deeper than H2. Machine-readable is the point.

## The procedure

**Step 0. Detect the project shape.** Read the project's `CLAUDE.md` and any locked-decision docs. Look for an existing `glossary.md`, `context.md`, or `ubiquitous-language.md` at the project root. If one exists, load it and continue in append/refine mode. If none exists, start fresh.

**Step 1. Pull every candidate term.** From `CLAUDE.md`, `DECISIONS.md`, `LIVING-NOTES.md`, and any locked-decision files, extract every term of art, product name, internal shorthand, coined phrase, and non-obvious noun. Present the list to the operator for confirmation.

**Step 2. Sharpen fuzzy language.** For each term that's fuzzy or contested, ask one sharpening question ("does 'standalone video' mean any video without a lesson, or specifically a video without a lesson AND without a pitch?") and lock the answer. Do not proceed until the definition is one operator-readable sentence plus a two-to-three sentence long form.

**Step 3. Write or update `glossary.md` at the project root.** Alphabetical order. Short definition first, long form second. Related terms cross-linked by name. No jargon inside the definitions themselves; if a definition uses jargon, that jargon is a missing entry.

**Step 4. Add a pointer to `CLAUDE.md`.** One line, near the top: "Domain glossary lives at `glossary.md`. Read it before doing anything domain-specific." If the pointer already exists, leave it.

**Step 5. Append as terms appear.** When a new term shows up in a working session, append it to `glossary.md` immediately. Do not wait for a "glossary update session." Sharpen the language the moment it gets used.

## Guardrails

- Definitions have to be readable by a non-technical operator AND actionable by an AI agent. If a definition uses jargon that isn't itself defined in the glossary, that jargon is a missing entry.
- Do not include voice, tone, or writing style. Those live in `voice-corpus-builder` output.
- Do not include architectural decisions or trade-offs. Those live in `decision-log`.
- One glossary per project. For massive multi-domain projects (rare in operator work), split into `glossary/[domain].md` files and add a top-level context map that names each domain.
- Definitions get sharpened, not stacked. When a term's meaning shifts, edit the existing entry and add a "changed YYYY-MM-DD" note; do not append a second entry for the same term.

## Success criteria

- A fresh agent booting into the project can read `glossary.md` and answer "what does [any term] mean" without asking the operator.
- The operator stops re-explaining the same five terms across sessions.
- Generated content (copy, code, docs) uses the exact terms in the glossary, not verbose paraphrases.
- `CLAUDE.md` contains a pointer at `glossary.md` and does not inline glossary content.

## Composes with

- `handoff`. The handoff doc points at `glossary.md` so the recipient loads shared language on day one.
- `project-scaffold`. When scaffolding a new project, `glossary.md` becomes a candidate file alongside CLAUDE.md, LIVING-NOTES.md, DECISIONS.md, and INDEX.md.
- `claude-md-hygiene`. CLAUDE.md gets a one-line pointer at `glossary.md` instead of inlining definitions inside prose paragraphs.
- `decision-log`. Locked decisions coin new terms. Terms get promoted from the decision log into the glossary.
- `voice-corpus-builder`. Voice is HOW you speak; glossary is WHAT the nouns mean. Distinct artifacts, complementary use.

## Credit

Matt Pocock's `/grill-with-docs` skill (github.com/mattpocock/skills, MIT) is the origin of the ubiquitous-language artifact pattern used here. This Essential Bundle version extracts the glossary half of Matt's skill and generalizes it from codebases to operator domains. The interrogation half of Matt's original ships separately as `interrogate-decision` in the Executive and Author-Speaker-Coach Bundles. Credit and thanks to Matt.
