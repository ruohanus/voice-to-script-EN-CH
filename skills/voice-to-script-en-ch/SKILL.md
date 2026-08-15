---
name: voice-to-script-en-ch
description: Use when someone wants to turn a voice note, recording, transcript, ramble, or rough idea into a reflective, conversational talking-head video script with an engaging story arc, optional evidence, English or Simplified Chinese output, and a verified 2.5-to-15-minute runtime.
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
2. The hard 2.5-to-15-minute runtime for every requested language version.
3. The narrative direction the user authorized.
4. The evidence the user authorized.
5. Optional enrichment, examples, and stylistic flourishes.

Omit dispensable material before weakening a higher-priority requirement. Never invent experiences, quotations, statistics, sources, or certainty.

## Route the current stage

| Input state | Action |
|---|---|
| First useful capture | Analyze it now; return a discovery workbench plus 2–3 narrative directions when the material supports meaningful alternatives. |
| Added voice pass or answers | Merge them into the workbench, update the directions, and ask only the highest-value remaining questions. |
| User selects a direction, including “you choose” | Record the selection and continue without asking for another confirmation. |
| External support would materially help | Offer a small evidence menu; research with the strongest available reliable research or web capability. |
| User approves the story and evidence choices, or says “finalize now” | Create the internal approved story contract and finalize. |

Do not draft a polished script from a first capture unless the user explicitly asks to finalize now. “Finalize now” waives optional discovery, not truthfulness, runtime, language, or required polishing.

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

When finalization succeeds, return only the requested final humanized teleprompter script or scripts. For each requested language, assemble the complete body, a visibly labeled `Recommended ending — [mode]` and conclusion, at least three labeled alternate endings, then light delivery notes. Do not expose the workbench, approved story contract, research trace, polishing critique, runtime calculations, or parity audit unless the user asks for them.
