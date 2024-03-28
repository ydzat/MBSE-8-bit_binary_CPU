package processor.m600_processor;

import processor.m400_arithmetic_logic_unit.ALU;
import processor.m300_switching.Selector8;
import processor.m600_processor.Instruction;
import processor.m100_logicGates.ANDGates;
import processor.m100_logicGates.InvertGate;

component ControlUnit {
    port in boolean i15, i14, i13, i12, i11, i10, i9, i8, i7, i6, i5, i4, i3, i2, i1, i0;
    port in boolean a7,a6,a5,a4,a3,a2,a1,a0; 
    port in boolean d7,d6,d5,d4,d3,d2,d1,d0;
    port in boolean sa7,sa6,sa5,sa4,sa3,sa2,sa1,sa0;
    port out boolean r7,r6,r5,r4,r3,r2,r1,r0;
    port out boolean a;
    port out boolean d;
    port out boolean sa;
    port out boolean j;
    
    Selector8 select1, select2;
    InvertGate inv;
    ANDGate and1;
    ANDGate and2;
    ANDGate and3;
    instruction aluInstruction;
  
  
    //Connect input to alu instructions
    i15 ->aluInstruction.i15;
    i14 ->aluInstruction.i14;
    i13 ->aluInstruction.i13;
    i12 ->aluInstruction.i12;
    i11 ->aluInstruction.i11;
    i10 ->aluInstruction.i10;
    i9 ->aluInstruction.i9;
    i8 ->aluInstruction.i8;
    i7 ->aluInstruction.i7;
    i6 ->aluInstruction.i6;
    i5 ->aluInstruction.i5;
    i4 ->aluInstruction.i4;
    i3 ->aluInstruction.i3;
    i2 ->aluInstruction.i2;
    i1 ->aluInstruction.i1;
    i0 ->aluInstruction.i0;

    a7 ->aluInstruction.a7;
    a6 ->aluInstruction.a6;
    a5 ->aluInstruction.a5;
    a4 ->aluInstruction.a4;
    a3 ->aluInstruction.a3;
    a2 ->aluInstruction.a2;
    a1 ->aluInstruction.a1;
    a0 ->aluInstruction.a0;

    d7 ->aluInstruction.d7;
    d6 ->aluInstruction.d6;
    d5 ->aluInstruction.d5;
    d4 ->aluInstruction.d4;
    d3 ->aluInstruction.d3;
    d2 ->aluInstruction.d2;
    d1 ->aluInstruction.d1;
    d0 ->aluInstruction.d0;

    sa7 ->aluInstruction.sa7;
    sa6 ->aluInstruction.sa6;
    sa5 ->aluInstruction.sa5;
    sa4 ->aluInstruction.sa4;
    sa3 ->aluInstruction.sa3;
    sa2 ->aluInstruction.sa2;
    sa1 ->aluInstruction.sa1;
    sa0 ->aluInstruction.sa0;

    //Connect input to selectors 
    i15 -> select1.s;
    aluInstruction.r0 -> select1.d00;
    aluInstruction.r1 -> select1.d10;
    aluInstruction.r2 -> select1.d20;
    aluInstruction.r3 -> select1.d30;
    aluInstruction.r4 -> select1.d40;
    aluInstruction.r5 -> select1.d50;
    aluInstruction.r6 -> select1.d60;
    aluInstruction.r7 -> select1.d70;
    
    i15 ->select1.d150;
    i14 ->select1.d140;
    i13 ->select1.d130;
    i12 ->select1.d120;
    i11 ->select1.d110;
    i10 ->select1.d100;
    i9 ->select1.d90;
    i8 ->select1.d80;
    i7 ->select1.d70;
    i6 ->select1.d60;
    i5 ->select1.d50;
    i4 ->select1.d40;
    i3 ->select1.d30;
    i2 ->select1.d20;
    i1 ->select1.d10;
    i0 ->select1.d00;

    i15 -> select2.s;
    aluInstruction.a0 -> select2.d01;
    aluInstruction.a1 -> select2.d11;
    aluInstruction.a2 -> select2.d21;
    aluInstruction.a3 -> select2.d31;
    aluInstruction.a4 -> select2.d41;
    aluInstruction.a5 -> select2.d51;
    aluInstruction.a6 -> select2.d61;
    aluInstruction.a7 -> select2.d71;
    inv.output -> select2.d0;
    
   
    
    //AND gate connections
    i7 -> and1.a;
    aluInstruction.d0 -> and1.b0;
    aluInstruction.d1 -> and1.b1;
    aluInstruction.d2 -> and1.b2;
    aluInstruction.d3 -> and1.b3;
    aluInstruction.d4 -> and1.b4;
    aluInstruction.d5 -> and1.b5;
    aluInstruction.d6 -> and1.b6;
    aluInstruction.d7 -> and1.b7;

    i7 -> and2.a;
    aluInstruction.sa0 -> and2.b0;
    aluInstruction.sa1 -> and2.b1;
    aluInstruction.sa2 -> and2.b2;
    aluInstruction.sa3 -> and2.b3;
    aluInstruction.sa4 -> and2.b4;
    aluInstruction.sa5 -> and2.b5;
    aluInstruction.sa6 -> and2.b6;
    aluInstruction.sa7 -> and2.b7;

    i7 -> and3.a;
    aluInstruction.j0 -> and3.b0;
    aluInstruction.j1 -> and3.b1;
    aluInstruction.j2 -> and3.b2;
    aluInstruction.j3 -> and3.b3;
    aluInstruction.j4 -> and3.b4;
    aluInstruction.j5 -> and3.b5;
    aluInstruction.j6 -> and3.b6;
    aluInstruction.j7 -> and3.b7;
    
    //Result connections
    select1.output7-> r7;
    select1.output6-> r6;
    select1.output5-> r5;
    select1.output4-> r4;
    select1.output3-> r3;
    select1.output2-> r2;
    select1.output1-> r1;
    select1.output0-> r0;

    select2.output-> a;
    and1.output -> d;
    and2.output -> sa;
    and3.output -> j;
    
    
}
