package processor.m200_arithmetics;
import processor.m100_logicGates.ORGate;
import processor.m100_logicGates.InvertGate;

component EqualToZero {
    port in boolean x7, x6, x5, x4, x3, x2, x1, x0;
    port out boolean out;

    ORGate or_0;
    ORGate or_1;
    ORGate or_2;
    ORGate or_3;
    ORGate or_4;
    ORGate or_5;
    ORGate or_6;
    InvertGate inv;

    x0 -> or_0.b;
    x1 -> or_0.a;
    x2 -> or_1.b;
    x3 -> or_1.a;

    or_0.out -> or_2.b;
    or_1.out -> or_2.a;

    x4 -> or_3.b;
    x5 -> or_3.a;
    x6 -> or_4.b;
    x7 -> or_4.a;

    or_3.out -> or_5.b;
    or_4.out -> or_5.a;

    or_2.out -> or_6.a;
    or_5.out -> or_6.b;
    or_6.out -> inv.a;

    inv.out -> out;
}