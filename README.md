# Zero-Knowledge Proof (ZKP) 기반 보안 속성 분석 프로젝트 계획서

## 프로젝트 목표

- 실제 영지식 증명(ZKP) 모듈을 실습하고, 각 모듈이 **Completeness, Soundness, Zero-Knowledgeness**의 세 가지 핵심 보안 속성을 만족하는지 평가한다.
- 오픈소스 모듈의 코드를 직접 분석하여 ZK 시스템의 설계 구조를 깊이 이해하고, **취약하거나 안전하지 않은 구현을 식별**한다.
- 보안 속성 위반 시나리오를 설계하고, 이를 통해 ZK 모듈의 **취약점 실험 기반 분석**을 수행한다.

---

##  프로젝트 진행 순서 및 우선순위

### 1. Circom + snarkjs 기반 실습 (기본기 익히기)
- [ ] `multiplier.circom`과 같은 간단한 회로를 구현하고 ZK-SNARK 프로토콜 전체 흐름 실습
    - 회로 컴파일 → witness 생성 → trusted setup → proof 생성 → 검증
- [ ] 실습 시 확인할 보안 속성:
    - Constraint 누락 여부 (Completeness 깨짐 실험)
    - private input 누출 여부 (Zero-Knowledge 깨짐 실험)
- [ ] trusted setup에서 zkey 파일 유출 시 공격 가능성 실험 (Soundness 깨짐)

> 참고: [https://docs.circom.io](https://docs.circom.io)

---

### 2. 보안 속성별 개념 및 위반 시나리오 정리
- [ ] Completeness: constraint 미작성/검사 누락 → 증명 생성 불가
- [ ] Soundness: trusted setup 조작 → 허위 입력으로도 valid proof 생성 가능
- [ ] Zero-Knowledgeness: private input이 proof에 직접 포함되거나 시뮬레이터로 대체 불가능한 경우

> 참고: Trail of Bits 블로그 - ZK Bugs You Should Know About

---

### 3. 다양한 ZKP 시스템/라이브러리 탐색 및 비교
- [ ] ZoKrates (ZK-SNARK, Solidity 연동 친화)
- [ ] Halo2 (no trusted setup, recursive proof)
- [ ] zk-STARK (Starknet, Cairo 기반)
- [ ] Bulletproofs (range proof 특화)

> 비교 기준: 보안 속성, 증명 크기, 속도, trusted setup 유무, 학습 난이도 등

---

### 4. 오픈소스 코드 분석 및 아키텍처 이해
- [ ] circom 라이브러리의 회로 정의 언어 구조 분석
- [ ] snarkjs의 proof 생성/검증 플로우 코드 읽기
- [ ] Halo2, ZoKrates 등 각 ZK 모듈의 회로-증명 연결 구조 분석
- [ ] Simulator 구현 가능성 분석 (Zero-Knowledge 실험)

> 추천 저장소:
> - [https://github.com/iden3/circom](https://github.com/iden3/circom)
> - [https://github.com/iden3/snarkjs](https://github.com/iden3/snarkjs)
> - [https://github.com/zcash/halo2](https://github.com/zcash/halo2)

---

### 5. 취약 회로 설계 및 보안 속성 깨뜨리기 실험
- [ ] 의도적으로 제약식을 생략한 회로 설계 → Completeness 위반 유도
- [ ] public input에 private 값 노출 → Zero-Knowledge 위반 유도
- [ ] trusted setup 중 “toxic waste” 유출을 가정한 공격 실험 → Soundness 위반

---

### 6. 참고 논문 및 자료 기반 이론 보완
- [ ] "A Survey on Zero-Knowledge Proofs: From Theory to Engineering"
- [ ] "ZKProof Standardization Documents"
- [ ] "ZK Bugs You Should Know About"
- [ ] "Succinct Non-Interactive Zero-Knowledge for a von Neumann Architecture" (Zcash, Halo2)
- [ ] "Security Analysis of ZK-SNARK Implementations" (USENIX)

---

## 산출물 제안

- Circom 실습 리포트 및 회로 코드
- 각 보안 속성별 실험 결과 정리표
- 오픈소스 모듈별 구조/보안 비교 분석 리포트
- 취약 회로 및 공격 재현 코드
- 논문 기반 정리 보고서 및 발표 자료

---

## 환경 및 도구

- circom v2, snarkjs
- Node.js, Docker (권장)
- VSCode, GitHub
- 가능 시 Cairo CLI, Halo2 Rust 환경 등

