package processor.memory;

import processor.logicGates.NOR3Gate;

component RSFF {

    port in boolean r;
    port in boolean s;
    port in boolean clr;
    port in boolean pr;

    port out boolean q;
    port out boolean nq;

    automaton {

        initial {
            q = false;
            nq = true;
        } state QTo0;

        // s -> q = 1
        // r -> q = 0

        state QTo1;

        // Priority 3: Hold state
        QTo0 -> QTo0 [!clr && !pr && (!s || r)] / { q = false; nq = true; };
        QTo1 -> QTo1 [!clr && !pr && (s || !r)] / { q = true; nq = false; };

        // Priority 2: Set and Reset
        QTo0 -> QTo1 [!clr && !pr && s && !r] / { q = true; nq = false; };
        QTo1 -> QTo0 [!clr && !pr && (!s && r)] / { q = false; nq = true; };

        // Priority 1: Clear and Preset
        QTo0 -> QTo0 [clr & !pr] / { q = false; nq = true; };
        QTo1 -> QTo0 [clr & !pr] / { q = false; nq = true; };

        QTo0 -> QTo1 [!clr && pr] / { q = true; nq = false; };
        QTo1 -> QTo1 [!clr && pr] / { q = true; nq = false; };

    }
    
}