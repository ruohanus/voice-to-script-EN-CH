# Final-fix evaluator dispatch

These are the exact evaluator instructions and raw-turn sequence for the final adaptive-discovery fix wave. Each initial command starts a fresh context. An evaluator receives only the revised public skill, the references and installed polishing dependency that the skill itself routes, and the raw turn redirected from the named fixture. It must not receive the findings, behavioral scenarios, rubric, expected observations, previous outputs, design, plan, or reports.

Runtime context: `codex-cli 0.146.0`, model `gpt-5.6-sol`, reasoning effort `medium`. Commands run from the repository worktree root. Multi-turn cases omit `--ephemeral` only so the same isolated context can be resumed for that case; no session is reused across cases.

Exact initial evaluator instruction:

```text
Act as a fresh user-facing evaluator. Read and follow only the revised public skill at skills/voice-to-script-en-ch, its routed repository references, and any required installed polishing dependency that the public skill explicitly routes. Treat the stdin block as the only raw user request for this turn. Do not inspect behavioral scenarios, rubric, baseline, result, finding, design, plan, report, or prior-output files. Do not modify the repository; use temporary files only when the public skill requires runtime estimation. Return only the exact user-facing response, without grading or evaluator metadata.
```

Initial command form for a persistent case:

```bash
codex exec --dangerously-bypass-hook-trust -s workspace-write -C . \
  -m gpt-5.6-sol -c 'model_reasoning_effort="medium"' --json \
  -o /tmp/CASE-turn-1.md \
  'Act as a fresh user-facing evaluator. Read and follow only the revised public skill at skills/voice-to-script-en-ch, its routed repository references, and any required installed polishing dependency that the public skill explicitly routes. Treat the stdin block as the only raw user request for this turn. Do not inspect behavioral scenarios, rubric, baseline, result, finding, design, plan, report, or prior-output files. Do not modify the repository; use temporary files only when the public skill requires runtime estimation. Return only the exact user-facing response, without grading or evaluator metadata.' \
  < RAW-TURN-1.md
```

Capture the `thread_id` from the `thread.started` JSON event. Resume with each later raw turn, in order:

```bash
codex exec resume --dangerously-bypass-hook-trust \
  -m gpt-5.6-sol -c 'model_reasoning_effort="medium"' --json \
  -o /tmp/CASE-turn-N.md THREAD_ID - < RAW-TURN-N.md
```

For a one-turn case, add `--ephemeral` to the initial command.

## Exact raw-turn sequences

- Packet 2 refreshed selection: `final-fix-packet-2-turn-1.md`, `final-fix-packet-2-turn-2.md`, `final-fix-packet-2-turn-3.md`, `final-fix-packet-2-turn-4.md`.
- Packet 3 reproducibility: one-turn `packet-3-bilingual-ready.md`.
- Scenario 63 and selected-angle `draft now`: `final-fix-selected-angle-source.md`, `final-fix-scenario-63-turn-2.md`, `final-fix-scenario-63-turn-3.md`.
- Scenario 65: `final-fix-selected-angle-source.md`, `final-fix-scenario-65-turn-2.md`, `final-fix-scenario-65-turn-3.md`.
- Scenario 67: `final-fix-scenario-67-turn-1.md`, `final-fix-scenario-67-turn-2.md`.
- Scenario 69: one-turn `final-fix-scenario-69.md`.
- Short-finalization source-fidelity rerun: one-turn `packet-4-short-finalize.md`.

The exact assistant messages, session identifiers, commands, grades, and any runtime extraction are recorded in `final-fix-results.md` beside the corresponding raw turns.
