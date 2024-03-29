package processor.m500_memory;

import processor.m100_logicGates.Decoder38;
import processor.m300_switching.Selector88;


component Register8{

    port in boolean ad2,ad1,ad0;

    port in boolean d7,d6,d5,d4,d3,d2,d1,d0;

    port in boolean cl, st, w, r;

    port out boolean a7,a6,a5,a4,a3,a2,a1,a0; 

    Register reg7,reg6,reg5,reg4,reg3,reg2,reg1,reg0;

    Decoder38 decoder1, decoder0;

    Selector88 selector;

    d7 -> reg7.d7;
    d6 -> reg7.d6;
    d5 -> reg7.d5;
    d4 -> reg7.d4;
    d3 -> reg7.d3;
    d2 -> reg7.d2;
    d1 -> reg7.d1;
    d0 -> reg7.d0;

    d7 -> reg6.d7;
    d6 -> reg6.d6;
    d5 -> reg6.d5;
    d4 -> reg6.d4;
    d3 -> reg6.d3;
    d2 -> reg6.d2;
    d1 -> reg6.d1;
    d0 -> reg6.d0;

    d7 -> reg5.d7;
    d6 -> reg5.d6;
    d5 -> reg5.d5;
    d4 -> reg5.d4;
    d3 -> reg5.d3;
    d2 -> reg5.d2;
    d1 -> reg5.d1;
    d0 -> reg5.d0;

    d7 -> reg4.d7;
    d6 -> reg4.d6;
    d5 -> reg4.d5;
    d4 -> reg4.d4;
    d3 -> reg4.d3;
    d2 -> reg4.d2;
    d1 -> reg4.d1;
    d0 -> reg4.d0;

    d7 -> reg3.d7;
    d6 -> reg3.d6;
    d5 -> reg3.d5;
    d4 -> reg3.d4;
    d3 -> reg3.d3;
    d2 -> reg3.d2;
    d1 -> reg3.d1;
    d0 -> reg3.d0;

    d7 -> reg2.d7;
    d6 -> reg2.d6;
    d5 -> reg2.d5;
    d4 -> reg2.d4;
    d3 -> reg2.d3;
    d2 -> reg2.d2;
    d1 -> reg2.d1;
    d0 -> reg2.d0;

    d7 -> reg1.d7;
    d6 -> reg1.d6;
    d5 -> reg1.d5;
    d4 -> reg1.d4;
    d3 -> reg1.d3;
    d2 -> reg1.d2;
    d1 -> reg1.d1;
    d0 -> reg1.d0;

    d7 -> reg0.d7;
    d6 -> reg0.d6;
    d5 -> reg0.d5;
    d4 -> reg0.d4;
    d3 -> reg0.d3;
    d2 -> reg0.d2;
    d1 -> reg0.d1;
    d0 -> reg0.d0;

    cl -> reg7.cl;
    cl -> reg6.cl;
    cl -> reg5.cl;
    cl -> reg4.cl;
    cl -> reg3.cl;
    cl -> reg2.cl;
    cl -> reg1.cl;
    cl -> reg0.cl;

    st -> reg7.st;
    st -> reg6.st;
    st -> reg5.st;
    st -> reg4.st;
    st -> reg3.st;
    st -> reg2.st;
    st -> reg1.st;
    st -> reg0.st;

    ad2 -> decoder1.x2;
    ad1 -> decoder1.x1;
    ad0 -> decoder1.x0;

    ad2 -> decoder0.x2;
    ad1 -> decoder0.x1;
    ad0 -> decoder0.x0;

    r -> decoder1.en;
    w -> decoder0.en;

    decoder1.a7 -> reg7.r;
    decoder1.a6 -> reg6.r;
    decoder1.a5 -> reg5.r;
    decoder1.a4 -> reg4.r;
    decoder1.a3 -> reg3.r;
    decoder1.a2 -> reg2.r;
    decoder1.a1 -> reg1.r;
    decoder1.a0 -> reg0.r;

    decoder0.a7 -> reg7.w;
    decoder0.a6 -> reg6.w;
    decoder0.a5 -> reg5.w;
    decoder0.a4 -> reg4.w;
    decoder0.a3 -> reg3.w;
    decoder0.a2 -> reg2.w;
    decoder0.a1 -> reg1.w;
    decoder0.a0 -> reg0.w;

    ad2 -> selector.ad2;
    ad1 -> selector.ad1;
    ad0 -> selector.ad0;

    reg0.a7 -> selector.d70;
    reg0.a6 -> selector.d60;
    reg0.a5 -> selector.d50;
    reg0.a4 -> selector.d40;
    reg0.a3 -> selector.d30;
    reg0.a2 -> selector.d20;
    reg0.a1 -> selector.d10;
    reg0.a0 -> selector.d00;

    reg1.a7 -> selector.d71;
    reg1.a6 -> selector.d61;
    reg1.a5 -> selector.d51;
    reg1.a4 -> selector.d41;
    reg1.a3 -> selector.d31;
    reg1.a2 -> selector.d21;
    reg1.a1 -> selector.d11;
    reg1.a0 -> selector.d01;

    reg2.a7 -> selector.d72;
    reg2.a6 -> selector.d62;
    reg2.a5 -> selector.d52;
    reg2.a4 -> selector.d42;
    reg2.a3 -> selector.d32;
    reg2.a2 -> selector.d22;
    reg2.a1 -> selector.d12;
    reg2.a0 -> selector.d02;

    reg3.a7 -> selector.d73;
    reg3.a6 -> selector.d63;
    reg3.a5 -> selector.d53;
    reg3.a4 -> selector.d43;
    reg3.a3 -> selector.d33;
    reg3.a2 -> selector.d23;
    reg3.a1 -> selector.d13;
    reg3.a0 -> selector.d03;

    reg4.a7 -> selector.d74;
    reg4.a6 -> selector.d64;
    reg4.a5 -> selector.d54;
    reg4.a4 -> selector.d44;
    reg4.a3 -> selector.d34;
    reg4.a2 -> selector.d24;
    reg4.a1 -> selector.d14;
    reg4.a0 -> selector.d04;

    reg5.a7 -> selector.d75;
    reg5.a6 -> selector.d65;
    reg5.a5 -> selector.d55;
    reg5.a4 -> selector.d45;
    reg5.a3 -> selector.d35;
    reg5.a2 -> selector.d25;
    reg5.a1 -> selector.d15;
    reg5.a0 -> selector.d05;

    reg6.a7 -> selector.d76;
    reg6.a6 -> selector.d66;
    reg6.a5 -> selector.d56;
    reg6.a4 -> selector.d46;
    reg6.a3 -> selector.d36;
    reg6.a2 -> selector.d26;
    reg6.a1 -> selector.d16;
    reg6.a0 -> selector.d06;

    reg7.a7 -> selector.d77;
    reg7.a6 -> selector.d67;
    reg7.a5 -> selector.d57;
    reg7.a4 -> selector.d47;
    reg7.a3 -> selector.d37;
    reg7.a2 -> selector.d27;
    reg7.a1 -> selector.d17;
    reg7.a0 -> selector.d07;

    selector.out7 -> a7;
    selector.out6 -> a6;
    selector.out5 -> a5;
    selector.out4 -> a4;
    selector.out3 -> a3;
    selector.out2 -> a2;
    selector.out1 -> a1;
    selector.out0 -> a0;

}