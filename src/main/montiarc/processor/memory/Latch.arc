package processor.memory;

import processor.switching.Selector;

component Latch {

    /*
    component LastOut {
        port in boolean last_output;
        port <<delayed>> out boolean output;

        init {
            output = false;
        }

        compute {
            output = last_output;
        }
    }

    port in boolean st;
    port in boolean d;
    port out boolean out;

    LastOut lastOut;

    Selector sel;

    st -> sel.s;
    d -> sel.d1;

    sel.out -> lastOut.last_output;
    lastOut.output -> sel.d0;
    sel.out -> out;
    */

    port in boolean st;
    port in boolean d;
    boolean last;
    port out boolean out;
    automaton {
        initial {
            out = false;
            count = 0;
        }state S0;
        state S1;
        final state S2;

        S0 -> S1 [!st] / {
            out = last;
            count+=1;
        };

        S1 -> S2 [st] / {
            out = d;
            last = out;
            count+=1;
        };

        S2 -> S2 [st] / {
            out = d;
            last = out;
            count+=1;
        };

        S2 -> S1 [!st] / {
            out = d;
            last = out;
            count+=1;
        };

        /*
        S0 -> S0 [!st || (st && !d)] / {
            out = prev_value;
        };

        S0 -> S1 [st && d] / {
            out = !prev_value;
            prev_value = out;
        };

        S1 -> S0 [st && !d ] / {
            out = !prev_value;
            prev_value = out;
        };

        S1 -> S1 [!st || (st && d)] / {
            out = prev_value;
        };
        */
    }

}