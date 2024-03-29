
package processor.m500_memory;

import processor.m000_circuits.AlwaysTrue;
import processor.m300_switching.Selector8;
import processor.m300_switching.Switch;

// 2^1

component RAM {

    port in boolean ad, st, cl;
    port in boolean x7,x6,x5,x4,x3,x2,x1,x0;
    port out boolean a7,a6,a5,a4,a3,a2,a1,a0;

    Switch sw;
    Selector8 selector;
    Register register1, register0;

    AlwaysTrue at;

    cl -> register1.w;
    at.out -> register1.r;

    cl -> register0.w;
    at.out -> register0.r;

    ad -> sw.s;
    st -> sw.d;

    ad -> selector.s;
    
    sw.c1 -> register1.st;
    sw.c0 -> register0.st;

    cl -> register1.cl;
    cl -> register0.cl;

    x7 -> register1.d7;
    x6 -> register1.d6;
    x5 -> register1.d5;
    x4 -> register1.d4;
    x3 -> register1.d3;
    x2 -> register1.d2;
    x1 -> register1.d1;
    x0 -> register1.d0;

    x7 -> register0.d7;
    x6 -> register0.d6;
    x5 -> register0.d5;
    x4 -> register0.d4;
    x3 -> register0.d3;
    x2 -> register0.d2;
    x1 -> register0.d1;
    x0 -> register0.d0;

    register1.a7 -> selector.d71;
    register1.a6 -> selector.d61;
    register1.a5 -> selector.d51;
    register1.a4 -> selector.d41;
    register1.a3 -> selector.d31;
    register1.a2 -> selector.d21;
    register1.a1 -> selector.d11;
    register1.a0 -> selector.d01;

    register0.a7 -> selector.d70;
    register0.a6 -> selector.d60;
    register0.a5 -> selector.d50;
    register0.a4 -> selector.d40;
    register0.a3 -> selector.d30;
    register0.a2 -> selector.d20;
    register0.a1 -> selector.d10;
    register0.a0 -> selector.d00;

    selector.out7 -> a7;
    selector.out6 -> a6;
    selector.out5 -> a5;
    selector.out4 -> a4;
    selector.out3 -> a3;
    selector.out2 -> a2;
    selector.out1 -> a1;
    selector.out0 -> a0;



}