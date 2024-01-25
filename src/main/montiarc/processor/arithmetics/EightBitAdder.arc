package processor.arithmetics;

import processor.arithmetics.FullAdder;
import processor.logicGates.Invert;
import processor.logicGates.NOTGate;
import processor.logicGates.ANDGate;

// 8 bit adder and subtractor (a - b)

component EightBitAdder {


    
    port in boolean a7, a6, a5, a4, a3, a2, a1, a0; // 第一个8位数
    port in boolean b7, b6, b5, b4, b3, b2, b1, b0; 
    port in boolean cin;    // 1位进位输入
    
    port out boolean s7, s6, s5, s4, s3, s2, s1, s0; // 2位和
    port out boolean cout;   // 最高位的进位输出

    FullAdder fa7, fa6, fa5, fa4, fa3, fa2, fa1, fa0;
    
    cin -> fa0.cin;

    NOTGate notGate;
    cin -> notGate.a;

    ANDGate andGate;
    notGate.out -> andGate.a;
    fa7.cout -> andGate.b;
    andGate.out -> cout;

    fa0.cout -> fa1.cin;
    fa1.cout -> fa2.cin;
    fa2.cout -> fa3.cin;
    fa3.cout -> fa4.cin;
    fa4.cout -> fa5.cin;
    fa5.cout -> fa6.cin;
    fa6.cout -> fa7.cin;

    a7 -> fa7.b;
    a6 -> fa6.b;
    a5 -> fa5.b;
    a4 -> fa4.b;
    a3 -> fa3.b;
    a2 -> fa2.b;
    a1 -> fa1.b;
    a0 -> fa0.b;

    Invert inv;

    cin -> inv.en;
    b7 -> inv.n7;
    b6 -> inv.n6;
    b5 -> inv.n5;
    b4 -> inv.n4;
    b3 -> inv.n3;
    b2 -> inv.n2;
    b1 -> inv.n1;
    b0 -> inv.n0;

    inv.nn7 -> fa7.a;
    inv.nn6 -> fa6.a;
    inv.nn5 -> fa5.a;
    inv.nn4 -> fa4.a;
    inv.nn3 -> fa3.a;
    inv.nn2 -> fa2.a;
    inv.nn1 -> fa1.a;
    inv.nn0 -> fa0.a;

    fa7.sum -> s7;
    fa6.sum -> s6;
    fa5.sum -> s5;
    fa4.sum -> s4;
    fa3.sum -> s3;
    fa2.sum -> s2;
    fa1.sum -> s1;
    fa0.sum -> s0;



}