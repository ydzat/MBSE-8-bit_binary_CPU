package processor.logicGates;

component NOTGate {
    port in boolean a;
    port out boolean out;
    compute { out = !a; }
}