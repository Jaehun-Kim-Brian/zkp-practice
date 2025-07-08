#!/bin/bash
set -e

CIRCUIT=${1:-multiplier}
BUILD_DIR=build/$CIRCUIT

mkdir -p $BUILD_DIR

circom circuits/$CIRCUIT.circom \
    --r1cs --wasm --sym -o $BUILD_DIR

echo "[1] CIRCUIT COMPILED: $CIRCUIT.circom"

