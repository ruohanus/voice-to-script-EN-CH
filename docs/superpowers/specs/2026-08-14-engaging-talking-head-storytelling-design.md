# Engaging Talking-Head Storytelling Skill Revision

Date: 2026-08-14

## Purpose

Revise `speaking-ideas-into-content` into a public, general-purpose Codex skill whose final outputs are engaging, reflective, conversational talking-head video scripts adapted to the creator's intended audience and selected language mode.

The revision preserves the existing voice-first workflow: speak freely, discover the idea, deepen it through another voice pass, and polish last. It adds a story-selection checkpoint, Jenny Hoyos-inspired causal storytelling, conditional evidence research, bilingual adaptation, runtime controls, and light delivery notes.

## Output target

- Format: talking-head video script.
- Tone: reflective and conversational, like speaking thoughtfully to one person.
- Audience: any intended viewer group. Identify the viewer's context, relevant tension, and desired change from the user's material. If the intended audience is clear, state the inference for confirmation; if it is ambiguous or would materially change the story, ask before proposing narrative directions. Career-changing professionals, professionals with ADHD, and founders with ADHD are examples, not defaults.
- Viewer outcome: feeling understood, reconsidering a limiting belief, gaining a practical next step, or any fitting combination.
- Runtime: at least 2.5 minutes and no more than 15 minutes.
- Word-count estimate: approximately 375–2,250 words at a natural reflective delivery pace of about 150 words per minute. Use runtime, not padding, as the governing requirement.
- Story sources: personal experience plus anonymized client/team examples and composite scenarios only when the user supplies or authorizes the underlying material.
- Language modes: English, Simplified Mandarin, or bilingual. Honor an explicitly selected mode; otherwise default to bilingual.
- Bilingual relationship: preserve the same story, claims, evidence strength, and resolution across both versions, but do not translate sentence by sentence. Rewrite idioms, transitions, examples, rhythm, and framing when needed so each version sounds native and conversational.
- Final presentation: return only the humanized, teleprompter-ready script or scripts requested by the selected language mode, each followed by light delivery notes. Keep research logs, diagnostics, word counts, runtime calculations, and polishing reports internal.

## Revised workflow

### Stage 1: Discover the story material

Accept a recording, transcript, or rough notes. Preserve the current workbench while expanding its storytelling analysis:

1. **Material bank** — vivid wording, scenes, claims, examples, tensions, emotions, and unresolved fragments.
2. **Content soul** — the strongest central insight in one sentence.
3. **Audience and language** — the intended viewer, their context and tension, the desired viewer change, and the selected English, Simplified Mandarin, or bilingual output mode. Default to bilingual when no mode is specified.
4. **Viewer question** — the honest question the script can open and ultimately answer.
5. **Story ingredients** — protagonist or point of view, desire, stakes, conflicts, decisions, consequences, change, and available resolution.
6. **Gaps and support** — missing scenes, causal links, emotional truth, claims needing validation, and useful counterpoints.
7. **Next voice-pass prompts** — conversational questions that elicit concrete moments, internal conflict, decisions, and consequences.

Do not draft the finished script from the first capture unless the user explicitly asks to skip the staged workflow.

### Stage 1.5: Offer narrative directions

Before research or drafting, propose two or three distinct narrative directions. Each option includes:

- a question hook;
- the central promise or viewer tension;
- a causal story spine written as beats connected by **therefore** and **but**;
- the conflict and stakes;
- the proposed resolution;
- the likely ending effect: recognition, belief shift, practical next step, or a combination;
- a provisional runtime range based on available substance.

Recommend one direction with a concise reason, then wait for the user's selection. Do not silently choose or merge options.

### Stage 2: Research only claims that need support

After the user selects a direction, create a claim inventory. Research only claims where validation would strengthen credibility or add genuine educational interest. Purely personal observations do not require external proof.

**REQUIRED SUB-SKILL:** Use `agent-reach` for internet research when it is available.

For each important researched claim, present a small evidence menu containing:

- candidate theory, study, article, expert commentary, or industry data;
- evidence type;
- source and link;
- why it fits the story beat;
- credibility and limitations;
- a suggested plain-language integration line.

Choose the best evidence type for the claim, with a slight preference for established theories and frameworks when they explain the experience cleanly. Prefer primary studies, authoritative institutions, or strong syntheses for medical and ADHD-related claims. A popular article alone is insufficient for a health claim.

Recommend an evidence candidate, but wait for the user to select what enters the script. When evidence is weak, conflicting, or merely suggestive, say so and soften or remove the claim.

### Stage 3: Enrich through another voice pass

Build targeted prompts from the selected narrative direction and evidence. Ask for missing scenes, sensory or situational specifics, the speaker's internal interpretation, what changed, what it cost, and what happened next.

Merge the new voice pass without erasing natural language. Update the content soul or story spine only when the new material genuinely changes it. Repeat this stage when another pass would add meaningful conflict, clarity, emotional truth, or resolution.

### Stage 4: Draft and polish

When the user confirms the material is ready or explicitly asks to finalize:

1. Confirm or apply the selected language mode. Use bilingual when the user has not selected one.
2. For English or bilingual mode, draft the English teleprompter script from the approved story spine and evidence. Estimate its spoken word count and runtime internally, revise it into the 2.5–15 minute range, and apply the English `humanizer` skill as an embedded polishing pass. Follow its diagnostic process internally, but suppress its draft, critique, summary, and process report from the user-facing result.
3. For Simplified Mandarin or bilingual mode, create a Chinese-native teleprompter script from the approved story spine. In bilingual mode, preserve the English version's story and evidence without translating it line by line. Estimate runtime internally, revise it into the 2.5–15 minute range, and apply the Chinese-first `shuorenhua` skill as an embedded polishing pass. Preserve facts, claims, evidence strength, emotional truth, and the speaker's voice while removing translation-like phrasing, mechanical symmetry, inflated language, and unnatural written-Chinese rhythm.
4. Read every requested version for spoken cadence. Remove filler, false starts, repetition, transcription artifacts, tongue-twisting syntax, and phrases that look natural on a page but sound stiff aloud.
5. Check that every requested version resolves the same approved central conflict and remains within the 2.5–15 minute range at a natural pace. Bilingual versions may differ in sentence structure and exact length.
6. Return only the requested final script or scripts and the corresponding light delivery notes. In bilingual mode, order the output as English script, English delivery notes, Simplified Mandarin script, and Chinese delivery notes.

Do not expose intermediate drafts, humanizer diagnostics, AI-writing critiques, polishing reports, research logs, word counts, or runtime calculations in the finalization response. Evidence-display cues such as `[show source/title]` may appear in the light delivery notes when relevant.

If the supplied material cannot honestly support 2.5 minutes in every requested language, request another voice pass instead of padding. If any requested version would exceed 15 minutes, narrow the central question or split the material into a series.

## Storytelling contract

Use Jenny Hoyos's causal storytelling format as a structural test, not a rigid cage:

1. Open with an honest question that creates curiosity without making a clickbait promise.
2. Orient the viewer with a specific situation, desire, or uncomfortable truth.
3. Advance each major beat through **therefore**.
4. Change direction and raise investment through meaningful **but** conflicts.
5. Escalate only with conflicts supported by the user's material.
6. Resolve the central conflict and answer the opening question.
7. Land on the most fitting ending effect: recognition, belief shift, practical next step, or a combination.

Remove flat “and then” sequencing. Maintain one primary open loop; smaller loops may support it, but resolve every promised question. Place evidence where it explains a turning point rather than interrupting the opening with a literature review.

Never invent vulnerability, conflict, experiences, composite details, quotations, statistics, ADHD explanations, evidence, or certainty.

## Reference-video adaptation

When the user supplies a future reference video:

1. Analyze its transcript and observable structure.
2. Extract the hook type, causal beats, conflict pattern, pacing, emotional tone, evidence placement, and resolution.
3. Create a temporary style fingerprint for the current script.
4. Adapt structural characteristics without copying distinctive wording, personal stories, or signature expressions.

Update the permanent skill only when the user explicitly asks and recurring preferences are clear.

Initial reference set:

- Jessica McCabe for vulnerable personal arc and hopeful reframing.
- Struthless for reflective honesty, specificity, humor, and pacing.
- How to ADHD for practical structure and accessible ADHD education.
- Dr. Tracey Marks for calm integration of theories and evidence.
- Jenny Hoyos for question hooks, causal momentum, conflict, and satisfying resolution.

These references are directional, not voices to imitate.

## Error and integrity handling

- Mark uncertain transcript passages instead of guessing.
- Separate user-provided facts, composite material, AI inference, and externally verified evidence.
- Do not diagnose the speaker or viewer.
- Use careful language for correlations, theories, contested findings, and individual experiences.
- If research tools are unavailable, stop at the claim inventory and ask whether to continue without evidence or wait for research access.
- If a polishing sub-skill required by the selected language mode is unavailable, explain which dependency is missing and provide installation guidance instead of silently substituting a weaker process.
- If the user rejects all story directions, return to the material bank and generate new options rather than combining rejected spines.
- If the user says “finalize now,” honor the request while clearly noting unresolved claims or runtime limitations.

## Behavioral testing

Baseline tests must show how the current skill handles a realistic voice note without the new storytelling guidance. Record whether it omits:

- multiple question-hook and story-spine choices;
- explicit **therefore/but** causal structure;
- meaningful conflict and satisfying resolution;
- conditional claim research and evidence selection;
- 2.5–15 minute runtime enforcement;
- light delivery notes.

Forward tests for the revised skill must cover:

1. A first voice note produces the expanded workbench, identifies or asks for the intended audience, records the selected language mode or bilingual default, and offers two or three selectable narrative directions instead of a finished script.
2. Each direction begins with a question and uses causal **therefore/but** beats.
3. A purely personal story does not trigger unnecessary research.
4. A meaningful ADHD or career claim produces an evidence menu and waits for user selection.
5. English mode produces only a humanized English teleprompter script and light English delivery notes.
6. Simplified Mandarin mode produces only a humanized Chinese teleprompter script and light Chinese delivery notes.
7. With no language preference, bilingual mode produces a humanized English teleprompter script, its light delivery notes, a naturally adapted Simplified Mandarin teleprompter script, and its light delivery notes.
8. Insufficient material triggers another voice pass instead of padding.
9. Excess material is narrowed or split rather than exceeding 15 minutes.
10. A reference video creates a temporary structural style fingerprint without copying language.
11. In bilingual mode, the Chinese version preserves the English version's story, claim strength, evidence, and resolution without reading like a literal translation.
12. The polishing sub-skills required by the selected language mode run internally and do not expose drafts, diagnostics, critiques, reports, word counts, or runtime calculations.
13. A missing required polishing dependency produces a clear installation instruction rather than a silently degraded final script.

The public package must include clear installation and dependency guidance, pass the official skill validator, remain consistent between the repository and personal installation, and preserve the previously tested voice-first behavior.
