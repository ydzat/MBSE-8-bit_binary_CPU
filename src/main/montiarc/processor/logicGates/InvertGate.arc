package processor.logicGates;
import processor.logicGates.NANDGate;


component InvertGate {
    port in boolean a; 
    port out boolean out;
    NANDGate n;
    a -> n.a;
    a -> n.b;
    n.out -> out;
}