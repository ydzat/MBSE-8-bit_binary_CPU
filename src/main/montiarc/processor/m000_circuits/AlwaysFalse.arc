package processor.m000_circuits;

component AlwaysFalse {
    port out boolean out;
    compute { out = false; }
}