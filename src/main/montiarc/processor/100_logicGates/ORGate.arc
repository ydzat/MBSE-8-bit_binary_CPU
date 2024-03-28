package processor.logicGates;
import processor.logicGates.NANDGate;
import processor.logicGates.InvertGate;


component ORGate {
    port in boolean a;
    port in boolean b;
    port out boolean out;
    InvertGate inv_1;
    InvertGate inv_2;
    NANDGate nand;
    a -> inv_1.a;
    b -> inv_2.a;
    inv_1.out -> nand.a;
    inv_2.out -> nand.b;
    nand.out -> out;
}