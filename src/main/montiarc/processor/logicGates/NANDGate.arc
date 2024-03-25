package processor.logicGates;
import processor.circuits.RelayDefaultOff;
import processor.circuits.RelayDefaultOn;
import processor.circuits.AlwaysTrue;

component NANDGate {
    port in boolean a;
    port in boolean b;
    port out boolean out;
    RelayDefaultOff r_1;
    RelayDefaultOn r_2;
    AlwaysTrue v;
    a -> r_1.a;
    b -> r_1.b;
    r_1.out -> r_2.a;
    v.out -> r_2.b;
    r_2.out -> out;
}