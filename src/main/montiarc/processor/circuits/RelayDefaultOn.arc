package processor.circuits;

component RelayDefaultOn {
    port in boolean a;
    port in boolean b;
    port out boolean out;
    compute { out = a ? false : b; }
}