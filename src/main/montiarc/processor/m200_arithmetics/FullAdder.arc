package processor.m200_arithmetics;

import processor.m200_arithmetics.HalfAdder;

component FullAdder {
    port in boolean a; 
    port in boolean b;
    port in boolean cin;
    port out boolean sum;
    port out boolean cout;

    HalfAdder ha1;
    HalfAdder ha2;
    HalfAdder ha3;

    a -> ha1.a;
    b -> ha1.b;
    ha1.sum -> ha2.a;
    cin -> ha2.b;
    ha1.carry -> ha3.a;
    ha2.carry -> ha3.b;
    ha2.sum -> cout;
    ha3.sum -> sum;

}