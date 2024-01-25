package processor.logicGates;



component XORGate {
    port in boolean a;
    port in boolean b;
    port out boolean out;
    compute { out = a ^ b; }
}