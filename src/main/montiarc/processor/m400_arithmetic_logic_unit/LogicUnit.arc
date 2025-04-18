package processor.m400_arithmetic_logic_unit;
import processor.m000_circuits.AlwaysFalse;
import processor.m300_switching.Selector8;
import processor.m100_logicGates.Inv8;
import processor.m100_logicGates.AND8;
import processor.m100_logicGates.OR8;
import processor.m100_logicGates.XOR8;
component LogicUnit {
    port in boolean op0, op1;
    port in boolean x0, x1, x2, x3, x4, x5, x6, x7;
    port in boolean y0, y1, y2, y3, y4, y5, y6, y7;
    port out boolean out0, out1, out2, out3, out4, out5, out6, out7;

    AlwaysFalse f;
    Inv8 inv8;
    XOR8 xor8;
    OR8 or8;
    AND8 and8;
    Selector8 s0;
    Selector8 s1;
    Selector8 s2;

    op1 -> s2.s;
    op0 -> s1.s;
    op0 -> s0.s;


    x0 -> inv8.a0;
    x1 -> inv8.a1;
    x2 -> inv8.a2;
    x3 -> inv8.a3;
    x4 -> inv8.a4;
    x5 -> inv8.a5;
    x6 -> inv8.a6;
    x7 -> inv8.a7;

    x0 -> xor8.a0;
    x0 -> or8.a0;
    x0 -> and8.a0;
    y0 -> xor8.b0;
    y0 -> or8.b0;
    y0 -> and8.b0;
    x1 -> xor8.a1;
    x1 -> or8.a1;
    x1 -> and8.a1;
    y1 -> xor8.b1;
    y1 -> or8.b1;
    y1 -> and8.b1;
    x2 -> xor8.a2;
    x2 -> or8.a2;
    x2 -> and8.a2;
    y2 -> xor8.b2;
    y2 -> or8.b2;
    y2 -> and8.b2;
    x3 -> xor8.a3;
    x3 -> or8.a3;
    x3 -> and8.a3;
    y3 -> xor8.b3;
    y3 -> or8.b3;
    y3 -> and8.b3;
    x4 -> xor8.a4;
    x4 -> or8.a4;
    x4 -> and8.a4;
    y4 -> xor8.b4;
    y4 -> or8.b4;
    y4 -> and8.b4;
    x5 -> xor8.a5;
    x5 -> or8.a5;
    x5 -> and8.a5;
    y5 -> xor8.b5;
    y5 -> or8.b5;
    y5 -> and8.b5;
    x6 -> xor8.a6;
    x6 -> or8.a6;
    x6 -> and8.a6;
    y6 -> xor8.b6;
    y6 -> or8.b6;
    y6 -> and8.b6;
    x7 -> xor8.a7;
    x7 -> or8.a7;
    x7 -> and8.a7;
    y7 -> xor8.b7;
    y7 -> or8.b7;
    y7 -> and8.b7;

    inv8.b0 -> s1.d01;
    inv8.b1 -> s1.d11;
    inv8.b2 -> s1.d21;
    inv8.b3 -> s1.d31;
    inv8.b4 -> s1.d41;
    inv8.b5 -> s1.d51;
    inv8.b6 -> s1.d61;
    inv8.b7 -> s1.d71;

    xor8.s0 -> s1.d00;
    xor8.s1 -> s1.d10;
    xor8.s2 -> s1.d20;
    xor8.s3 -> s1.d30;
    xor8.s4 -> s1.d40;
    xor8.s5 -> s1.d50;
    xor8.s6 -> s1.d60;
    xor8.s7 -> s1.d70;

    or8.s0 -> s0.d01;
    or8.s1 -> s0.d11;
    or8.s2 -> s0.d21;
    or8.s3 -> s0.d31;
    or8.s4 -> s0.d41;
    or8.s5 -> s0.d51;
    or8.s6 -> s0.d61;
    or8.s7 -> s0.d71;

    and8.s0 -> s0.d00;
    and8.s1 -> s0.d10;
    and8.s2 -> s0.d20;
    and8.s3 -> s0.d30;
    and8.s4 -> s0.d40;
    and8.s5 -> s0.d50;
    and8.s6 -> s0.d60;
    and8.s7 -> s0.d70;

    s1.out0 -> s2.d01;
    s1.out1 -> s2.d11;
    s1.out2 -> s2.d21;
    s1.out3 -> s2.d31;
    s1.out4 -> s2.d41;
    s1.out5 -> s2.d51;
    s1.out6 -> s2.d61;
    s1.out7 -> s2.d71;

    s0.out0 -> s2.d00;
    s0.out1 -> s2.d10;
    s0.out2 -> s2.d20;
    s0.out3 -> s2.d30;
    s0.out4 -> s2.d40;
    s0.out5 -> s2.d50;
    s0.out6 -> s2.d60;
    s0.out7 -> s2.d70;

    s2.out0 -> out0;
    s2.out1 -> out1;
    s2.out2 -> out2;
    s2.out3 -> out3;
    s2.out4 -> out4;
    s2.out5 -> out5;
    s2.out6 -> out6;
    s2.out7 -> out7;
}