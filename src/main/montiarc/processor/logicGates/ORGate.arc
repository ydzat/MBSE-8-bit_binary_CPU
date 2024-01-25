package processor.logicGates;



component ORGate {
    port in boolean a;
    port in boolean b;
    port out boolean out;
    compute { out = a || b; }
}