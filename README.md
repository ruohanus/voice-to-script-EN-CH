# voice to script en/ch

A public ChatGPT/Codex skill for developing voice notes, recordings, transcripts, rambles, and rough spoken ideas into reflective, conversational talking-head video scripts.

The skill supports English, Simplified Chinese, and bilingual output. Bilingual is the default. Each final language version is independently written from one approved, language-neutral story contract.

The skill asks once for an exact duration, rough range, or freestyle. Freestyle aims for a preferred 2–15-minute window, but a strong story may be shorter and an authorized story may be longer. The skill never pads merely to reach a minimum. Runtime covers the complete teleprompter body plus recommended conclusion; the editorial heading, alternate endings, and notes do not count.

## What it does

- Preserves the speaker's distinctive phrasing, real experiences, and central insight.
- Delays story selection until the material is ready, then recommends the best-supported angle alongside two developmental alternatives that name what material they still need.
- Offers an optional batch of post-selection questions to strengthen the opening, conflict, stakes, turn, clip line, or ending before drafting.
- Researches only claims that materially benefit from evidence, then asks the user which verified support to include.
- Produces natural English and Chinese-speaking-audience adaptations without using English as the canonical draft.
- Returns, per language, a complete teleprompter body, a visible recommended ending and conclusion, at least three labeled alternate endings, and light delivery notes.
- Offers an optional copy-paste handoff to Claude for English and DeepSeek for Simplified Chinese after internal finalization. The user should not share private or sensitive material unless comfortable sending it to that third-party service; these services do not replace Humanizer or `shuorenhua`.

## Repository layout

The installable skill is in `skills/voice-to-script-en-ch/`. The repository root also contains behavioral specifications, deterministic runtime tests, the project license, and third-party notices.

## Install for local use

### Skills CLI — install directly from GitHub

The open-source [Skills CLI](https://github.com/vercel-labs/skills) is a third-party tool, not an official OpenAI or Codex installer. To install this skill globally for Codex without cloning the repository first:

```bash
npx skills add ruohanus/voice-to-script-en-ch --skill voice-to-script-en-ch -g -a codex -y
```

### Skills CLI — from an already cloned repository

From the repository root, install the local skill directory with:

```bash
npx skills add ./skills/voice-to-script-en-ch -g -a codex -y
```

The `./skills/voice-to-script-en-ch` path is relative to this repository's root and will not work as a direct remote install command.

### Native Codex local discovery

Native Codex installation does not require the third-party Skills CLI. Place or symlink the skill directory at either supported location:

- User-scoped: `$HOME/.agents/skills/voice-to-script-en-ch/`
- Repository-scoped: `$REPO_ROOT/.agents/skills/voice-to-script-en-ch/`

Codex follows symlinked skill directories. Codex also provides the built-in `$skill-installer` for local installation; invoke it and ask it to install the `skills/voice-to-script-en-ch` skill from this GitHub repository. Do not copy the repository's tests or development files into the skill directory.

## Required polishing dependencies

Install both dependencies for the default bilingual mode:

```bash
npx skills add blader/humanizer
npx skills add MrGeDiao/shuorenhua
```

English finalization requires Humanizer. Simplified Chinese finalization requires Shuorenhua. The skill deliberately stops the affected language branch if its polishing dependency is unavailable.

Research uses the strongest reliable web or research capability available in the host. No particular search adapter is required.

## Public distribution

This GitHub repository distributes the standalone skill for local and repository use. It is not a plugin. [Current OpenAI guidance](https://developers.openai.com/codex/skills) recommends plugin packaging when an author later wants broadly installable distribution across ChatGPT and Codex; that future packaging is outside this repository's current scope.

## Development and verification

```bash
python3 -m unittest tests/test_runtime_estimator.py -v
sh tests/test_package_smoke.sh
```

The behavioral contract and evaluation rubric are in `tests/behavioral/`. Static checks are only smoke tests; behavioral runs in fresh contexts are the authoritative validation.

## License

This repository is licensed under the MIT License. External polishing skills are separate works and are not vendored here; see `THIRD_PARTY_NOTICES.md`.
