
---

## 기본 실습 단계

| 단계 | 내용 | 완료 여부 |
|------|------|------------|
| Circom 설치 및 버전 확인 | `circom --version` | ✅ |
| snarkjs 설치 및 테스트 | `snarkjs --help` | ✅ |
| 회로 파일 작성 | `multiplier.circom` 등 | ☐ |
| 회로 컴파일 | `circom multiplier.circom --r1cs --wasm` | ☐ |
| 입력값 작성 | `input.json` 생성 | ☐ |
| witness 생성 | `node generate_witness.js` 실행 | ☐ |
| trusted setup (powers of tau) | `snarkjs powersoftau` → `zkey` 생성 | ☐ |
| verification key 추출 | `snarkjs zkey export verificationkey` | ☐ |
| proof 생성 | `snarkjs groth16 prove` | ☐ |
| proof 검증 | `snarkjs groth16 verify` | ☐ |

---

## 보안 속성 실험

### 1. Completeness 위반 실험

| 항목 | 설명 | 완료 여부 |
|------|------|------------|
| constraint 일부 생략 | 일부 제약조건 없이 회로 작성 | ☐ |
| 입력은 유효하지만 proof 실패 유도 | completeness 깨짐 관찰 | ☐ |

### 2. Soundness 위반 실험

| 항목 | 설명 | 완료 여부 |
|------|------|------------|
| 동일한 회로로 두 번 trusted setup → zkey 비교 | | ☐ |
| 잘못된 input에 대해 trusted setup 유출 가정 공격 | | ☐ |

### 3. Zero-Knowledgeness 위반 실험

| 항목 | 설명 | 완료 여부 |
|------|------|------------|
| private → public input 처리 오류 | 입력 유출 여부 확인 | ☐ |
| proof 내용 분석 | secret 정보 포함 여부 탐색 | ☐ |
| simulator 불가능성 이론적 확인 | | ☐ |

---

## 참고 문서 및 논문 (docs/에 정리 권장)

- ZKProof 공식 문서: https://zkproof.org
- ZK Bugs (Trail of Bits): https://blog.trailofbits.com/2022/12/05/zk-bugs-you-should-know-about/
- Halo2 논문: https://eprint.iacr.org/2020/499
- ZK Survey: https://eprint.iacr.org/2022/541.pdf

