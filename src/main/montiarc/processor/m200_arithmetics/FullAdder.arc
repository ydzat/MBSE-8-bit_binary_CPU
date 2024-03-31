package processor.m200_arithmetics;

//import processor.m200_arithmetics.HalfAdder;
import processor.m100_logicGates.ANDGate;
import processor.m100_logicGates.ORGate;
import processor.m100_logicGates.XORGate;

component FullAdder {
    port in boolean a; 
    port in boolean b;
    port in boolean cin;
    port out boolean sum;
    port out boolean cout;

    ANDGate and1, and0;
    XORGate xor1, xor0;
    ORGate or;

    a -> and0.a;
    a -> xor0.a;
    b -> and0.b;
    b -> xor0.b;

    cin -> and1.b;
    cin -> xor1.b;

    xor0.out -> and1.a;
    xor0.out -> xor1.a;

    and0.out -> or.a;
    and1.out -> or.b;

    xor1.out -> sum;
    or.out -> cout;
    
}