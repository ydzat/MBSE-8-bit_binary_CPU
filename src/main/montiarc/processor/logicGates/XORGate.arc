package processor.logicGates;
import processor.logicGates.NANDGate;
import processor.logicGates.ORGate;
import processor.logicGates.ANDGate;

component XORGate {
    port in boolean a;
    port in boolean b;
    port out boolean out;
    NANDGate nand;
    ORGate or;
    ANDGate and;
    a -> nand.a;
    b -> nand.b;
    a -> or.a;
    b -> or.b;
    nand.out -> and.a;
    or.out -> and.b;
    and.out -> out;
}