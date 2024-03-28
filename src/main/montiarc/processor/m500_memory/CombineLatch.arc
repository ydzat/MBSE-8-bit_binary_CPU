package processor.m500_memory;

component CombineLatch {

    Latch latch;
    LastOutOne loo;

    loo.out -> latch.prevOut;

    port in boolean st, d;
    port out boolean out;

    st -> latch.st;
    d -> latch.d;

    latch.out -> loo.in;
    latch.out -> out;


}
