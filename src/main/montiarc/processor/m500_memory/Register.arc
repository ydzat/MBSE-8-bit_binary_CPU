package processor.m500_memory;
import processor.m000_circuits.AlwaysTrue;
import processor.m100_logicGates.TriGate;
import processor.m100_logicGates.ANDGate;


// 8 bit
// input: d7-d0
// output: a7-a0

component Register {
    
    port in boolean st; 
    
    port in boolean d7;
    port in boolean d6;
    port in boolean d5;
    port in boolean d4;
    port in boolean d3;
    port in boolean d2;
    port in boolean d1;
    port in boolean d0;

    port in boolean cl;

    port out boolean a7;
    port out boolean a6;
    port out boolean a5;
    port out boolean a4;
    port out boolean a3;
    port out boolean a2;
    port out boolean a1;
    port out boolean a0;

    port in boolean w,r;

    ANDGate and;
    TriGate tg;

    cl -> and.a;
    w -> and.b;

    r -> tg.en;

    DFF dff7,dff6,dff5,dff4,dff3,dff2,dff1, dff0;

    st -> dff7.st;
    st -> dff6.st;
    st -> dff5.st;
    st -> dff4.st;
    st -> dff3.st;
    st -> dff2.st;
    st -> dff1.st;
    st -> dff0.st;

    d7 -> dff7.d;
    d6 -> dff6.d;
    d5 -> dff5.d;
    d4 -> dff4.d;
    d3 -> dff3.d;
    d2 -> dff2.d;
    d1 -> dff1.d;
    d0 -> dff0.d;

    and.out -> dff7.cl;
    and.out -> dff6.cl;
    and.out -> dff5.cl;
    and.out -> dff4.cl;
    and.out -> dff3.cl;
    and.out -> dff2.cl;
    and.out -> dff1.cl;
    and.out -> dff0.cl;

    dff7.out -> tg.di7;
    dff6.out -> tg.di6;
    dff5.out -> tg.di5;
    dff4.out -> tg.di4;
    dff3.out -> tg.di3;
    dff2.out -> tg.di2;
    dff1.out -> tg.di1;
    dff0.out -> tg.di0;

    tg.do7 -> a7;
    tg.do6 -> a6;
    tg.do5 -> a5;
    tg.do4 -> a4;
    tg.do3 -> a3;
    tg.do2 -> a2;
    tg.do1 -> a1;
    tg.do0 -> a0;
}