package processor.m500_memory;

import processor.m300_switching.Selector8;
import processor.m100_logicGates.InvertGate;
import processor.m200_arithmetics.Increment;


// 8 bit
// input data: x7-x0
// input inc8: d0
// output: a7-a0

component Counter {

    port in boolean st;
    port in boolean cl;

    port in boolean x7;
    port in boolean x6;
    port in boolean x5;
    port in boolean x4;
    port in boolean x3;
    port in boolean x2;
    port in boolean x1;
    port in boolean x0;

    port out boolean a7;
    port out boolean a6;
    port out boolean a5;
    port out boolean a4;
    port out boolean a3;
    port out boolean a2;
    port out boolean a1;
    port out boolean a0;

    component Zero{
        port out boolean out;
        compute{
            out = false;
        }
    }

    Increment inc;
    Selector8 selector;
    InvertGate inv;
    Register register;

    Zero zero;
    zero.out -> inv.a;
    inv.out -> register.st;

    st -> selector.s;

    x7 -> selector.d71;
    x6 -> selector.d61;
    x5 -> selector.d51;
    x4 -> selector.d41;
    x3 -> selector.d31;
    x2 -> selector.d21;
    x1 -> selector.d11;
    x0 -> selector.d01;

    component DelayOut{
        port in boolean x7,x6,x5,x4,x3,x2,x1,x0;
        port <<delayed>> out boolean a7,a6,a5,a4,a3,a2,a1,a0;
        init {
            a7 = false;
            a6 = false;
            a5 = false;
            a4 = false;
            a3 = false;
            a2 = false;
            a1 = false;
            a0 = false;
        }
        compute {
            a7 = x7;
            a6 = x6;
            a5 = x5;
            a4 = x4;
            a3 = x3;
            a2 = x2;
            a1 = x1;
            a0 = x0;
        }
    }

    DelayOut delayout;

    delayout.a7 -> selector.d70;
    delayout.a6 -> selector.d60;
    delayout.a5 -> selector.d50;
    delayout.a4 -> selector.d40;
    delayout.a3 -> selector.d30;
    delayout.a2 -> selector.d20;
    delayout.a1 -> selector.d10;
    delayout.a0 -> selector.d00;

    selector.out7 -> register.d7;
    selector.out6 -> register.d6;
    selector.out5 -> register.d5;
    selector.out4 -> register.d4;
    selector.out3 -> register.d3;
    selector.out2 -> register.d2;
    selector.out1 -> register.d1;
    selector.out0 -> register.d0;

    cl -> register.cl;

    register.a7 -> inc.b7;
    register.a6 -> inc.b6;
    register.a5 -> inc.b5;
    register.a4 -> inc.b4;
    register.a3 -> inc.b3;
    register.a2 -> inc.b2;
    register.a1 -> inc.b1;
    register.a0 -> inc.b0;

    inc.s7 -> delayout.x7;
    inc.s6 -> delayout.x6;
    inc.s5 -> delayout.x5;
    inc.s4 -> delayout.x4;
    inc.s3 -> delayout.x3;
    inc.s2 -> delayout.x2;
    inc.s1 -> delayout.x1;
    inc.s0 -> delayout.x0;

    register.a7 -> a7;
    register.a6 -> a6;
    register.a5 -> a5;
    register.a4 -> a4;
    register.a3 -> a3;
    register.a2 -> a2;
    register.a1 -> a1;
    register.a0 -> a0;

}