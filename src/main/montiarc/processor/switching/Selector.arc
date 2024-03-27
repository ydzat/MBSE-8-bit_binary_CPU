package processor.switching;
import processor.logicGates.NANDGate;
import processor.logicGates.InvertGate;

component Selector {
    port in boolean s, d1, d0;
    port out boolean out;

    NANDGate nand_0;
    NANDGate nand_1;
    NANDGate nand_2;
    InvertGate inv;

    s -> inv.a;
    inv.out -> nand_0.a;
    d0 -> nand_0.b;

    s -> nand_1.a;
    d1 -> nand_1.b;

    nand_0.out -> nand_2.b;
    nand_1.out -> nand_2.a;

    nand_2.out -> out;
}