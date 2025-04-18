package processor.m100_logicGates;

component ANDGate4 {
    port in boolean a;
    port in boolean b;
    port in boolean c;
    port in boolean d;

    port out boolean out;

    ANDGate and2, and1, and0;

    a -> and1.a;
    b -> and1.b;

    and1.out -> and0.a;
    c -> and0.b;

    and0.out -> and2.a;
    d -> and2.b;

    and2.out -> out;


}