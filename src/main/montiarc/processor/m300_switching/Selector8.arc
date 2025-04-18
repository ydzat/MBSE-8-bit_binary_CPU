package processor.m300_switching;
import processor.m300_switching.Selector;

component Selector8 {
    port in boolean s;
    port in boolean d00, d10, d20, d30, d40, d50, d60, d70;
    port in boolean d01, d11, d21, d31, d41, d51, d61, d71;
    port out boolean out0, out1, out2, out3, out4, out5, out6, out7;

    Selector s0;
    Selector s1;
    Selector s2;
    Selector s3;
    Selector s4;
    Selector s5;
    Selector s6;
    Selector s7;

    d00 -> s0.d0;
    d01 -> s0.d1;
    d10 -> s1.d0;
    d11 -> s1.d1;
    d20 -> s2.d0;
    d21 -> s2.d1;
    d30 -> s3.d0;
    d31 -> s3.d1;
    d40 -> s4.d0;
    d41 -> s4.d1;
    d50 -> s5.d0;
    d51 -> s5.d1;
    d60 -> s6.d0;
    d61 -> s6.d1;
    d70 -> s7.d0;
    d71 -> s7.d1;

    s -> s0.s;
    s -> s1.s;
    s -> s2.s;
    s -> s3.s;
    s -> s4.s;
    s -> s5.s;
    s -> s6.s;
    s -> s7.s;

    s0.out -> out0;
    s1.out -> out1;
    s2.out -> out2;
    s3.out -> out3;
    s4.out -> out4;
    s5.out -> out5;
    s6.out -> out6;
    s7.out -> out7;
}