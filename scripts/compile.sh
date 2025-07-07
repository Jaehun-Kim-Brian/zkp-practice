#!/bin/cash

set -e

CIRCUIT_NAME=multiplier
BUILD_DIR=build

mkdir -p $BUILD_DIR

circom circuits/$CIRCUIT_NAME.circom --r1cs --wasm --sym -o $BUILD_DIR

echo "[1] CIRCUIT COMPILED: $CIRCUIT_NAME.circom"

