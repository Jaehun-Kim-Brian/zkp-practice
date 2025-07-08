# Completeness Failure Experiment

## 1번 실험 No-Constraints 

### 실험 목적

- ZK-SNARK 회로에서 제약 조건이 생략되었을 때, 증명 구조가 어떤 식으로 무너지며 검증이 성공하는지를 실험적으로 확인

---

### 실험 회로 요약

- 회로명: `multiplier_incomplete.circom`
- 구성: 입력값 `a`, `b`와 출력값 `c`는 존재하지만, `c <== a * b` 제약은 없음

---

### 실험 파일 구성

| 파일 | 설명 |
|------|------|
| `circuit.circom` | 제약 생략된 회로 |
| `input.json` | 정답 입력값 (ex. a=3, b=11) |
| `witness.wtns` | 내부 계산 결과 |
| `proof.json`, `public.json` | 증명/검증 파일 |
| `verify.log` | 검증 로그 |
| `analysis.md` | 실험 분석 및 보안 평가 |

---

### 주요 관찰

- 회로가 아무 제약 없이 구성되어 있어, **어떤 입력이라도 증명이 성공**함
- 이는 completeness 및 soundness 모두 위협할 수 있는 구조적 문제임

---

### 실험자 주의사항

- Circom 회로 작성 시 `<==`을 누락하거나 조건 미지정 시 **아무 것도 증명하지 않게 됨**
- 검증이 통과한다고 해서, Prover가 의미 있는 것을 증명했다고 볼 수 없음

## 2번 실험 No-Output 

### 실험 목적

- 회로 내 계산 결과(`c = a * b`)는 존재하지만, `c`가 output으로 선언되지 않은 상태에서 증명이 어떻게 처리되는지를 확인
- Verifier가 증명 내용을 전혀 알 수 없는 상황에서도 검증이 OK를 반환할 수 있는지 실험

---

### 실험 회로 요약

```circom
template IncompleteWithHiddenOutput() {
    signal input a;
    signal input b;

    signal c;
    c <== a * b;
}

