# Speaking Ideas Into Content — Skill Design

Date: 2026-08-13

## Purpose

Create a personal Codex skill that reproduces the workflow demonstrated in the supplied 65-second recording: use relaxed voice capture to discover ideas, let AI organize and deepen them, speak through the improved structure again, and only then clean the language into publishable content.

The skill is named `speaking-ideas-into-content` and will be installed in the user's personal Codex skills directory so it can be invoked in future tasks.

## Source-derived workflow

The recording establishes this sequence:

1. **Diverge by speaking.** Capture thoughts during low-pressure moments such as walking or driving. Speak as if calling a friend. Accept scattered observations, unfamiliar topics, fragments, and emotions.
2. **Extract the content's soul and skeleton.** Preserve useful fragments in a material bank. Identify the central insight (the “soul”), summarize it in one sentence, and organize the material into a coherent outline (the “skeleton”).
3. **Deepen the reasoning.** Surface missing links and questions. Answer them from relevant perspectives—for example, psychological and physiological explanations—so claims gain support rather than remaining intuition alone.
4. **Speak through the enriched outline again.** Use the skeleton, materials, questions, and support as prompts for a second voice pass. Repeat once more if the structure, details, or emotion remain thin.
5. **Polish last.** Remove filler words, repeated verbal clutter, and transcription noise while preserving the speaker's meaning, personality, emotional force, and natural rhythm. Produce the requested article, post, or spoken script.

## Interaction contract

The skill must be staged. Receiving a first recording or transcript produces a workbench, not an immediate polished draft.

### Stage 1 output: discovery workbench

Return these sections in order:

1. **Material bank** — vivid phrases, claims, examples, tensions, emotions, and unresolved fragments from the user's words.
2. **Content soul** — one sentence that states the strongest central insight without making up facts.
3. **Skeleton** — a beginning-to-end outline built from the supplied material.
4. **Gaps and support** — missing reasoning, unclear claims, useful counterpoints, and evidence that would strengthen the argument. Distinguish user-provided facts from AI suggestions; verify external factual support when used.
5. **Next voice-pass prompts** — a short, speakable sequence of questions that helps the user add detail and emotion naturally.

End by inviting the second recording or transcript. Do not produce the finished content during this stage unless the user explicitly overrides the staged workflow.

### Stage 2 output: enriched workbench

When the user supplies another voice pass:

- Merge new material without erasing the original voice.
- Update the soul only if the new recording genuinely changes it.
- Strengthen the skeleton, reasoning, examples, and emotional arc.
- Identify only the remaining high-value gaps.
- Request another pass when those gaps materially affect the result; otherwise state that the material is ready for polishing.

### Stage 3 output: final content

When the user asks to finalize, or after the material is ready and the user confirms:

- Match the requested format, audience, length, and language.
- Remove filler words, false starts, duplicate phrases, and transcription artifacts.
- Preserve distinctive wording, point of view, emotional texture, and claims.
- Do not invent experiences, quotations, statistics, or certainty.
- Return the finished content first, followed by a brief note listing any unverified claims or meaningful editorial choices.

## Input handling

- Accept pasted transcripts, rough notes, or attached audio/video recordings.
- If audio or video is supplied, transcribe it before analysis and preserve uncertain passages as marked uncertainties rather than guessing.
- Ask only for information that blocks the current stage. A missing platform or target length does not block discovery; it matters before finalization.
- Reply in the user's language unless they request another language.

## Skill package

The personal package contains only:

- `SKILL.md` — trigger metadata, staged workflow, output contracts, guardrails, quick reference, and one compact example.
- `agents/openai.yaml` — display name, short description, and starter prompt.

No scripts, references, or assets are required. The workflow is judgment-based, and the recording itself is source evidence for authoring rather than a runtime dependency.

## Baseline evidence and testing

Five fresh-context baseline agents received the same rough voice note and the request “Please turn this into content.” All five jumped directly to a polished post. None returned the material bank, explicit soul, skeleton, gap analysis, supporting perspectives, or second-pass prompts.

The forward test will give fresh agents the finished skill plus realistic raw transcripts. A passing first-stage response must:

- contain all five discovery sections in the required order;
- preserve uncertainty and avoid invented support;
- stop at the invitation for a second voice pass rather than outputting a finished post;
- handle a direct user override to finalize;
- preserve voice while cleaning a supplied second pass.

The package must also pass the official `quick_validate.py` validator and contain valid UI metadata.

## Installation and use

Default installation target: `${CODEX_HOME}/skills/speaking-ideas-into-content` when `CODEX_HOME` is set, otherwise `~/.codex/skills/speaking-ideas-into-content`.

Typical triggers include:

- “Turn this voice note into content.”
- “Help me find the main idea in this ramble.”
- “Use my recording to build a post, but keep my voice.”
- “I want to talk through an idea instead of writing it.”

Users can explicitly invoke it with `$speaking-ideas-into-content`.
