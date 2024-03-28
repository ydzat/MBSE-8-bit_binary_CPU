package processor.processor;

import processor.arithmetic_logic_unit.ALU;
import processor.switching.Selecto8;
import processor.processor.instruction;
import processor.logicGates.ANDGates;
import processor.logicGates.InvertGate;

component ControlLogic {
    port in boolean i7,i6,i5,i4,i3,i2,i1,i0;
    port in boolean a7,a6,a5,a4,a3,a2,a1,a0; 
    port in boolean d7,d6,d5,d4,d3,d2,d1,d0;
    port in boolean sa7, sa6, sa5, sa4, sa3, sa2, sa1, sa0;
    port out boolean R7,R6,R5,R4,R3,R2,R1,R0;
    port out boolean dst.a;
    port out boolean dst.d;
    port out boolean dst.sa;
    port out boolean j;
    
    Selector8 select1, select2;
    InvertGate inv;
    ANDGate and1;
    ANDGate and2;
    ANDGate and3;
    instruction aluInstruction;
  
  
    //connect input to alu instructions
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
   
    // Inverter connection
    boolean state[0] -> inv.input; // Assuming state[0] is the relevant bit


    // Connect input to selectors 
    i7 -> select1.s;
    aluInstruction.r0 -> select1.d10;
    aluInstruction.r1 -> select1.d11;
    aluInstruction.r2 -> select1.d12;
    aluInstruction.r3 -> select1.d13;
    aluInstruction.r4 -> select1.d14;
    aluInstruction.r5 -> select1.d15;
    aluInstruction.r6 -> select1.d16;
    aluInstruction.r7 -> select1.d17;
    
    i5 -> select1.d05;
    i4 -> select1.d04;
    i3 -> select1.d03;
    i2 -> select1.d02;
    i1 -> select1.d01;
    i0 -> select1.d00;

    i7 -> select2.s;
    aluInstruction.a0 -> select2.d10;
    aluInstruction.a1 -> select2.d11;
    aluInstruction.a2 -> select2.d12;
    aluInstruction.a3 -> select2.d13;
    aluInstruction.a4 -> select2.d14;
    aluInstruction.a5 -> select2.d15;
    aluInstruction.a6 -> select2.d16;
    aluInstruction.a7 -> select2.d17;
    inv.output -> select2.d0;
    
   
    
    // AND gate connections
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
    
    // Result connections
    select1.output7-> R7;
    select1.output6-> R6;
    select1.output5-> R5;
    select1.output4-> R4;
    select1.output3-> R3;
    select1.output2-> R2;
    select1.output1-> R1;
    select1.output0-> R0;

    select2.output7-> a7;
    select2.output6-> a6;
    select2.output5-> a5;
    select2.output4-> a4;
    select2.output3-> a3;
    select2.output2-> a2;
    select2.output1-> a1;
    select2.output0-> a0;

    and1.output -> dst.d;
    and2.output -> dst.sa;
    and3.output -> j;
    
    
}



