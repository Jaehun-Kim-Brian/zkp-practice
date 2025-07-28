# Analysis: Soundness Failure — Fake Eqaulity Accepted

## Experiment Overview

- **Circuit**: `fake_equality.circom`
- The circuit accepts two inputs `a ` and `b`, but **does not impose any constraints** between them.
- In this experiment, the inputs are `a = 3` and `b = 11`, which clearly do **not** satisfy `a == b`.
- However, the circuit is deliberately designed to ** omit the constraint** that enforces equality.

    Although this experiment is structually similar to the completeness failure case-both omit critical constraints-the distinction lies in the **truth value of the statement being proved**.  
    In the completeness test, a true statement failed to be validated; here, a false statement is successfully accepted.  
    This highlights the **different failure modes of completeness and soundness**, even when caused by similar circuit design flaws.
---

## Proof & Verification Results

- Witness generation: Success
- Proof generation: Success
- Verification result: `[INFO]  snarkJS: OK!` → **Verifier accepted the proof**

---

## Problem Analysis

- Since the circuit does **not include any constraint relating `a` and `b`**, the prover can supply any values, and the verifier will still accept the proof.
- In this case, a **false statement** (*"3 equals 11"*) was effectively "proven" successfully. 
- This demonstrates a **critical violation of the soundness property**.

---

## Security Interpretation

- The soundness property requires that:
    > *"If the statement is false, no prover should be able to convince the verifier."*
    
- However, in this case:
    - The prover constructed a proof without proving anything meaningful.
    - The verifier accepted the proof without validating the core statement.
    
- This is a **structural failure**, where **soundness is undermined by a missing constraint** rather than by a malicious prover.
- It highlights how zk-SNARK soundness depends not just on cryptographic correctness, but also on **circuit completeness and correctness**. 

---

## Lesson Learned

- Even with a secure zk-SNARK protocol, **a poorly designed circuit can silently allow invalid proofs to succeed**.
- This experiment reinforces the need for careful review of circuit logic, especially when expressing conditions like equality, range checks, or cryptographic relationships.