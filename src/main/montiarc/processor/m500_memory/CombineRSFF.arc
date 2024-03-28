package processor.m500_memory;

component CombineRSFF {

    RSFF2 rsff;
    LastOut lo;

    lo.outputQ -> rsff.iq;
    lo.outputNQ -> rsff.inq;

    port in boolean r;
    port in boolean s;
    port in boolean clr;
    port in boolean pr;

    r -> rsff.r;
    s -> rsff.s;
    clr -> rsff.clr;
    pr -> rsff.pr;

    rsff.q -> lo.inputQ;
    rsff.nq -> lo.inputNQ;

    port out boolean q;
    port out boolean nq;

    rsff.q -> q;
    rsff.nq -> nq;
}