# ZKP Practice: Experimental Exploration of Zero-Knowledge Proof Security Properties

This project aims to **visually and practically explore the core security properties of Zero-Knowledge Proofs (ZKPs)**—namely, *Completeness*, *Soundness*, and *Zero-Knowledgeness*—through simplified circuits and interactive experiments.

While zero-knowledge proofs are mathematically well-defined, their security properties often become opaque when implemented in real-world proof systems like zk-SNARKs. This project focuses on designing minimal yet illustrative test cases that reveal what can go wrong when those properties are violated—intentionally or accidentally.

--- 

## Project Goals

| Security Property | Description | Implement Plan|
|---|---|--------|
|**Completeness** | If the statement is true, the prover should always generate a valid proof. | Implemeneted (2 `Incomplete Multiplier` circuits)|
|**Soundness** | If the statement is false, no prover should be able to convince the verifier. | Planned|
|**Zero-Knowledgeness** | The verifier should learn nothing beyond the truth of the statement. | Planned|

---

##  Experiments 

This project includes several minimal zk-SNARK circuit experiments designed to explore failures or subtleties in the **completeness**, **soundness**, and **zero-knowledge** properties.

Detailed analysis for each experiment is documented separately in its corresponding directory under `experiments/`.

|Experiemnt | Description | Analysis|
|----|----|-----|
|[**Completeness Failure - Incomplete Constraint**](https://github.com/Jaehun-Kim-Brian/zkp-practice/tree/main/experiments/completeness-failure/1-no-constraints)| Omits core constraint (`c <== a * b`), so the circuit cannot validate true/false statements.| [View Analysis](https://github.com/Jaehun-Kim-Brian/zkp-practice/blob/main/experiments/completeness-failure/1-no-constraints/analysis.md)|
|[**Completeness Failure - Hidden Output**](https://github.com/Jaehun-Kim-Brian/zkp-practice/tree/main/experiments/completeness-failure/2-no-output)| Computes `c <== a * b` correctly, but fails to declare `c` as an output, so verifier learns nothing.| [View Analysis](https://github.com/Jaehun-Kim-Brian/zkp-practice/blob/main/experiments/completeness-failure/2-no-output/analysis.md)|
|[**Soundenss Failure - Fake Equality**](https://github.com/Jaehun-Kim-Brian/zkp-practice/tree/main/experiments/soundness-failure/1-fake-equality)| Circuit omits equality constraints between inputs `a` and `b`, allowing any proof to succeed.| [View Analysis](https://github.com/Jaehun-Kim-Brian/zkp-practice/tree/main/experiments/soundness-failure/1-fake-equality/analysis.md)|
|[**Zero-Knowledge Failure - Private Input Leak**](https://github.com/Jaehun-Kim-Brian/zkp-practice/tree/main/experiments/zero-knowledge-failure/1-leaked-private)| Private input is incorrectly exposed as public output | [View Analysis](https://github.com/Jaehun-Kim-Brian/zkp-practice/tree/main/experiments/zero-knowledge-failure/1-leaked-private/analysis.md)|

---

## Project  & Future Work

- [x] Completeness test with faulty circuit 
- [x] Soundness test with crafted false claim
- [x] Zero-knowledge simulation and side-channel test
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
