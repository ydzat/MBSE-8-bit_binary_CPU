
package processor.m600_processor;

import processor.m300_switching.Selector8;
import processor.m200_arithmetics.Condition;
import processor.m400_arithmetic_logic_unit.ALU;
import processor.m600_processor.TMP;
component Instruction {

    port in boolean i15, i14, i13, i12, i11, i10, i9, i8, i7, i6, i5, i4, i3, i2, i1, i0;
    port in boolean a7,a6,a5,a4,a3,a2,a1,a0;
    port in boolean d7,d6,d5,d4,d3,d2,d1,d0;
    port in boolean sa7,sa6,sa5,sa4,sa3,sa2,sa1,sa0;
    port out boolean r7,r6,r5,r4,r3,r2,r1,r0;
    port out boolean a, d, sa, j;
    Selector8 sel;
    ALU alu;
    Condition cond;
    TMP tmp5, tmp4, tmp3;

    i12 -> sel.s;
    a7 -> sel.d70;
    a6 -> sel.d60;
    a5 -> sel.d50;
    a4 -> sel.d40;
    a3 -> sel.d30;
    a2 -> sel.d20;
    a1 -> sel.d10;
    a0 -> sel.d00;
    sa7 -> sel.d71;
    sa6 -> sel.d61;
    sa5 -> sel.d51;
    sa4 -> sel.d41;
    sa3 -> sel.d31;
    sa2 -> sel.d21;
    sa1 -> sel.d11;
    sa0 -> sel.d01;

    d7 -> alu.x7;
    d6 -> alu.x6;
    d5 -> alu.x5;
    d4 -> alu.x4;
    d3 -> alu.x3;
    d2 -> alu.x2;
    d1 -> alu.x1;
    d0 -> alu.x0;
    sel.out7 -> alu.y7;
    sel.out6 -> alu.y6;
    sel.out5 -> alu.y5;
    sel.out4 -> alu.y4;
    sel.out3 -> alu.y3;
    sel.out2 -> alu.y2;
    sel.out1 -> alu.y1;
    sel.out0 -> alu.y0;
    i10 -> alu.u;
    i9 -> alu.op1;
    i8 -> alu.op0;
    i7 -> alu.zx;
    i6 -> alu.sw;
    
    i5 -> tmp5.in;
    i4 -> tmp4.in;
    i3 -> tmp3.in;
    
    /*
    compute {
        a = i5;
        d = i4;
        sa = i3;
    }
    */
    i2 -> cond.lt;
    i1 -> cond.eq;
    i0 -> cond.gt;
    alu.out7 -> cond.x7;
    alu.out6 -> cond.x6;
    alu.out5 -> cond.x5;
    alu.out4 -> cond.x4;
    alu.out3 -> cond.x3;
    alu.out2 -> cond.x2;
    alu.out1 -> cond.x1;
    alu.out0 -> cond.x0;

    alu.out7 -> r7;
    alu.out6 -> r6;
    alu.out5 -> r5;
    alu.out4 -> r4;
    alu.out3 -> r3;
    alu.out2 -> r2;
    alu.out1 -> r1;
    alu.out0 -> r0;
    cond.out -> j;

    tmp5.out -> a;
    tmp4.out -> d;
    tmp3.out -> sa;
    
}