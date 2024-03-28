package processor.arithmetics;

import processor.logicGates.XORGate;
import processor.logicGates.ANDGate;


component HalfAdder {
    port in boolean a;
    port in boolean b;
    port out boolean sum;
    port out boolean carry;

    XORGate xorGate;
    ANDGate andGate;
    
    a -> xorGate.a;
    a -> andGate.a;
    b -> xorGate.b;
    b -> andGate.b;

    xorGate.out -> sum;
    andGate.out -> carry;
}