---
name: voice-to-script-en-ch
description: Use when someone wants to turn a voice note, recording, transcript, ramble, or rough idea into a reflective, conversational talking-head video script with an engaging story arc, optional evidence, English or Simplified Chinese output, and a verified user-authorized runtime.
---

# voice to script en/ch

Develop spoken raw material into an audience-aware talking-head video script without sanding away the speaker's point of view. Default to a bilingual English and Simplified Chinese deliverable. The user may choose English, Simplified Chinese, or bilingual at any time.

## Read the workflow before acting

Read the reference that matches the current work:

- For first captures, later voice passes, narrative choices, source ledgers, reference material, or imitation requests, read `references/story-workflow.md`.
- Before proposing, researching, checking, or using external support, read `references/evidence-research.md`.
- Before drafting or revising a script, read `references/spoken-style.md`.
- Before drafting any final script, read `references/finalization.md` and use `scripts/estimate_runtime.py`.

If more than one situation applies, read every relevant reference. Treat the rules below as the controlling contract.

## Precedence

When requirements compete, protect them in this order:

1. Factual integrity, faithful attribution, and the user's real experience.
2. The user's authorized duration and scope choice for each requested language's complete teleprompter body plus recommended conclusion, using the 2–15-minute preferred window as a planning guide.
3. The story angle the user authorized.
4. The evidence the user authorized.
5. Optional enrichment, examples, and stylistic flourishes.

Omit dispensable material before weakening a higher-priority requirement. Never invent experiences, quotations, statistics, sources, or certainty, and never pad to reach the preferred window.

## Route the current stage

| Input state | Action |
|---|---|
| New script project | Reflect usable material, ask once for exact duration, rough range, or freestyle unless already supplied, explain the story-led window, then begin discovery. |
| Discovery pass | Merge material into the source ledger and ask 4–6 highest-value questions; allow selective answers, skipping, or freestyle. Do not propose angles before readiness. |
| Readiness gate passes | Present one best-supported angle and two promising alternatives with named material gaps. |
| User selects an angle | Record it and offer one optional 4–6-question strengthening pass. |
| New material after selection | Merge minor additions; reopen angle selection only after a material change to meaning, conflict or stakes, audience promise, position, or best-supported angle. |
| User says `draft now` or `finalize now` | If duration is absent, ask only for exact duration, rough range, or freestyle; then skip optional discovery and use the strongest supportable story without invention or padding. |
| Selected scope exceeds 15 minutes | Before drafting, offer one longer video, a short series, or a narrower story and recommend the most coherent choice. |

When external support would materially help, offer a small evidence menu and use the strongest available reliable research or web capability only after the user authorizes the support. Once story and evidence choices are authorized, create the internal approved story contract and finalize. `draft now` and `finalize now` waive optional discovery, not truthfulness, the duration choice, language, source-grounded drafting, or required polishing.

## Required narrative engine

Build an open question, then move the viewer through causal progressions and meaningful conflicts:

`question → therefore → but → therefore → but → earned turn → one unresolved tension`

Use “therefore” as logic, not necessarily as a spoken word. Every “but” must change the stakes, interpretation, or next action. Earn meaningful movement through a decision, changed interpretation, honest position, or next action while leaving exactly one intentional tension, uncertainty, or question open. Do not force a neat ending or explain away every conflict the source material has not earned.

## Dependency rules

- English finalization requires the installed `humanizer` skill.
- Simplified Chinese finalization requires the installed `shuorenhua` skill.
- Bilingual finalization requires both.
- Research requires the strongest available reliable research or web capability. A particular search adapter is optional; its absence must not block research when another capable tool exists.

If a required polishing skill is unavailable, stop only the affected finalization, preserve all completed work, name the missing dependency, and give its installation command. Do not silently imitate the missing skill.

## Final-output boundary

When finalization succeeds, return only the requested final humanized teleprompter script or scripts. For each requested language, assemble the complete body, a visibly labeled `Recommended ending — [mode]` and conclusion, at least three labeled alternate endings, then light delivery notes. Runtime includes the complete body and recommended conclusion but excludes the editorial heading, alternate endings, and notes. Optional external-polish handoff content may follow the notes. Do not expose the workbench, approved story contract, research trace, polishing critique, runtime calculations, or parity audit unless the user asks for them.
