package processor.arithmetic_logic_unit;
import processor.switching.Selector8;
import processor.arithmetics.Subtraction;
import processor.arithmetics.MultiBitAdder;
import processor.circuits.AlwaysFalse;
import processor.circuits.AlwaysTrue;
component ArithmeticUnit {
    port in boolean op0, op1;
    port in boolean x0, x1, x2, x3, x4, x5, x6, x7;
    port in boolean y0, y1, y2, y3, y4, y5, y6, y7;
    port out boolean out0, out1, out2, out3, out4, out5, out6, out7;

    AlwaysFalse f;
    AlwaysTrue t;

    MultiBitAdder add8;
    Selector8 s0;
    Selector8 s1;
    Subtraction sub;

    op1 -> s1.s;
    op0 -> s0.s;

    f.out -> add8.cin;
    x0 -> add8.a0;
    x1 -> add8.a1;
    x2 -> add8.a2;
    x3 -> add8.a3;
    x4 -> add8.a4;
    x5 -> add8.a5;
    x6 -> add8.a6;
    x7 -> add8.a7;

    x0 -> sub.a0;
    x1 -> sub.a1;
    x2 -> sub.a2;
    x3 -> sub.a3;
    x4 -> sub.a4;
    x5 -> sub.a5;
    x6 -> sub.a6;
    x7 -> sub.a7;

    y0  -> s0.d00;
    y1  -> s0.d10;
    y2  -> s0.d20;
    y3  -> s0.d30;
    y4  -> s0.d40;
    y5  -> s0.d50;
    y6  -> s0.d60;
    y7  -> s0.d70;

    t.out  -> s0.d01;
    f.out  -> s0.d11;
    f.out  -> s0.d21;
    f.out  -> s0.d31;
    f.out  -> s0.d41;
    f.out  -> s0.d51;
    f.out  -> s0.d61;
    f.out  -> s0.d71;

    s0.out0 -> sub.b0;
    s0.out1 -> sub.b1;
    s0.out2 -> sub.b2;
    s0.out3 -> sub.b3;
    s0.out4 -> sub.b4;
    s0.out5 -> sub.b5;
    s0.out6 -> sub.b6;
    s0.out7 -> sub.b7;

    s0.out0 -> add8.b0;
    s0.out1 -> add8.b1;
    s0.out2 -> add8.b2;
    s0.out3 -> add8.b3;
    s0.out4 -> add8.b4;
    s0.out5 -> add8.b5;
    s0.out6 -> add8.b6;
    s0.out7 -> add8.b7;

    add8.s0 -> s1.d00;
    add8.s1 -> s1.d10;
    add8.s2 -> s1.d20;
    add8.s3 -> s1.d30;
    add8.s4 -> s1.d40;
    add8.s5 -> s1.d50;
    add8.s6 -> s1.d60;
    add8.s7 -> s1.d70;

    sub.s0 -> s1.d01;
    sub.s1 -> s1.d11;
    sub.s2 -> s1.d21;
    sub.s3 -> s1.d31;
    sub.s4 -> s1.d41;
    sub.s5 -> s1.d51;
    sub.s6 -> s1.d61;
    sub.s7 -> s1.d71;

    s1.out0 -> out0;
    s1.out1 -> out1;
    s1.out2 -> out2;
    s1.out3 -> out3;
    s1.out4 -> out4;
    s1.out5 -> out5;
    s1.out6 -> out6;
    s1.out7 -> out7;
}