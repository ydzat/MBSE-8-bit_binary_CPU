package processor.arithmetics;
import processor.logicGates.ORGate;
import processor.logicGates.InvertGate;

component EqualToZero {
    port in boolean a3, a2, a1, a0;
    port out boolean out;

    ORGate or_0;
    ORGate or_1;
    ORGate or_2;
    InvertGate inv;

    a0 -> or_0.b;
    a1 -> or_0.a;
    a2 -> or_1.b;
    a3 -> or_1.a;

    or_0.out -> or_2.b;
    or_1.out -> or_2.a;

    or_2.out -> inv.a;

    inv.out -> out;
}