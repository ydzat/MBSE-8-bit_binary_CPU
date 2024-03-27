package processor.arithmetics;
import processor.arithmetics.MultiBitAdder;
import processor.circuits.AlwaysFalse;
import processor.circuits.AlwaysTrue;
component Increment {
    port in boolean b7, b6, b5, b4, b3, b2, b1, b0;
    port out boolean s7, s6, s5, s4, s3, s2, s1, s0;

    MultiBitAdder m;
    AlwaysFalse f;
    AlwaysTrue t;

    f.out -> m.a7;
    f.out -> m.a6;
    f.out -> m.a5;
    f.out -> m.a4;
    f.out -> m.a3;
    f.out -> m.a2;
    f.out -> m.a1;
    f.out -> m.a0;

    b7 -> m.b7;
    b6 -> m.b6;
    b5 -> m.b5;
    b4 -> m.b4;
    b3 -> m.b3;
    b2 -> m.b2;
    b1 -> m.b1;
    b0 -> m.b0;

    t.out -> m.cin;

    m.s0 -> s0;
    m.s1 -> s1;
    m.s2 -> s2;
    m.s3 -> s3;
    m.s4 -> s4;
    m.s5 -> s5;
    m.s6 -> s6;
    m.s7 -> s7;
}