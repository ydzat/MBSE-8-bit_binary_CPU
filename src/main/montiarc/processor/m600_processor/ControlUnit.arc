
package processor.m600_processor;
import processor.m000_circuits.AlwaysTrue;
import processor.m100_logicGates.ANDGate;
import processor.m300_switching.Selector8;
import processor.m300_switching.Selector;
import processor.m600_processor.Instruction;
component ControlUnit {

    port in boolean i15, i14, i13, i12, i11, i10, i9, i8, i7, i6, i5, i4, i3, i2, i1, i0;
    port in boolean a7,a6,a5,a4,a3,a2,a1,a0;
    port in boolean d7,d6,d5,d4,d3,d2,d1,d0;
    port in boolean sa7,sa6,sa5,sa4,sa3,sa2,sa1,sa0;
    port out boolean r7,r6,r5,r4,r3,r2,r1,r0;
    port out boolean a, d, sa;
    port out boolean j;

    AlwaysTrue t;
    Selector8 sel8;
    Selector sel;
    ANDGate and0, and1, and2;
    Instruction instruction;

    i15 -> instruction.i15;
    i14 -> instruction.i14;
    i13 -> instruction.i13;
    i12 -> instruction.i12;
    i11 -> instruction.i11;
    i10 -> instruction.i10;
    i9 -> instruction.i9;
    i8 -> instruction.i8;
    i7 -> instruction.i7;
    i6 -> instruction.i6;
    i5 -> instruction.i5;
    i4 -> instruction.i4;
    i3 -> instruction.i3;
    i2 -> instruction.i2;
    i1 -> instruction.i1;
    i0 -> instruction.i0;

    a7 -> instruction.a7;
    a6 -> instruction.a6;
    a5 -> instruction.a5;
    a4 -> instruction.a4;
    a3 -> instruction.a3;
    a2 -> instruction.a2;
    a1 -> instruction.a1;
    a0 -> instruction.a0;

    d7 -> instruction.d7;
    d6 -> instruction.d6;
    d5 -> instruction.d5;
    d4 -> instruction.d4;
    d3 -> instruction.d3;
    d2 -> instruction.d2;
    d1 -> instruction.d1;
    d0 -> instruction.d0;

    sa7 -> instruction.sa7;
    sa6 -> instruction.sa6;
    sa5 -> instruction.sa5;
    sa4 -> instruction.sa4;
    sa3 -> instruction.sa3;
    sa2 -> instruction.sa2;
    sa1 -> instruction.sa1;
    sa0 -> instruction.sa0;

    i15 -> sel8.s;
    
    instruction.r7 -> sel8.d71;
    instruction.r6 -> sel8.d61;
    instruction.r5 -> sel8.d51;
    instruction.r4 -> sel8.d41;
    instruction.r3 -> sel8.d31;
    instruction.r2 -> sel8.d21;
    instruction.r1 -> sel8.d11;
    instruction.r0 -> sel8.d01;

    i7 -> sel8.d70;
    i6 -> sel8.d60;
    i5 -> sel8.d50;
    i4 -> sel8.d40;
    i3 -> sel8.d30;
    i2 -> sel8.d20;
    i1 -> sel8.d10;
    i0 -> sel8.d00;

    i15 -> sel.s;
    instruction.a -> sel.d1;
    // i5 -> sel.d1;
    t.out -> sel.d0;

    i15 -> and0.a;
    instruction.d -> and0.b;
    //i4 -> and0.b;
    i15 -> and1.a;
    instruction.sa -> and1.b;
    // i3 -> and1.b;
    i15 -> and2.a;
    instruction.j -> and2.b;

    /* OUTPUT */

    sel8.out7 -> r7;
    sel8.out6 -> r6;
    sel8.out5 -> r5;
    sel8.out4 -> r4;
    sel8.out3 -> r3;
    sel8.out2 -> r2;
    sel8.out1 -> r1;
    sel8.out0 -> r0;

    sel.out -> a;

    and0.out -> d;

    and1.out -> sa;

    and2.out -> j;


}