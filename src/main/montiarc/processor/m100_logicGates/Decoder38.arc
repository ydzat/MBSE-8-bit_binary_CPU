package processor.m100_logicGates;


component Decoder38{

    port in boolean en;
    port in boolean x2,x1,x0;
    port out boolean a7,a6,a5,a4,a3,a2,a1,a0;

    InvertGate inv2,inv1,inv0;
    ANDGate4 and7,and6,and5,and4,and3,and2,and1,and0;
    //ANDGate4 and47,and46,and45,and44,and43,and42,and41,and40;

    x2 -> inv2.a;
    x1 -> inv1.a;
    x0 -> inv0.a;

    // 0
    inv2.out -> and0.a;
    inv1.out -> and0.b;
    inv0.out -> and0.c;
    en -> and0.d;
    and0.out -> a0;
    // 1
    inv2.out -> and1.a;
    inv1.out -> and1.b;
    x0 -> and1.c;
    en -> and1.d;
    and1.out -> a1;
    // 2
    inv2.out -> and2.a;
    x1 -> and2.b;
    inv0.out -> and2.c;
    en -> and2.d;
    and2.out -> a2;
    // 3
    inv2.out -> and3.a;
    x1 -> and3.b;
    x0 -> and3.c;
    en -> and3.d;
    and3.out -> a3;
    // 4
    x2 -> and4.a;
    inv1.out -> and4.b;
    inv0.out -> and4.c;
    en -> and4.d;
    and4.out -> a4;
    // 5
    x2 -> and5.a;
    inv1.out -> and5.b;
    x0 -> and5.c;
    en -> and5.d;
    and5.out -> a5;
    // 6
    x2 -> and6.a;
    x1 -> and6.b;
    inv0.out -> and6.c;
    en -> and6.d;
    and6.out -> a6;
    // 7
    x2 -> and7.a;
    x1 -> and7.b;
    x0 -> and7.c;
    en -> and7.d;
    and7.out -> a7;


}