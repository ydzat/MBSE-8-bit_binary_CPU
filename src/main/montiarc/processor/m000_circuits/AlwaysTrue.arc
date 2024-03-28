package processor.m000_circuits;

component AlwaysTrue {
    port out boolean out;
    compute { out = true; }
}