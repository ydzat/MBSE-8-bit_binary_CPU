package processor.m500_memory;

import processor.m100_logicGates.NOTGate;

// up edge d ff

component EdgeFF {

    port in boolean clr;
    port in boolean pr;

    port in boolean d;
    port in boolean cp;

    port out boolean q;
    port out boolean nq;

    port out boolean nq1;

    DFF_old dff1, dff0;

    clr -> dff1.clr;
    clr -> dff0.clr;
    pr -> dff1.pr;
    pr -> dff0.pr;

    NOTGate not0;

    d -> dff1.d;
    dff1.q -> dff0.d;
    dff0.q -> q;
    cp -> not0.a;
    not0.out -> dff1.en;
    cp -> dff0.en;


    dff0.nq -> nq;
    dff1.nq -> nq1;
    
    

}
