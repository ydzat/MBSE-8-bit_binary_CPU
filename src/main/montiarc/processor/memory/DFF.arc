package processor.memory;

import processor.logicGates.ANDGate;
import processor.logicGates.InvertGate;
import processor.memory.Latch;
import processor.circuits.AlwaysTrue;
component DFF {

    port in boolean st;
    port in boolean d;

    port in boolean cl;

    port out boolean out;

    /*
    AlwaysTrue t;
    boolean tmp = false;
    */

    Latch l0, l1;
    ANDGate and0, and1;
    InvertGate inv;
    
    st -> and0.a;
    cl -> inv.a;
    inv.out -> and0.b;

    st -> and1.a;
    cl -> and1.b;

    and0.out -> l0.st;
    d -> l0.d;

    and1.out -> l1.st;
    l0.out -> l1.d;

    l1.out -> out;
}
