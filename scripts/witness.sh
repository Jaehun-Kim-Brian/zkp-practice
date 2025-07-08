#!/bin/bash

set -e

INPUT=inputs/input.json
CIRCUIT=${1:-multiplier}
BUILD_DIR=build/$CIRCUIT

node $BUILD_DIR/${CIRCUIT}_js/generate_witness.js \
    $BUILD_DIR/${CIRCUIT}_js/${CIRCUIT}.wasm \
    $INPUT \
    $BUILD_DIR/witness.wtns

snarkjs wtns export json \
    $BUILD_DIR/witness.wtns \
    $BUILD_DIR/witness.json


echo "[2] WITNESS GENERATED"