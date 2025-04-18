package processor.m300_switching;

import processor.m100_logicGates.OR88;
import processor.m100_logicGates.Decoder38;
import processor.m300_switching.Selector8;
import processor.m000_circuits.AlwaysFalse;
import processor.m000_circuits.AlwaysTrue;

component Selector88 {
    port in boolean ad2, ad1, ad0;

    port in boolean d00, d10, d20, d30, d40, d50, d60, d70;
    port in boolean d01, d11, d21, d31, d41, d51, d61, d71;
    port in boolean d02, d12, d22, d32, d42, d52, d62, d72;
    port in boolean d03, d13, d23, d33, d43, d53, d63, d73;
    port in boolean d04, d14, d24, d34, d44, d54, d64, d74;
    port in boolean d05, d15, d25, d35, d45, d55, d65, d75;
    port in boolean d06, d16, d26, d36, d46, d56, d66, d76;
    port in boolean d07, d17, d27, d37, d47, d57, d67, d77;

    port out boolean out0, out1, out2, out3, out4, out5, out6, out7;

    Selector8 s0, s1, s2, s3, s4, s5, s6, s7;
    Decoder38 decoder;
    AlwaysFalse af;
    AlwaysTrue at;
    OR88 or;

    ad2 -> decoder.x2;
    ad1 -> decoder.x1;
    ad0 -> decoder.x0;
    at.out -> decoder.en;

    decoder.a0 -> s0.s;
    decoder.a1 -> s1.s;
    decoder.a2 -> s2.s;
    decoder.a3 -> s3.s;
    decoder.a4 -> s4.s;
    decoder.a5 -> s5.s;
    decoder.a6 -> s6.s;
    decoder.a7 -> s7.s;
    
    af.out -> s0.d00;
    af.out -> s0.d10;
    af.out -> s0.d20;
    af.out -> s0.d30;
    af.out -> s0.d40;
    af.out -> s0.d50;
    af.out -> s0.d60;
    af.out -> s0.d70;

    af.out -> s1.d00;
    af.out -> s1.d10;
    af.out -> s1.d20;
    af.out -> s1.d30;
    af.out -> s1.d40;
    af.out -> s1.d50;
    af.out -> s1.d60;
    af.out -> s1.d70;

    af.out -> s2.d00;
    af.out -> s2.d10;
    af.out -> s2.d20;
    af.out -> s2.d30;
    af.out -> s2.d40;
    af.out -> s2.d50;
    af.out -> s2.d60;
    af.out -> s2.d70;

    af.out -> s3.d00;
    af.out -> s3.d10;
    af.out -> s3.d20;
    af.out -> s3.d30;
    af.out -> s3.d40;
    af.out -> s3.d50;
    af.out -> s3.d60;
    af.out -> s3.d70;

    af.out -> s4.d00;
    af.out -> s4.d10;
    af.out -> s4.d20;
    af.out -> s4.d30;
    af.out -> s4.d40;
    af.out -> s4.d50;
    af.out -> s4.d60;
    af.out -> s4.d70;

    af.out -> s5.d00;
    af.out -> s5.d10;
    af.out -> s5.d20;
    af.out -> s5.d30;
    af.out -> s5.d40;
    af.out -> s5.d50;
    af.out -> s5.d60;
    af.out -> s5.d70;

    af.out -> s6.d00;
    af.out -> s6.d10;
    af.out -> s6.d20;
    af.out -> s6.d30;
    af.out -> s6.d40;
    af.out -> s6.d50;
    af.out -> s6.d60;
    af.out -> s6.d70;

    af.out -> s7.d00;
    af.out -> s7.d10;
    af.out -> s7.d20;
    af.out -> s7.d30;
    af.out -> s7.d40;
    af.out -> s7.d50;
    af.out -> s7.d60;
    af.out -> s7.d70;

    d00 -> s0.d01;
    d10 -> s0.d11;
    d20 -> s0.d21;
    d30 -> s0.d31;
    d40 -> s0.d41;
    d50 -> s0.d51;
    d60 -> s0.d61;
    d70 -> s0.d71;
    
    d01 -> s1.d01;
    d11 -> s1.d11;
    d21 -> s1.d21;
    d31 -> s1.d31;
    d41 -> s1.d41;
    d51 -> s1.d51;
    d61 -> s1.d61;
    d71 -> s1.d71;

    d02 -> s2.d01;
    d12 -> s2.d11;
    d22 -> s2.d21;
    d32 -> s2.d31;
    d42 -> s2.d41;
    d52 -> s2.d51;
    d62 -> s2.d61;
    d72 -> s2.d71;

    d03 -> s3.d01;
    d13 -> s3.d11;
    d23 -> s3.d21;
    d33 -> s3.d31;
    d43 -> s3.d41;
    d53 -> s3.d51;
    d63 -> s3.d61;
    d73 -> s3.d71;

    d04 -> s4.d01;
    d14 -> s4.d11;
    d24 -> s4.d21;
    d34 -> s4.d31;
    d44 -> s4.d41;
    d54 -> s4.d51;
    d64 -> s4.d61;
    d74 -> s4.d71;

    d05 -> s5.d01;
    d15 -> s5.d11;
    d25 -> s5.d21;
    d35 -> s5.d31;
    d45 -> s5.d41;
    d55 -> s5.d51;
    d65 -> s5.d61;
    d75 -> s5.d71;

    d06 -> s6.d01;
    d16 -> s6.d11;
    d26 -> s6.d21;
    d36 -> s6.d31;
    d46 -> s6.d41;
    d56 -> s6.d51;
    d66 -> s6.d61;
    d76 -> s6.d71;

    d07 -> s7.d01;
    d17 -> s7.d11;
    d27 -> s7.d21;
    d37 -> s7.d31;
    d47 -> s7.d41;
    d57 -> s7.d51;
    d67 -> s7.d61;
    d77 -> s7.d71;

    s0.out0 -> or.a0;
    s0.out1 -> or.a1;
    s0.out2 -> or.a2;
    s0.out3 -> or.a3;
    s0.out4 -> or.a4;
    s0.out5 -> or.a5;
    s0.out6 -> or.a6;
    s0.out7 -> or.a7;

    s1.out0 -> or.b0;
    s1.out1 -> or.b1;
    s1.out2 -> or.b2;
    s1.out3 -> or.b3;
    s1.out4 -> or.b4;
    s1.out5 -> or.b5;
    s1.out6 -> or.b6;
    s1.out7 -> or.b7;

    s2.out0 -> or.c0;
    s2.out1 -> or.c1;
    s2.out2 -> or.c2;
    s2.out3 -> or.c3;
    s2.out4 -> or.c4;
    s2.out5 -> or.c5;
    s2.out6 -> or.c6;
    s2.out7 -> or.c7;
    
    s3.out0 -> or.d0;
    s3.out1 -> or.d1;
    s3.out2 -> or.d2;
    s3.out3 -> or.d3;
    s3.out4 -> or.d4;
    s3.out5 -> or.d5;
    s3.out6 -> or.d6;
    s3.out7 -> or.d7;

    s4.out0 -> or.e0;
    s4.out1 -> or.e1;
    s4.out2 -> or.e2;
    s4.out3 -> or.e3;
    s4.out4 -> or.e4;
    s4.out5 -> or.e5;
    s4.out6 -> or.e6;
    s4.out7 -> or.e7;

    s5.out0 -> or.f0;
    s5.out1 -> or.f1;
    s5.out2 -> or.f2;
    s5.out3 -> or.f3;
    s5.out4 -> or.f4;
    s5.out5 -> or.f5;
    s5.out6 -> or.f6;
    s5.out7 -> or.f7;
    
    s6.out0 -> or.g0;
    s6.out1 -> or.g1;
    s6.out2 -> or.g2;
    s6.out3 -> or.g3;
    s6.out4 -> or.g4;
    s6.out5 -> or.g5;
    s6.out6 -> or.g6;
    s6.out7 -> or.g7;

    s7.out0 -> or.h0;
    s7.out1 -> or.h1;
    s7.out2 -> or.h2;
    s7.out3 -> or.h3;
    s7.out4 -> or.h4;
    s7.out5 -> or.h5;
    s7.out6 -> or.h6;
    s7.out7 -> or.h7;
    
    or.s7 -> out7;
    or.s6 -> out6;
    or.s5 -> out5;
    or.s4 -> out4;
    or.s3 -> out3;
    or.s2 -> out2;
    or.s1 -> out1;
    or.s0 -> out0;

}