# Analysis: Zero-Knowledge Failure - Private Input Leaked

## Experiment Overview

- **Circuit**: `leaked_private.circom`
- The circuit accepts a private input `secret` and directly assigns it to a public output `out`.
- This causes the secret to be revealed to the verifier.

---

## Proof & Verification Results

- Witness generation: Success
- Proof generation: Success
- Verification result: `[INFO]  snarkJS: OK!` → **Verifier accepted the proof**
- `public.json`: Contains the secret → **Violation**

---

## Problem Analysis

- In zk-SNARKs, private inputs should never be directly accessible to the verifier.
- The circuit exposes the secret value as a public signal, violating the **zero-knowledge property**.

---

## Security Interpretation

- A malicious verifier can learn the secret from the public output.
- Although the protocol (groth16) remains zero-knowledge in theory, **the circuit implementaiton breaks the assumption**.
- This illustrates that zero-knowledge is **not just about the proof system**, but also about **how circuits are written**.
---

## Lesson Learned

- Careless exposure of private inputs via output signals break the zero-knowledge guarantee.
- Circuit authors must strictly manage which values are public vs. private.