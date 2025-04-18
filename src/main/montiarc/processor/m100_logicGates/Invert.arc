package processor.m100_logicGates;

component Invert{
    port in boolean en;

    port in boolean n7; 
    port in boolean n6; 
    port in boolean n5; 
    port in boolean n4; 
    port in boolean n3; 
    port in boolean n2; 
    port in boolean n1; 
    port in boolean n0;
    port out boolean nn7; 
    port out boolean nn6; 
    port out boolean nn5; 
    port out boolean nn4; 
    port out boolean nn3; 
    port out boolean nn2; 
    port out boolean nn1; 
    port out boolean nn0;

    XORGate xor7;
    XORGate xor6;
    XORGate xor5;
    XORGate xor4;
    XORGate xor3;
    XORGate xor2;
    XORGate xor1;
    XORGate xor0;

    en -> xor7.a;
    en -> xor6.a;
    en -> xor5.a;
    en -> xor4.a;
    en -> xor3.a;
    en -> xor2.a;
    en -> xor1.a;
    en -> xor0.a;

    n7 -> xor7.b;
    n6 -> xor6.b;
    n5 -> xor5.b;
    n4 -> xor4.b;
    n3 -> xor3.b;
    n2 -> xor2.b;
    n1 -> xor1.b;
    n0 -> xor0.b;

    xor7.out -> nn7;
    xor6.out -> nn6;
    xor5.out -> nn5;
    xor4.out -> nn4;
    xor3.out -> nn3;
    xor2.out -> nn2;
    xor1.out -> nn1;
    xor0.out -> nn0;

}