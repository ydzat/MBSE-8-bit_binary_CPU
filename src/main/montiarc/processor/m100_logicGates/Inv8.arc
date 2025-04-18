package processor.m100_logicGates;
import processor.m100_logicGates.InvertGate;


component Inv8 {

    port in boolean a7, a6, a5, a4, a3, a2, a1, a0;
    port out boolean b7, b6, b5, b4, b3, b2, b1, b0;

    InvertGate n7, n6, n5, n4, n3, n2, n1, n0;
    a0 -> n0.a;
    a1 -> n1.a;
    a2 -> n2.a;
    a3 -> n3.a;
    a4 -> n4.a;
    a5 -> n5.a;
    a6 -> n6.a;
    a7 -> n7.a;
    
    n0.out -> b0;
    n1.out -> b1;
    n2.out -> b2;
    n3.out -> b3;
    n4.out -> b4;
    n5.out -> b5;
    n6.out -> b6;
    n7.out -> b7;

}