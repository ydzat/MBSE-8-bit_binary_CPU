package processor.m100_logicGates;

component ANDGate3 {
    port in boolean a;
    port in boolean b;
    port in boolean c;

    port out boolean out;

    ANDGate and1, and0;

    a -> and1.a;
    b -> and1.b;

    and1.out -> and0.a;
    c -> and0.b;

    and0.out -> out;


}