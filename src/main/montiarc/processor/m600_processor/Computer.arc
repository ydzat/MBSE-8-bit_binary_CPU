package processor.m600_processor;
import processor.m000_circuits.AlwaysTrue;
import processor.m000_circuits.AlwaysFalse;
import processor.m600_processor.CombinedMemory;
import processor.m600_processor.ControlUnit;
import processor.m600_processor.DelayOut;
import processor.m600_processor.ControlUnitDelay;
component Computer {
    port in boolean i15, i14, i13, i12, i11, i10, i9, i8, i7, i6, i5, i4, i3, i2, i1, i0;
    port in boolean cl;
    
    CombinedMemory mem;

    ControlUnit cu;
    DelayOut deo;

    deo.a7 -> cu.a7;
    deo.a6 -> cu.a6;
    deo.a5 -> cu.a5;
    deo.a4 -> cu.a4;
    deo.a3 -> cu.a3;
    deo.a2 -> cu.a2;
    deo.a1 -> cu.a1;
    deo.a0 -> cu.a0;

    deo.d7 -> cu.d7;
    deo.d6 -> cu.d6;
    deo.d5 -> cu.d5;
    deo.d4 -> cu.d4;
    deo.d3 -> cu.d3;
    deo.d2 -> cu.d2;
    deo.d1 -> cu.d1;
    deo.d0 -> cu.d0;

    deo.sa7 -> cu.sa7;
    deo.sa6 -> cu.sa6;
    deo.sa5 -> cu.sa5;
    deo.sa4 -> cu.sa4;
    deo.sa3 -> cu.sa3;
    deo.sa2 -> cu.sa2;
    deo.sa1 -> cu.sa1;
    deo.sa0 -> cu.sa0;

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

    cl -> mem.cl;

    mem.a7 -> deo.ain7;
    mem.a6 -> deo.ain6;
    mem.a5 -> deo.ain5;
    mem.a4 -> deo.ain4;
    mem.a3 -> deo.ain3;
    mem.a2 -> deo.ain2;
    mem.a1 -> deo.ain1;
    mem.a0 -> deo.ain0;
    mem.d7 -> deo.din7;
    mem.d6 -> deo.din6;
    mem.d5 -> deo.din5;
    mem.d4 -> deo.din4;
    mem.d3 -> deo.din3;
    mem.d2 -> deo.din2;
    mem.d1 -> deo.din1;
    mem.d0 -> deo.din0;
    mem.sa7 -> deo.sain7;
    mem.sa6 -> deo.sain6;
    mem.sa5 -> deo.sain5;
    mem.sa4 -> deo.sain4;
    mem.sa3 -> deo.sain3;
    mem.sa2 -> deo.sain2;
    mem.sa1 -> deo.sain1;
    mem.sa0 -> deo.sain0;

}