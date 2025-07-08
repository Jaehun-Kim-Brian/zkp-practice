#!/bin/bash

set -e

CIRCUIT=${1:-multiplier}
BUILD_DIR=build/$CIRCUIT

snarkjs groth16 verify \
    $BUILD_DIR/verification_key.json \
    $BUILD_DIR/public.json \
    $BUILD_DIR/proof.json \
    > $BUILD_DIR/verify.log

echo "[4] PROOF VERIFIED - log saved to $BUILD_DIR/verify.log"