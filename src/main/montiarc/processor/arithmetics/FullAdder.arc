package processor.arithmetics;

import processor.arithmetics.HalfAdder;
import processor.logicGates.ORGate;

component FullAdder {
    port in boolean a; 
    port in boolean b;
    port in boolean cin;
    port out boolean sum;
    port out boolean cout;

    HalfAdder ha1;
    HalfAdder ha2;
    ORGate orGate;

    a -> ha1.a;
    b -> ha1.b;
    ha1.sum -> ha2.a;
    cin -> ha2.b;
    ha1.carry -> orGate.a;
    ha2.carry -> orGate.b;
    ha2.sum -> sum;
    orGate.out -> cout;
}