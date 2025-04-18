package processor.m100_logicGates;
import processor.m100_logicGates.NANDGate;
import processor.m100_logicGates.InvertGate;


component ANDGate {
    port in boolean a;
    port in boolean b;
    port out boolean out;
    NANDGate nand;
    InvertGate inv;
    a -> nand.a;
    b -> nand.b;
    nand.out -> inv.a;
    inv.out -> out;
}