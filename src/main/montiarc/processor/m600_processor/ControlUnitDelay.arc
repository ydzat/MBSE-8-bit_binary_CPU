package processor.m600_processor;
import processor.m600_processor.ControlUnit;

component ControlUnitDelay {
    port in boolean in_r7, in_r6, in_r5, in_r4, in_r3, in_r2, in_r1, in_r0;
    port in boolean in_a, in_d, in_sa;
    port <<delayed>> out boolean r7,r6,r5,r4,r3,r2,r1,r0;
    port <<delayed>> out boolean a, d, sa;

    automaton {
        initial {
            a = false;
            d = false;
            sa = false;
            r7 = false;
            r6 = false;
            r5 = false;
            r4 = false;
            r3 = false;
            r2 = false;
            r1 = false;
            r0 = false;
        } state S;

        S -> S / {
            r7 = in_r7;
            r6 = in_r6;
            r5 = in_r5;
            r4 = in_r4;
            r3 = in_r3;
            r2 = in_r2;
            r1 = in_r1;
            r0 = in_r0;
            a = in_a;
            d = in_d;
            sa = in_sa;
        };
    }
}