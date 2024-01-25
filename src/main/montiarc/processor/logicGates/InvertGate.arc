package processor.logicGates;



component InvertGate {
    port in boolean a; 
    port out boolean out;
    compute { out = !a; }
}