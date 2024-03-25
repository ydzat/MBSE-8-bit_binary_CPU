package processor.arithmetics;
import processor.logicGates.MultiBitAdder;
import processor.circuits.AlwaysFalse;
import processor.circuits.AlwaysTrue;
component Increment {
    port in boolean b7, b6, b5, b4, b3, b2, b1, b0;
    port out boolean cout;

    MultiBitAdder m;
    AlwaysFalse f;
    AlwaysFalse t;
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
    m.sum -> out;
}