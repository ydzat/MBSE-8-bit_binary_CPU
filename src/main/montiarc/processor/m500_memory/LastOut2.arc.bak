package processor.m500_memory;




component LastOut2 {
    port in boolean inputQ;
    port in boolean inputNQ;
    port <<delayed>> out boolean outputQ;
    port <<delayed>> out boolean outputNQ;

    automaton{
        initial {
            outputQ = true;
            outputNQ = true;
        } state S;

        state S1;


        S -> S1  / {
            outputQ = inputQ;
            outputNQ = inputNQ;
        };
    }
    
    //RSFF

    port in boolean r;
    port in boolean s;
    port in boolean clr;
    port in boolean pr;

    RSFF2 rsff;

    r -> rsff.r;
    s -> rsff.s;
    clr -> rsff.clr;
    pr -> rsff.pr;
    inputQ -> rsff.iq;
    inputNQ -> rsff.inq;

    rsff.q -> outputQ;
    rsff.nq -> outputNQ;

}

