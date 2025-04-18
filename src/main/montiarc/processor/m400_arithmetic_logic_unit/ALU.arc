package processor.m400_arithmetic_logic_unit;
import processor.m300_switching.Selector8;
import processor.m400_arithmetic_logic_unit.ArithmeticUnit;
import processor.m400_arithmetic_logic_unit.LogicUnit;
import processor.m100_logicGates.AND8;
import processor.m100_logicGates.Inv8;
import processor.m300_switching.Selector8;
import processor.m000_circuits.AlwaysFalse;
import processor.m000_circuits.AlwaysTrue;

component ALU {
    port in boolean u, op0, op1, zx, sw;
    port in boolean x0, x1, x2, x3, x4, x5, x6, x7;
    port in boolean y0, y1, y2, y3, y4, y5, y6, y7;
    port out boolean out0, out1, out2, out3, out4, out5, out6, out7;

    Selector8 sel_0, sel_1, sel_2, sel_3;
    LogicUnit lu;
    ArithmeticUnit au;
    AND8 and8;

    AlwaysFalse f;
    AlwaysTrue t;

    zx -> sel_0.s;
    f.out -> sel_0.d01;
    f.out -> sel_0.d11;
    f.out -> sel_0.d21;
    f.out -> sel_0.d31;
    f.out -> sel_0.d41;
    f.out -> sel_0.d51;
    f.out -> sel_0.d61;
    f.out -> sel_0.d71;
    t.out -> sel_0.d00;
    t.out -> sel_0.d10;
    t.out -> sel_0.d20;
    t.out -> sel_0.d30;
    t.out -> sel_0.d40;
    t.out -> sel_0.d50;
    t.out -> sel_0.d60;
    t.out -> sel_0.d70;

    sw -> sel_1.s;
    x0 -> sel_1.d00;
    x1 -> sel_1.d10;
    x2 -> sel_1.d20;
    x3 -> sel_1.d30;
    x4 -> sel_1.d40;
    x5 -> sel_1.d50;
    x6 -> sel_1.d60;
    x7 -> sel_1.d70;
    y0 -> sel_1.d01;
    y1 -> sel_1.d11;
    y2 -> sel_1.d21;
    y3 -> sel_1.d31;
    y4 -> sel_1.d41;
    y5 -> sel_1.d51;
    y6 -> sel_1.d61;
    y7 -> sel_1.d71;

    sw -> sel_2.s;
    x0 -> sel_2.d01;
    x1 -> sel_2.d11;
    x2 -> sel_2.d21;
    x3 -> sel_2.d31;
    x4 -> sel_2.d41;
    x5 -> sel_2.d51;
    x6 -> sel_2.d61;
    x7 -> sel_2.d71;
    y0 -> sel_2.d00;
    y1 -> sel_2.d10;
    y2 -> sel_2.d20;
    y3 -> sel_2.d30;
    y4 -> sel_2.d40;
    y5 -> sel_2.d50;
    y6 -> sel_2.d60;
    y7 -> sel_2.d70;

    sel_0.out0 ->and8.a0;
    sel_0.out1 ->and8.a1;
    sel_0.out2 ->and8.a2;
    sel_0.out3 ->and8.a3;
    sel_0.out4 ->and8.a4;
    sel_0.out5 ->and8.a5;
    sel_0.out6 ->and8.a6;
    sel_0.out7 ->and8.a7;
    sel_1.out0 ->and8.b0;
    sel_1.out1 ->and8.b1;
    sel_1.out2 ->and8.b2;
    sel_1.out3 ->and8.b3;
    sel_1.out4 ->and8.b4;
    sel_1.out5 ->and8.b5;
    sel_1.out6 ->and8.b6;
    sel_1.out7 ->and8.b7;

    op1 -> au.op1;
    op0 -> au.op0;
    and8.s7 -> au.x7;
    and8.s6 -> au.x6;
    and8.s5 -> au.x5;
    and8.s4 -> au.x4;
    and8.s3 -> au.x3;
    and8.s2 -> au.x2;
    and8.s1 -> au.x1;
    and8.s0 -> au.x0;
    sel_2.out0 ->au.y0;
    sel_2.out1 ->au.y1;
    sel_2.out2 ->au.y2;
    sel_2.out3 ->au.y3;
    sel_2.out4 ->au.y4;
    sel_2.out5 ->au.y5;
    sel_2.out6 ->au.y6;
    sel_2.out7 ->au.y7;

    op1 -> lu.op1;
    op0 -> lu.op0;
    and8.s7 -> lu.x7;
    and8.s6 -> lu.x6;
    and8.s5 -> lu.x5;
    and8.s4 -> lu.x4;
    and8.s3 -> lu.x3;
    and8.s2 -> lu.x2;
    and8.s1 -> lu.x1;
    and8.s0 -> lu.x0;
    sel_2.out0 ->lu.y0;
    sel_2.out1 ->lu.y1;
    sel_2.out2 ->lu.y2;
    sel_2.out3 ->lu.y3;
    sel_2.out4 ->lu.y4;
    sel_2.out5 ->lu.y5;
    sel_2.out6 ->lu.y6;
    sel_2.out7 ->lu.y7;

    u -> sel_3.s;
    au.out7 -> sel_3.d71;
    au.out6 -> sel_3.d61;
    au.out5 -> sel_3.d51;
    au.out4 -> sel_3.d41;
    au.out3 -> sel_3.d31;
    au.out2 -> sel_3.d21;
    au.out1 -> sel_3.d11;
    au.out0 -> sel_3.d01;
    lu.out7 -> sel_3.d70;
    lu.out6 -> sel_3.d60;
    lu.out5 -> sel_3.d50;
    lu.out4 -> sel_3.d40;
    lu.out3 -> sel_3.d30;
    lu.out2 -> sel_3.d20;
    lu.out1 -> sel_3.d10;
    lu.out0 -> sel_3.d00;

    sel_3.out7 -> out7;
    sel_3.out6 -> out6;
    sel_3.out5 -> out5;
    sel_3.out4 -> out4;
    sel_3.out3 -> out3;
    sel_3.out2 -> out2;
    sel_3.out1 -> out1;
    sel_3.out0 -> out0;
}