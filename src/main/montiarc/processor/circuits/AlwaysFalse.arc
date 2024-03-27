package processor.circuits;

component AlwaysFalse {
    port out boolean out;
    compute { out = false; }
}