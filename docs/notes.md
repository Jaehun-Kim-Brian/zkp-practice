# Deferred or Out-of-Scope Experiments

This document lists experimental items that were initially considered for inclusion, but were determined to be either:

- Outside the scope of this project's educational/structural goals
- Too complex or abstract for circuit-level simulation
- More appropriate for theoretical study or separate project modules

---

## Soundness-related Experiments

|Item|Originial Idea|Reason of Omission|
|----|----|----|
|Repeating trusted setup on the same circuit| Compare two `.zkey` files for differences| Requires in-depth understanding of ceremony randomness; not meaningful in current structural focus |
| Trusted setup leakage → attack | Simulate attacker with knowledge of toxic waste | Requires adversarial model + prover manipulation logic; not suitable for minimal circuits|

## Zero-Knowledge-related Experiments

|Item|Originial Idea|Reason of Omission|
|----|----|----|
|Proof reveals secret input | Analyze `proof.json` to see if it leaks witness info| `groth16` is proven zero-knowledge under simulation; proof too compact to leak info without a flaw|
| Private → public input mistake | Circuit error where secret becomes public | Planned as a possible future experiment, but not yet implemented |
|Simulator impossibility| Theoretical analysis of indistinguishability | Requires formal simulation model, not easily testable via code |

## Notes
- These items may be revisited in a separate repository or later phase of the projet.
- For now, the project focuses on minimal examples of **completeness** and **soundness** failures due to circuit design issues.