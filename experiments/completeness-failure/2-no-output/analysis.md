# Analysis: Completeness Failure — Hidden Output (No signal output declared)

## 📌 실험 개요

- 실험 회로: `multiplier_incomplete_2.circom`
- 핵심 제약 조건 `c <== a * b`는 존재하지만,
- `c`를 `signal output`으로 선언하지 않아 Verifier는 해당 연산 결과를 확인할 수 없음

---

## 증명 및 검증 결과

- witness 생성 성공
- proof 생성 성공
- 검증 결과: `[INFO] snarkJS: OK!` → **검증 통과**

---

## 문제 분석

- Prover는 정직한 입력 `a = 3`, `b = 4`로 `c = 12`를 계산했고, 제약식도 이를 요구함
- 하지만 `c`가 `signal output`으로 선언되지 않았기 때문에 **Verifier는 이 결과를 전혀 알 수 없음**
- 결국 Verifier는 “Prover가 뭘 증명했는지 모르는 상태에서” OK를 출력함

---

## 보안적 해석

- 회로의 구조적 설계 오류로 인해 **참인 명제를 증명해도 Verifier가 그 내용을 전혀 관찰할 수 없음**
- 즉, Prover는 참을 증명하려 했고 proof도 생성했지만,
  Verifier는 그 명제가 뭔지조차 몰라서, 결과적으로 completeness는 의미를 상실
- 이는 명시적인 실패는 아니더라도, **실질적인 completeness 위반** 상황

---
