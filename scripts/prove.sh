#!/bin/bash

set -e

CIRCUIT=${1:-multiplier}
BUILD_DIR=build/$CIRCUIT
PTAU=setup/pot12_final.ptau
ZKEY=$BUILD_DIR/${CIRCUIT}.zkey

# 1. Trusted setup: .r1cs + ptau -> zkey
snarkjs groth16 setup \
    $BUILD_DIR/${CIRCUIT}.r1cs \
    $PTAU \
    $ZKEY

# 2. Verification key 생성
snarkjs zkey export verificationkey \
    $ZKEY \
    $BUILD_DIR/verification_key.json

# 3. 증명생성 (witness -> proof)
snarkjs groth16 prove \
    $ZKEY \
    $BUILD_DIR/witness.wtns \
    $BUILD_DIR/proof.json \
    $BUILD_DIR/public.json 

echo "[3] PROOF GENERATED"