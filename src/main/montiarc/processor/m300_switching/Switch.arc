package processor.m300_switching;
import processor.m300_switching.Selector;
import processor.m000_circuits.AlwaysFalse;
component Switch {
    port in boolean s, d;
    port out boolean c1, c0;

    AlwaysFalse f;
    Selector s0;
    Selector s1;

    d -> s0.d0;
    d -> s1.d1;

    s -> s0.s;
    s -> s1.s;

    f.out -> s0.d1;
    f.out -> s1.d0;

    s0.out -> c0;
    s1.out -> c1;

}