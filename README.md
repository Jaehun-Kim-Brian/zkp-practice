# ZKP Practice: Experimental Exploration of Zero-Knowledge Proof Security Properties

This project aims to **visually and practically explore the core security properties of Zero-Knowledge Proofs (ZKPs)**—namely, *Completeness*, *Soundness*, and *Zero-Knowledgeness*—through simplified circuits and interactive experiments.

While zero-knowledge proofs are mathematically well-defined, their security properties often become opaque when implemented in real-world proof systems like zk-SNARKs. This project focuses on designing minimal yet illustrative test cases that reveal what can go wrong when those properties are violated—intentionally or accidentally.

--- 

## Project Goals

| Security Property | Description | Implement Plan|
|**Completeness** | If the statement is true, the prover should always generate a valid proof. | [v] Implemeneted (Incomplete Multiplier)|
|**Soundness** | If the statement is false, no prover should be able to convince the verifier. | [ ] Planned|
|**Zero-Knowledgeness** | The verifier should learn nothing beyond the truth of the statement. | [ ] Planned|

---

##  Current Experiment: Completeness Failure

### Setup

- Circuit: `multiplier_incomplete.circom`
- Constraint `c <== a * b` is intentionally omitted
- Inputs: `a = 3`, `b = 11`
- No mechanism to enforce that `c` is indeed the product of `a` and `b`

### Results

- Witness generated: [v] Success
- Proof generated: [v] Success
- Verifier output: `[INFO] snarkJS: OK!` -> [v] Accepted

### Analysis 

- The circuit lacks the constraint that ties `c` to `a * b`
- Thus, the prover could input *anything* and the verifier would still accept
- Completeness is **formally satisfied** but **semantically meaningless**

---

## Security Interpretation

- The proof **does not** demonstrate that the prover knows how to compute `a * b`
- Verifier's acceptance is meaningless in this case
- Also raises a potential **soundness concern**, since false proofs are not rejected

---

## Planned Experiments

### Soundness Violation
- Design a circuit that *looks correct* but allows the prover to prove a false statement (e.g., fake equality or fake hash preimage)
- Test if the verifier still accepts invalid statements

### Zero-Knowledge Violation
- Construct a scenario where the verifier might learn some information about the witness
- Attempt to extract secrets from the proof or simulate multiple transcripts

---

## Project Roadmap

- [v] Completeness test with faulty circuit 
- [ ] Soundness test with crafted false claim
- [ ] Zero-knowledge simulation and side-channel test
- [ ] Add interactive visualization (e.g., Matplotlib, Streamlit)
- [ ] Refactor into a reusable test suite

---

## Educational Purpose

This project is designed for:
- Students and researchers learning about ZKPs
- Security engineers validating the properties of circuits
- Anyone interested in bridging theory and implementation in cryptographic proofs

---

## References 
- [Circom Documentation](https://docs.circom.io)
- [snarkJS](https://github.com/iden3/snarkjs)
