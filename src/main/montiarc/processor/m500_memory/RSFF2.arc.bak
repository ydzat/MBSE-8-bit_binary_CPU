package processor.m500_memory;

import processor.m100_logicGates.NORGate;
import processor.m100_logicGates.NOR3Gate;



component RSFF2 {

    port in boolean r;
    port in boolean s;
    port in boolean clr;
    port in boolean pr;

    port in boolean iq;
    port in boolean inq;

    port out boolean q;
    port out boolean nq;

    /*
    clr pr r  s  q  nq
    1   0  -  -  0  1  //Clear
    0   1  -  -  1  0  //Preset
    0   0  0  0  q  nq //Keep  <==> Initial
    0   0  0  1  1  0  //Set
    0   0  1  0  0  1  //Reset
    0   0  1  1  0  0  //Forbidden
    
    */

    /*
    component LastOut {
        port in boolean inputQ;
        port in boolean inputNQ;
        port <<delayed>> out boolean outputQ;
        port <<delayed>> out boolean outputNQ;

        init {
            outputQ = false;
            outputNQ = true;
        }

        compute {
            outputQ = inputQ;
            outputNQ = inputNQ;
            
        }
    }

    */
    

    
    //LastOut lastOut;   
    NOR3Gate nor1, nor2;

    // Connectors
    r -> nor1.a;
    clr -> nor1.c;
    inq -> nor1.b;

    s -> nor2.a;
    pr -> nor2.c;
    iq -> nor2.b;
    
    nor1.out -> q;
    nor2.out -> nq;


    /*
    component Start {
        port in boolean r;
        port in boolean s;
        port in boolean clr;
        port in boolean pr;

        port in boolean qin;
        port in boolean nqin;
        port out boolean qout;
        port out boolean nqout;

        compute{
            qout = !(clr || r || nqin);
            nqout = !(pr || s || qin);
        }
    }

    LastOut lastOut;
    Start st;
    r -> st.r;
    s -> st.s;
    clr -> st.clr;
    pr -> st.pr;
    lastOut.outputQ -> st.qin;
    lastOut.outputNQ -> st.nqin;

    st.qout -> q;
    st.nqout -> nq;
    st.qout -> lastOut.inputQ;
    st.nqout -> lastOut.inputNQ;
    */

    /*
    automaton {
        initial {
            q = false;
            nq = true;
        }state Forbidden;

        // 0_
        state Allowed0{
            initial {
                q = false;
                nq = true;
            }state Q0;

            Q0 -> Q0 [!((!clr && pr) || (!clr && !pr && !r && s))] /{
                q = false;
                nq = true;
            };

            
            state Keep0;

            Q0 -> Q0 [(clr && !pr) || (!clr && !pr && r && !s)]/{
                q = false;
                nq = true;
            };
            Keep0 -> Q0 [(clr && !pr) || (!clr && !pr && r && !s)]/{
                q = false;
                nq = true;
            };
            Q0 -> Keep0 [!clr && !pr && !r && !s]/{
                q = false;
                nq = true;
            };
            Keep0 -> Keep0[!clr && !pr && !r && !s]/{
                q = false;
                nq = true;
            };
            
        };

        // 1_
        state Allowed1{
            initial {
                q = true;
                nq = false;
            } state Q1;

            Q1 -> Q1 [!((clr && !pr) || (!clr && !pr && r && !s))]/{
                q = true;
                nq = false;
            };

            
            state Keep;

            Q1 -> Q1 [(!clr && pr) || (!clr && !pr && !r && s)]/{
                q = true;
                nq = false;
            };
            Keep -> Q1 [(!clr && pr) || (!clr && !pr && !r && s)]/{
                q = true;
                nq = false;
            };
            Q1 -> Keep [!clr && !pr && !r && !s]/{
                q = true;
                nq = false;
            };
            Keep -> Keep [!clr && !pr && !r && !s]/{
                q = true;
                nq = false;
            };
            
        };

        Forbidden -> Forbidden[!clr && !pr && !r && !s] / {
            q = false;
            nq = true;
        };

        Forbidden -> Allowed0[(clr && !pr) || (!clr && !pr && r && !s)];
        Forbidden -> Allowed1[(!clr && pr) || (!clr && !pr && !r && s)];

        Allowed0 -> Allowed1[(!clr && pr) || (!clr && !pr && !r && s)];
        //Allowed1 -> Allowed1[!((clr && !pr) || (!clr && !pr && r && !s))];

        Allowed1 -> Allowed0[(clr && !pr) || (!clr && !pr && r && !s)];
        //Allowed0 -> Allowed0[!((!clr && pr) || (!clr && !pr && !r && s))];

    }
    
    */

}