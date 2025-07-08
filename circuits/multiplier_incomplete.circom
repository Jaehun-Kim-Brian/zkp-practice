pragma circom 2.0.0;

template IncompleteMultiplier() {
    signal input a;
    signal input b;
    signal output c;

    // remove original constraint c <== a * b intentionally
}

component main = IncompleteMultiplier();