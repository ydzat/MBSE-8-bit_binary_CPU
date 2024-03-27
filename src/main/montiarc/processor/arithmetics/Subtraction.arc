package processor.arithmetics;
import processor.arithmetics.MultiBitAdder;
import processor.logicGates.Inv8;
import processor.logicGates.InvertGate;
import processor.circuits.AlwaysFalse;

component Subtraction {
    port in boolean a7, a6, a5, a4, a3, a2, a1, a0;
    port in boolean b7, b6, b5, b4, b3, b2, b1, b0;
    port out boolean s7, s6, s5, s4, s3, s2, s1, s0;

    MultiBitAdder m;
    Inv8 inv8;
    InvertGate inv;
    AlwaysFalse f;

    a7 -> m.a7;
    a6 -> m.a6;
    a5 -> m.a5;
    a4 -> m.a4;
    a3 -> m.a3;
    a2 -> m.a2;
    a1 -> m.a1;
    a0 -> m.a0;

    b7 -> inv8.a7;
    b6 -> inv8.a6;
    b5 -> inv8.a5;
    b4 -> inv8.a4;
    b3 -> inv8.a3;
    b2 -> inv8.a2;
    b1 -> inv8.a1;
    b0 -> inv8.a0;

    f.out -> inv.a;

    inv8.b7 -> m.b7;
    inv8.b6 -> m.b6;
    inv8.b5 -> m.b5;
    inv8.b4 -> m.b4;
    inv8.b3 -> m.b3;
    inv8.b2 -> m.b2;
    inv8.b1 -> m.b1;
    inv8.b0 -> m.b0;

    inv.out -> m.cin;

    m.s0 -> s0;
    m.s1 -> s1;
    m.s2 -> s2;
    m.s3 -> s3;
    m.s4 -> s4;
    m.s5 -> s5;
    m.s6 -> s6;
    m.s7 -> s7;
}