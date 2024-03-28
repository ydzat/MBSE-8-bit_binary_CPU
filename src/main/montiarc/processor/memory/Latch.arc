package processor.memory;

import processor.switching.Selector;

component Latch {

    port in boolean st, d;

    port in boolean prevOut;

    port out boolean out;

    Selector selector;

    prevOut -> selector.d0;
    st -> selector.s;
    d -> selector.d1;

    selector.out -> out;




}