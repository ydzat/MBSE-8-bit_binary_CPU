package processor.arithmetics;
import processor.logicGates.ANDGate;
import processor.logicGates.NANDGate;
import processor.logicGates.ORGate;
import processor.logicGates.InvertGate;
import processor.arithmetics.EqualToZero;
import processor.arithmetics.LessThanZero;
component Condition {
    port in boolean lt, eq, gt;
    port in boolean x7, x6, x5, x4, x3, x2, x1, x0;
    port out boolean out;

    EqualToZero iszero;
    LessThanZero isneg;
    NANDGate nand0;
    NANDGate nand1;
    NANDGate nand2;
    NANDGate nand3;
    ORGate or;
    InvertGate inv;
    ANDGate and;

    x7 -> iszero.x7;
    x6 -> iszero.x6;
    x5 -> iszero.x5;
    x4 -> iszero.x4;
    x3 -> iszero.x3;
    x2 -> iszero.x2;
    x1 -> iszero.x1;
    x0 -> iszero.x0;

    x7 -> isneg.x7;
    x6 -> isneg.x6;
    x5 -> isneg.x5;
    x4 -> isneg.x4;
    x3 -> isneg.x3;
    x2 -> isneg.x2;
    x1 -> isneg.x1;
    x0 -> isneg.x0;
    
    lt -> nand0.a;
    isneg.out -> nand0.b;

    eq -> nand1.a;
    iszero.out -> nand1.b;

    isneg.out -> or.a;
    iszero.out -> or.b;

    nand0.out -> and.a;
    nand1.out -> and.b;

    or.out -> inv.a;

    gt -> nand2.a;
    inv.out -> nand2.b;

    and.out -> nand3.a;
    nand2.out -> nand3.b;

    nand3.out -> out;
}