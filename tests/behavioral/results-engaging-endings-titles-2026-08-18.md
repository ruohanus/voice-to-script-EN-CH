# Engaging endings, titles, and external rewrites — forward results

## Evaluation setup

- Date: 2026-08-18
- Evaluator: `codex exec --ephemeral`, model `gpt-5.6-sol`, fresh context per run
- Sandbox: read-only
- Input: `fixtures/engaging-endings-titles-2026-08-18/bilingual-finalization-input.md`
- RED output: `fixtures/engaging-endings-titles-2026-08-18/bilingual-finalization-output-red.md`
- GREEN output: `fixtures/engaging-endings-titles-2026-08-18/bilingual-finalization-output-green.md`

Both runs loaded the repository skill and the installed Humanizer and `shuorenhua` instructions. The host emitted unrelated model-cache and icon-path warnings. The read-only sandbox rejected here-document temporary files, so each evaluator changed to a standard-input or base64 pipeline and completed runtime measurement without modifying the repository.

## RED run

- Session: `01a01574-caed-7820-9222-c7af79ddc8ae`
- English runtime: 361 words, 144.4 seconds, `within_preferred`
- Simplified Chinese runtime: final measured branch 575 Han characters, 143.75 seconds, `within_preferred`
- Source fidelity: pass
- English platform titles: pass
- Simplified Chinese platform titles: pass
- Claude and DeepSeek prompts request both versions by default: pass
- Per-version title requirements: pass
- Ending aftereffect labels and material differences: pass
- Scenario 77: fail. The displayed Simplified Chinese recommended ending occupied four spoken lines after mechanical splitting.

## Fix

The ending contract now defines the one-or-two-line limit against final displayed line breaks. The mechanical audit may not create or leave a third line; it must cut and recompose from approved material until both the per-line ceiling and two-line ending limit pass together.

## GREEN run

- Session: `01a0157b-6e9a-73a2-9194-fe5f311f829b`
- English runtime: 356 words, 142.4 seconds, `within_preferred`
- Simplified Chinese runtime: 557 Han characters, 139.25 seconds, `within_preferred`
- Source fidelity and speech status: pass. The partner's speech remained indirect; the manager quotation remained the only direct quotation; no diagnosis, invented outcome, or invented third-party feeling appeared.
- Scenario 71, ending palette and aftereffect labels: pass for the source-supported displayed set. Labels described cohesion, image, open tension, and forward motion without comments/shares promises.
- Scenario 72, implicit unresolved tension: pass. The concrete-image endings preserved the career tension without mechanically restating it.
- Scenario 73, English title packages: pass. Three TikTok titles and three Instagram cover/caption packages were present and source-matched.
- Scenario 74, Chinese and bilingual title adaptation: pass. Three Xiaohongshu `笔记标题`/`封面短句` packages were independently adapted rather than translated from the English titles.
- Scenario 75, two external versions: pass. The Claude and DeepSeek prompts requested both versions by default and correctly separated language-only freedom from structural freedom.
- Scenario 76, per-version titles: pass. Every external version was required to generate its own platform-title set and return no critique or change summary.
- Scenario 77, ending limit after splitting: pass. Every displayed recommended and alternate ending in both languages occupied no more than two spoken lines.

## Verdict

PASS after one evidence-backed correction. The final run satisfies the new observable contracts while preserving the existing source, runtime, bilingual, dependency, and clean-output boundaries.
