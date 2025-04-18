package processor.m000_circuits;

component RelayDefaultOff {
    port in boolean a;
    port in boolean b;
    port out boolean out;
    compute { out = a ? b : false; }
}