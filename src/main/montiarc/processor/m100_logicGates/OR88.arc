package processor.m100_logicGates;

import processor.m100_logicGates.OR8;

component OR88{

    port in boolean a7, a6, a5, a4, a3, a2, a1, a0;
    port in boolean b7, b6, b5, b4, b3, b2, b1, b0;
    port in boolean c7, c6, c5, c4, c3, c2, c1, c0;
    port in boolean d7, d6, d5, d4, d3, d2, d1, d0;
    port in boolean e7, e6, e5, e4, e3, e2, e1, e0;
    port in boolean f7, f6, f5, f4, f3, f2, f1, f0;
    port in boolean g7, g6, g5, g4, g3, g2, g1, g0;
    port in boolean h7, h6, h5, h4, h3, h2, h1, h0;

    port out boolean s7, s6, s5, s4, s3, s2, s1, s0;

    OR8 or6,or5,or4,or3,or2,or1,or0;

    a7 -> or6.a7;
    a6 -> or6.a6;
    a5 -> or6.a5;
    a4 -> or6.a4;
    a3 -> or6.a3;
    a2 -> or6.a2;
    a1 -> or6.a1;
    a0 -> or6.a0;

    b7 -> or6.b7;
    b6 -> or6.b6;
    b5 -> or6.b5;
    b4 -> or6.b4;
    b3 -> or6.b3;
    b2 -> or6.b2;
    b1 -> or6.b1;
    b0 -> or6.b0;

    c7 -> or5.b7;
    c6 -> or5.b6;
    c5 -> or5.b5;
    c4 -> or5.b4;
    c3 -> or5.b3;
    c2 -> or5.b2;
    c1 -> or5.b1;
    c0 -> or5.b0;

    d7 -> or4.b7;
    d6 -> or4.b6;
    d5 -> or4.b5;
    d4 -> or4.b4;
    d3 -> or4.b3;
    d2 -> or4.b2;
    d1 -> or4.b1;
    d0 -> or4.b0;

    e7 -> or3.b7;
    e6 -> or3.b6;
    e5 -> or3.b5;
    e4 -> or3.b4;
    e3 -> or3.b3;
    e2 -> or3.b2;
    e1 -> or3.b1;
    e0 -> or3.b0;

    f7 -> or2.b7;
    f6 -> or2.b6;
    f5 -> or2.b5;
    f4 -> or2.b4;
    f3 -> or2.b3;
    f2 -> or2.b2;
    f1 -> or2.b1;
    f0 -> or2.b0;

    g7 -> or1.b7;
    g6 -> or1.b6;
    g5 -> or1.b5;
    g4 -> or1.b4;
    g3 -> or1.b3;
    g2 -> or1.b2;
    g1 -> or1.b1;
    g0 -> or1.b0;

    h7 -> or0.b7;
    h6 -> or0.b6;
    h5 -> or0.b5;
    h4 -> or0.b4;
    h3 -> or0.b3;
    h2 -> or0.b2;
    h1 -> or0.b1;
    h0 -> or0.b0;

    or6.s7 -> or5.a7;
    or6.s6 -> or5.a6;
    or6.s5 -> or5.a5;
    or6.s4 -> or5.a4;
    or6.s3 -> or5.a3;
    or6.s2 -> or5.a2;
    or6.s1 -> or5.a1;
    or6.s0 -> or5.a0;

    or5.s7 -> or4.a7;
    or5.s6 -> or4.a6;
    or5.s5 -> or4.a5;
    or5.s4 -> or4.a4;
    or5.s3 -> or4.a3;
    or5.s2 -> or4.a2;
    or5.s1 -> or4.a1;
    or5.s0 -> or4.a0;
    
    or4.s7 -> or3.a7;
    or4.s6 -> or3.a6;
    or4.s5 -> or3.a5;
    or4.s4 -> or3.a4;
    or4.s3 -> or3.a3;
    or4.s2 -> or3.a2;
    or4.s1 -> or3.a1;
    or4.s0 -> or3.a0;

    or3.s7 -> or2.a7;
    or3.s6 -> or2.a6;
    or3.s5 -> or2.a5;
    or3.s4 -> or2.a4;
    or3.s3 -> or2.a3;
    or3.s2 -> or2.a2;
    or3.s1 -> or2.a1;
    or3.s0 -> or2.a0;

    or2.s7 -> or1.a7;
    or2.s6 -> or1.a6;
    or2.s5 -> or1.a5;
    or2.s4 -> or1.a4;
    or2.s3 -> or1.a3;
    or2.s2 -> or1.a2;
    or2.s1 -> or1.a1;
    or2.s0 -> or1.a0;

    or1.s7 -> or0.a7;
    or1.s6 -> or0.a6;
    or1.s5 -> or0.a5;
    or1.s4 -> or0.a4;
    or1.s3 -> or0.a3;
    or1.s2 -> or0.a2;
    or1.s1 -> or0.a1;
    or1.s0 -> or0.a0;

    or0.s7 -> s7;
    or0.s6 -> s6;
    or0.s5 -> s5;
    or0.s4 -> s4;
    or0.s3 -> s3;
    or0.s2 -> s2;
    or0.s1 -> s1;
    or0.s0 -> s0;

}