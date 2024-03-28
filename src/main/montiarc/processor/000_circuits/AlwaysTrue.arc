package processor.circuits;

component AlwaysTrue {
    port out boolean out;
    compute { out = true; }
}