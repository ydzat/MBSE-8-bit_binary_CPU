package processor.m600_processor;
import processor.m000_circuits.AlwaysTrue;
import processor.m000_circuits.AlwaysFalse;
import processor.m600_processor.CombinedMemory;
import processor.m600_processor.ControlUnit;
import processor.m600_processor.ControlUnitDelay;
component Computer {
    port in boolean i15, i14, i13, i12, i11, i10, i9, i8, i7, i6, i5, i4, i3, i2, i1, i0;
    port in boolean cl;
    
    CombinedMemory mem;
    ControlUnitDelay cud;
    ControlUnit cu;
    AlwaysFalse f;

    /*
    cu.r7 -> mem.x7;
    cu.r6 -> mem.x6;
    cu.r5 -> mem.x5;
    cu.r4 -> mem.x4;
    cu.r3 -> mem.x3;
    cu.r2 -> mem.x2;
    cu.r1 -> mem.x1;
    cu.r0 -> mem.x0;
    cu.a -> mem.a;
    cu.d -> mem.d;
    cu.sa -> mem.sa;
    */

    cud.r7 -> mem.x7;
    cud.r6 -> mem.x6;
    cud.r5 -> mem.x5;
    cud.r4 -> mem.x4;
    cud.r3 -> mem.x3;
    cud.r2 -> mem.x2;
    cud.r1 -> mem.x1;
    cud.r0 -> mem.x0;
    cud.a -> mem.a;
    cud.d -> mem.d;
    cud.sa -> mem.sa;

    cl -> mem.cl;

    i15 -> cu.i15;
    i14 -> cu.i14;
    i13 -> cu.i13;
    i12 -> cu.i12;
    i11 -> cu.i11;
    i10 -> cu.i10;
    i9 -> cu.i9;
    i8 -> cu.i8;
    i7 -> cu.i7;
    i6 -> cu.i6;
    i5 -> cu.i5;
    i4 -> cu.i4;
    i3 -> cu.i3;
    i2 -> cu.i2;
    i1 -> cu.i1;
    i0 -> cu.i0;
    mem.a7 -> cu.a7;
    mem.a6 -> cu.a6;
    mem.a5 -> cu.a5;
    mem.a4 -> cu.a4;
    mem.a3 -> cu.a3;
    mem.a2 -> cu.a2;
    mem.a1 -> cu.a1;
    mem.a0 -> cu.a0;
    mem.d7 -> cu.d7;
    mem.d6 -> cu.d6;
    mem.d5 -> cu.d5;
    mem.d4 -> cu.d4;
    mem.d3 -> cu.d3;
    mem.d2 -> cu.d2;
    mem.d1 -> cu.d1;
    mem.d0 -> cu.d0;
    mem.sa7 -> cu.sa7;
    mem.sa6 -> cu.sa6;
    mem.sa5 -> cu.sa5;
    mem.sa4 -> cu.sa4;
    mem.sa3 -> cu.sa3;
    mem.sa2 -> cu.sa2;
    mem.sa1 -> cu.sa1;
    mem.sa0 -> cu.sa0;

    cu.r7 -> cud.in_r7;
    cu.r6 -> cud.in_r6;
    cu.r5 -> cud.in_r5;
    cu.r4 -> cud.in_r4;
    cu.r3 -> cud.in_r3;
    cu.r2 -> cud.in_r2;
    cu.r1 -> cud.in_r1;
    cu.r0 -> cud.in_r0;
    cu.a -> cud.in_a;
    cu.d -> cud.in_d;
    cu.sa -> cud.in_sa;

}