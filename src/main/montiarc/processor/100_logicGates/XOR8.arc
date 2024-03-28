package processor.logicGates;
import processor.logicGates.XORGate;


component XOR8 {

    port in boolean a7, a6, a5, a4, a3, a2, a1, a0;
    port in boolean b7, b6, b5, b4, b3, b2, b1, b0;
    port out boolean s7, s6, s5, s4, s3, s2, s1, s0;

    XORGate n7, n6, n5, n4, n3, n2, n1, n0;
    a0 -> n0.a;
    a1 -> n1.a;
    a2 -> n2.a;
    a3 -> n3.a;
    a4 -> n4.a;
    a5 -> n5.a;
    a6 -> n6.a;
    a7 -> n7.a;

    b0 -> n0.b;
    b1 -> n1.b;
    b2 -> n2.b;
    b3 -> n3.b;
    b4 -> n4.b;
    b5 -> n5.b;
    b6 -> n6.b;
    b7 -> n7.b;
    
    n0.out -> s0;
    n1.out -> s1;
    n2.out -> s2;
    n3.out -> s3;
    n4.out -> s4;
    n5.out -> s5;
    n6.out -> s6;
    n7.out -> s7;

}