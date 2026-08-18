# Testing

`tests/behavioral/scenarios.md` defines 77 required behavior cases. `tests/behavioral/rubric.md` grades observable behavior, including source fidelity, friction, adaptive discovery, runtime, engaging endings, platform-title packages, external-polish handoff, evidence quality, spoken naturalness, bilingual parity, dependency invocation, and output cleanliness.

Run deterministic and static checks with:

```bash
python3 -m unittest tests/test_runtime_estimator.py -v
sh tests/test_package_smoke.sh
```

Behavioral tests must run in fresh contexts. High-variance behaviors need multiple replicas. Preserve prompts, outputs, environment state, and execution traces when the host exposes them; prose claims that a required dependency ran are not trace evidence.
