# Analysis: Completeness Failure (Incomplete Multiplier)

## 실험 개요

- 실험 회로: `multiplier_incomplete.circom`
- 핵심 제약 조건 `c <== a * b`를 생략하여 회로가 명제의 참/거짓을 판단할 수 없는 상태로 구성됨
- 올바른 입력값(`a=3`, `b=11`)을 넣었지만, 회로에는 그것을 검증하는 조건(증명)이 존재하지 않음

---

## 증명 및 검증 결과

- witness 생성 성공
- proof 생성 성공
- 검증 결과: `[INFO] snarkJS: OK!` → **검증 통과**

---

## 문제 분석

- 회로가 **올바른 연산 조건을 전혀 명시하지 않아서** Prover가 어떤 입력을 넣어도 Verifier는 OK를 반환
- 이는 **Prover가 참인 명제를 가졌을 때, 회로가 그것을 증명하도록 강제하지 않음**
- 결국, completeness 조건:  
  > *"참인 명제를 가진 Prover는 항상 증명을 만들 수 있어야 한다"*  
  는 **형식상은 만족하지만, 실질적으로는 성립하지 않음**

---

## 보안적 해석

- Prover는 “내가 곱셈을 정확히 할 수 있다”는 걸 증명하지 않았는데도 증명이 성공함
- 이로 인해 **Verifier가 OK를 반환하는 것이 무의미**해짐
- 이는 증명 자체가 없음(올바르지 않음)에도 불구하고 **Verifier가 OK를 반환하기에** **soundness 위반 가능성**도 함께 내포함

---
