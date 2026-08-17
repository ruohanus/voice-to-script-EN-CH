# Over-15 Runtime Release Fix

Date: 2026-08-17

## Objective

Close the two load-bearing findings that stopped the adaptive-discovery release without changing any unrelated storytelling, bilingual, research, polishing, source-integrity, or output behavior.

## Root cause

The public skill already says an above-15-minute scope decision precedes source-sufficiency assessment. The instruction is expressed mainly as prohibitions, however, while the unsupported-target branch has a concrete four-choice response. In three fresh runs the evaluator recognized missing source detail and produced that more concrete four-choice response first.

The associated Scenario 69 fixture compounds the problem. It asserts that detailed recordings exist but supplies only a short outline. That input strongly triggers the unsupported-target branch and does not independently establish the scenario predicate that the supplied source material and requested scope genuinely require more than 15 minutes. The consolidated results also retain an obsolete statement that Scenario 69 was unexercised after later recording three runs.

## Behavioral correction

Define an above-15-minute response as a positive, ordered output contract rather than another warning:

1. The observable predicate is a supplied target or expected one-video scope above 15 minutes.
2. On first detection, record the scope as unresolved and stop all drafting and source-sufficiency assessment.
3. The complete user-facing response contains only:
   - a brief acknowledgement that the requested scope exceeds the preferred window;
   - three choices in this order: one longer video, a short series, or a narrower story;
   - one recommendation based on narrative coherence.
4. Do not show the four-choice unsupported-target menu in that response.
5. Assess whether the material can support the selected shape only after the user chooses one of the three scope options.

This is an ordering correction only. It does not change the preferred 2–15-minute window, the validity of shorter or longer scripts, or the four-choice unsupported-target menu after scope is resolved.

## Evidence correction

Replace the thin Scenario 69 input with a source-grounded packet that contains enough concrete material to establish an intentional long-form story: multiple fully described scenes across the four periods, remembered dialogue status, actions, conflicts, consequences, the earned turn, and the remaining tension. The packet must not rely on a claim that omitted recordings contain the real detail.

The evaluator still receives only the public skill and raw source packet. It must not receive the expected result, scenarios, findings, or previous outputs.

Preserve the three historical failures as RED evidence. Add a fresh GREEN artifact rather than rewriting those outputs. Reconcile the consolidated grade table and remove the obsolete statement that Scenarios 63, 65, 67, and 69 are unexercised. Normalize accidental trailing whitespace in tracked evidence without altering the recorded words.

## Test strategy

Follow RED-GREEN-REFACTOR:

1. Add or tighten a deterministic contract test requiring the positive three-option response shape and target-first ordering.
2. Run it against the current skill and confirm it fails for the missing structural contract, not a test error.
3. Make the smallest production-instruction change needed to pass.
4. Run a fresh isolated Scenario 69 evaluation with the strengthened raw packet.
5. Grade the exact output for acknowledgement, all three choices, recommendation, absence of the four-choice menu, and no drafting.
6. Run package smoke, all runtime tests, package validation, range diff checks, and repository-status checks.

One failed fresh evaluation returns the work to root-cause analysis. Three failed correction attempts stop the cycle for architectural review; they do not authorize a fourth wording patch.

## Release gate

Commit, mirror the canonical local installation, and push the existing GitHub repository only when:

- the deterministic contract is green;
- fresh Scenario 69 evidence passes;
- the evidence index is internally consistent;
- the full validation suite is green;
- the final diff contains no unrelated behavior change;
- the worktree and commit-range whitespace checks are clean.

The GitHub repository name and canonical lowercase skill identity remain unchanged.
