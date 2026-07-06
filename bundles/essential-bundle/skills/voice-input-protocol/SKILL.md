---
name: voice-input-protocol
description: "Configure the operator's voice-input flow (Whisper Flow, Superwhisper, or a system alternative) and teach the working discipline: when to talk vs type, punctuation dictation tricks, correcting transcription errors mid-flow, and how to route dictated content into the right destination (Claude, notes, email, CLAUDE.md). Trigger phrases include 'voice input setup', 'Whisper Flow config', 'Superwhisper', 'talk to Claude', 'stop typing start talking', 'dictation setup', 'set up voice dictation', 'voice to text config', 'speak instead of type', 'how do I dictate', 'voice workflow', 'set up my mic', 'voice-first setup', 'dictation protocol'. Use when the operator is starting on voice input or wants to level up their dictation workflow. Do NOT trigger when the operator only wants a one-off dictation transcribed (that is a job for the tool itself), when the operator already has a voice-input flow working smoothly, or when the operator wants to build a voice CORPUS (route to `voice-corpus-builder`)."
---

LAST-VERIFIED: 2026-07-06. Source of truth: Brett K. Moore's voice-first workflow documented across the HQ, the standing rule "maximum automation, minimum manual intervention" from the HQ router, and public documentation on Whisper Flow (whisperflow.ai) and Superwhisper (superwhisper.com) as of 2026-07-06.

This skill sets up the operator to talk to Claude instead of type. Typing is a bottleneck. The operator thinks faster than they type; Claude reads faster than the operator writes. Voice input closes the gap. This skill picks the right tool, configures it, and teaches the working discipline (when to talk vs when to type, how to dictate punctuation, how to correct errors mid-flow) so voice input becomes muscle memory instead of friction.

Output: an in-session walkthrough plus a `voice-input-config.md` starter file in the operator's HQ.

## When to use

- The operator is starting on voice input.
- The operator has voice input but keeps hitting friction (bad transcription, wrong destination, awkward corrections).
- The operator wants to level up their existing dictation workflow.
- The operator has never used dictation and asks how to talk to Claude.

## When NOT to use

- The operator only wants one dictation transcribed (that is the tool's job, not this skill).
- The operator already has a voice-input flow working smoothly.
- The operator wants to build a voice CORPUS for Claude to write in their voice (route to `voice-corpus-builder`).

## What you'll produce

An in-session walkthrough covering:

1. **Tool pick.** Whisper Flow (Mac/Windows), Superwhisper (Mac), macOS native dictation, Windows native, or web-based Whisper.
2. **Configuration.** Hotkey, output destination, language, custom vocabulary.
3. **Discipline.** When to talk vs when to type. Punctuation dictation tricks. Correcting errors mid-flow.
4. **Routing.** Where dictated content lands (Claude chat, Obsidian, email, CLAUDE.md).

Plus a `voice-input-config.md` starter file in the operator's HQ that captures the operator's chosen tool, hotkey, and custom-vocabulary list so future agents (and the operator themselves) can re-configure quickly.

## The tools

**Whisper Flow (recommended for most operators).** Whisperflow.ai. Cross-platform (Mac and Windows). Global hotkey (default: F5). Very strong accuracy on business vocabulary. $15/mo. Learns from corrections over time. Custom dictionary for names, brands, jargon.

**Superwhisper (Mac-only alternative).** Superwhisper.com. Slightly better latency than Whisper Flow. Same hotkey pattern. $19/mo. Model-selection UI for tuning accuracy vs speed.

**macOS native dictation.** Free, built in, worse accuracy. Fine for quick notes; unfit for long-form drafting.

**Windows native dictation.** Free, built in, similar quality tier to macOS. Same caveat.

**Web-based Whisper (via OpenAI or hosted).** For operators who do not want to install anything. Higher friction; requires paste. Not recommended for daily use.

## Instructions

**Step 0. Lock four things.**

1. **The operator's OS.** Mac, Windows, Linux, iPad.
2. **The operator's Claude surface.** Claude Desktop, Claude Code, Claude.ai (browser), Cowork.
3. **The operator's current dictation habit.** Never used, occasional, daily.
4. **The operator's target: how much of their workday should shift to voice?** 20%, 50%, 80%. Sets the ambition level for the configuration.

**Step 1. Pick the tool.**

Default recommendation: Whisper Flow. Reasons: cross-platform, learns from corrections, custom dictionary, business-vocabulary tuned, hotkey works globally (in Claude Code terminal, in Claude Desktop, in browser, in email, everywhere).

Superwhisper if the operator is Mac-only and wants slightly better latency. Higher price, minor upside.

macOS or Windows native only if the operator refuses to install anything and only needs short dictation.

**Step 2. Configure the tool.**

Once picked, walk the operator through:

- **Install.** Download from vendor site. Grant microphone permission when prompted.
- **Set the hotkey.** Default F5 works for most. If F5 conflicts, remap to Right-Option (Mac) or Right-Alt (Windows).
- **Set the output destination.** "Insert at cursor" is the default and correct choice for 95% of operators. Do not set a fixed destination file.
- **Load the custom dictionary.** Ask the operator for 10-20 words the tool will get wrong: business name, product names, industry jargon, family/team names. Add them all now.

**Step 3. Teach the discipline.**

Four rules that separate operators who love voice from operators who abandon it:

1. **Talk in complete thoughts, not word by word.** Say the sentence. Let the tool transcribe. Correct if needed. Do not stop-start.

2. **Dictate punctuation deliberately.** "Comma," "period," "question mark," "new paragraph," "quote," "unquote." Whisper Flow and Superwhisper both handle this natively. The one exception: for casual dictation into Claude, do not dictate punctuation. Claude infers.

3. **Correct errors after the sentence, not mid-word.** If the tool transcribes "Buddy" as "Body," finish the sentence, then go back and correct. Stopping mid-word breaks the tool's context and produces worse output on the next sentence.

4. **When to type instead of talk.** Type for: exact code, exact URLs, exact numbers, passwords, exact quotes. Talk for: everything else. Draft prose, brainstorm, meeting notes, Claude prompts, email replies, LinkedIn posts, book chapters.

**Step 4. Route the output.**

Voice input is worthless if the transcript lands in the wrong place. Configure per surface:

- **Claude Desktop.** Cursor in chat window. Hotkey. Talk. Send.
- **Claude Code (terminal).** Cursor in the terminal prompt. Hotkey. Talk. Send. (Note: Claude Code paste on Mac can be quirky; test with a short dictation first.)
- **Claude.ai (browser).** Cursor in chat. Hotkey. Talk. Send.
- **Obsidian / Notes / email.** Cursor in doc. Hotkey. Talk.

If the operator wants dictated content to land in a specific file automatically (rare but valid), set up a shortcut that opens the file, positions cursor, and triggers the hotkey.

**Step 5. Write the config file.**

Save to `voice-input-config.md` in the operator's HQ:

```
# Voice Input Config

**Tool:** [Whisper Flow / Superwhisper / native]
**Version:** [Version number]
**Hotkey:** [Configured hotkey]
**Custom dictionary:** [Path or list]
**Set up:** [Date]

## Custom vocabulary
- [Word]
- [Word]

## Routing
- Claude Desktop: [How to invoke]
- Claude Code: [How to invoke]
- Obsidian: [How to invoke]

## Discipline notes
- [Anything the operator wants to remember about their own dictation quirks]
```

**Step 6. Deliver the walkthrough.**

Chat message: "Voice input configured. Tool: [Whisper Flow]. Hotkey: [F5]. Try it now. talk one sentence into Claude and see what lands. Custom dictionary loaded with [N] words. Full config saved at [path]."

## Examples

**Example 1.** Operator says "stop typing start talking, help me set up dictation." Skill fires. Confirms Mac, Claude Desktop, no current dictation. Recommends Whisper Flow. Walks through install. Loads 15 custom vocabulary words (business names, product names, teammate names). Writes config file.

**Example 2.** Operator says "Whisper Flow config, I keep getting my business name wrong." Skill fires. Adds business name plus common misheard variants to custom dictionary. Updates config file.

**Example 3.** Operator says "voice workflow, I want 80% of my Claude sessions to be voice." Skill fires. Confirms tool, hotkey, routing per surface. Teaches the four discipline rules. Delivers config file and asks operator to try a 15-minute session end-to-end voice today as calibration.

## Composes with

- `voice-corpus-builder`. voice input is the tooling; voice corpus is what Claude reads from.
- `hoard`. hoard a great dictation from time to time to feed the corpus.
- `handoff`. handoff docs can be dictated instead of typed.

## Note on Whisper Flow vs Superwhisper

Both are excellent. If the operator is on Mac and can justify $19/mo, Superwhisper has a slight latency edge. Whisper Flow is the safer default because it works cross-platform and its accuracy on business vocabulary is very strong. Whichever tool the operator picks, the discipline rules (Step 3) are the same.
