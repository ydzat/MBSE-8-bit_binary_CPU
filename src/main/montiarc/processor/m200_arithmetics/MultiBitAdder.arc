package processor.m200_arithmetics;

import processor.m200_arithmetics.FullAdder;

// 8 bit

component MultiBitAdder {
    port in boolean a7, a6, a5, a4, a3, a2, a1, a0; // 第一个8位数
    port in boolean b7, b6, b5, b4, b3, b2, b1, b0; 
    port in boolean cin;    // 1位进位输入
    
    port out boolean s7, s6, s5, s4, s3, s2, s1, s0; // 2位和
    port out boolean cout;   // 最高位的进位输出

    FullAdder fa7, fa6, fa5, fa4, fa3, fa2, fa1, fa0;
    
    cin -> fa0.cin;
    

    fa0.cout -> fa1.cin;
    fa1.cout -> fa2.cin;
    fa2.cout -> fa3.cin;
    fa3.cout -> fa4.cin;
    fa4.cout -> fa5.cin;
    fa5.cout -> fa6.cin;
    fa6.cout -> fa7.cin;

    a7 -> fa7.a;
    a6 -> fa6.a;
    a5 -> fa5.a;
    a4 -> fa4.a;
    a3 -> fa3.a;
    a2 -> fa2.a;
    a1 -> fa1.a;
    a0 -> fa0.a;

    b7 -> fa7.b;
    b6 -> fa6.b;
    b5 -> fa5.b;
    b4 -> fa4.b;
    b3 -> fa3.b;
    b2 -> fa2.b;
    b1 -> fa1.b;
    b0 -> fa0.b;

    fa7.sum -> s7;
    fa6.sum -> s6;
    fa5.sum -> s5;
    fa4.sum -> s4;
    fa3.sum -> s3;
    fa2.sum -> s2;
    fa1.sum -> s1;
    fa0.sum -> s0;
    fa7.cout -> cout;
    
}