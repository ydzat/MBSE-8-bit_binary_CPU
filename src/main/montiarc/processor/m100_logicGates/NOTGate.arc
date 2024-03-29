package processor.m100_logicGates;

component NOTGate {
    port in boolean a;
    port out boolean out;
    compute { out = !a; }
}