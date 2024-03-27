package processor.memory;

import processor.switching.Selector;

component Latch {
    port in boolean st;
    port in boolean d;
    // boolean last;
    boolean prev_value = false;
    port out boolean out;

    automaton {
        initial {
            out = false;
        }state S0;
        state S1;
        final state S2;
        /*
        S0 -> S1 [!st] / {
            out = last;
        };

        S1 -> S2 [st] / {
            out = d;
            last = out;
        };

        S2 -> S2 [st] / {
            out = d;
            last = out;
        };

        S2 -> S1 [!st] / {
            out = d;
            last = out;
        };
        */


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

    }

}