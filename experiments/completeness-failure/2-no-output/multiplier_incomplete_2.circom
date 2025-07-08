pragma circom 2.0.0;

template IncompleteMultiplierWithHiddenOutput() {
    signal input a;
    signal input b;

    signal c;
    c <== a*b;
    // Remove output c
}

component main = IncompleteMultiplierWithHiddenOutput();