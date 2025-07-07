#!/bin/bash

set -e

INPUT=inputs/input.json
CIRCUIT=multiplier
BUILD_DIR=build

node $BUILD_DIR/${CIRCUIT}_js/generate_witness.js \
    $BUILD_DIR/${CIRCUIT}_js/${CIRCUIT}.wasm \
    $INPUT \
    witness.wtns

echo "[2] WITNESS GENERATED"