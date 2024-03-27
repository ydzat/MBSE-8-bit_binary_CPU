package processor.memory;

import processor.logicGates.ANDGate;
import processor.logicGates.NOTGate;


component DFF_old {

    port in boolean d;
    port in boolean en;

    port in boolean clr;
    port in boolean pr;

    port out boolean q;
    port out boolean nq;

    ANDGate and1, and0;
    RSFF rsff0;

    clr -> rsff0.clr;
    pr -> rsff0.pr;

    d -> and0.a;
    en -> and0.b;
    and0.out -> rsff0.s;

    NOTGate not0;
    d -> not0.a;
    not0.out -> and1.a;
    en -> and1.b;
    and1.out -> rsff0.r;

    rsff0.q -> q;
    rsff0.nq -> nq;


}
