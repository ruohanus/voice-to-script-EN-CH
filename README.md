# voice to script en/ch

A public ChatGPT/Codex skill for developing voice notes, recordings, transcripts, rambles, and rough spoken ideas into reflective, conversational talking-head video scripts.

The skill supports English, Simplified Chinese, and bilingual output. Bilingual is the default. Each final language version is independently written from one approved, language-neutral story contract and must run between 2.5 and 15 minutes.

## What it does

- Preserves the speaker's distinctive phrasing, real experiences, and central insight.
- Offers two or three selectable story directions built around a question, causal momentum, meaningful conflict, and an earned resolution.
- Researches only claims that materially benefit from evidence, then asks the user which verified support to include.
- Produces natural English and Chinese-speaking-audience adaptations without using English as the canonical draft.
- Returns clean teleprompter scripts with only light delivery notes at finalization.

## Repository layout

The installable skill is in `skills/voice-to-script-en-ch/`. The repository root also contains behavioral specifications, deterministic runtime tests, the project license, and third-party notices.

## Install for local use

Clone or download this repository, then install the skill directory with a host-compatible skill installer. With the Skills CLI:

```bash
npx skills add ./skills/voice-to-script-en-ch
```

You can also copy the skill directory into the skills location supported by your host. For native Codex discovery, use `.agents/skills/voice-to-script-en-ch/` within a project or `$HOME/.agents/skills/voice-to-script-en-ch/` for a user-level installation. Do not copy the repository's test or development files into the skill directory.

## Required polishing dependencies

Install both dependencies for the default bilingual mode:

```bash
npx skills add blader/humanizer
npx skills add MrGeDiao/shuorenhua
```

English finalization requires Humanizer. Simplified Chinese finalization requires Shuorenhua. The skill deliberately stops the affected language branch if its polishing dependency is unavailable.

Research uses the strongest reliable web or research capability available in the host. No particular search adapter is required.

## Public distribution

This repository remains a standalone skill package. A `SKILL.md` directory can be distributed directly, installed from a repository, or uploaded as a directory/zip through environments that support hosted skills. Plugin packaging is not required for this use case; add a plugin manifest only if publishing through a plugin-specific directory later.

Current OpenAI guidance:

- [Skills tool](https://developers.openai.com/api/docs/guides/tools-skills)
- [Plugin skills](https://developers.openai.com/plugins/concepts/skills)
- [Build a skill](https://developers.openai.com/plugins/build/skills)

## Development and verification

```bash
python3 -m unittest tests/test_runtime_estimator.py -v
sh tests/test_package_smoke.sh
```

The behavioral contract and evaluation rubric are in `tests/behavioral/`. Static checks are only smoke tests; behavioral runs in fresh contexts are the authoritative validation.

## License

This repository is licensed under the MIT License. External polishing skills are separate works and are not vendored here; see `THIRD_PARTY_NOTICES.md`.
