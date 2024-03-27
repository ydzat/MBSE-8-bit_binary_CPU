package processor.memory;

import processor.logicGates.NORGate;
import processor.logicGates.NOR3Gate;

component RSFF {

    port in boolean r;
    port in boolean s;
    port in boolean clr;
    port in boolean pr;

    port out boolean q;
    port out boolean nq;

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

    component ChangeState{
        port in boolean r;
        port in boolean s;
        port in boolean clr;
        port in boolean pr;
        port in boolean a;
        port in boolean b;
        port in boolean q;
        port in boolean nq;
        port out boolean qout;
        port out boolean nqout;
        compute {
            

            if ((!clr && !pr && !r && !s) ||  (clr && pr && !r && !s)){
                qout = q;
                nqout = nq;
            }
            else if(!(!r && !s) || (clr && !pr) || (!clr && pr)){
                qout = a;
                nqout = b;
            }
        }
    }
    
    */

    /*
    clr pr r  s  q  nq
    1   0  -  -  0  1  //Clear
    0   1  -  -  1  0  //Preset
    0   0  0  0  q  nq //Keep  <==> Initial
    0   0  0  1  1  0  //Set
    0   0  1  0  0  1  //Reset
    0   0  1  1  0  0  //Forbidden
    
    */

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












































    /*
    // Connectors
    
    LastOut lastOut;
    NORGate norS,norR;
    ChangeState cs;

    r -> cs.r;
    s -> cs.s;
    clr -> cs.clr;
    pr -> cs.pr;

    lastOut.outputQ -> cs.q;
    lastOut.outputNQ -> cs.nq;

    clr -> norR.a;
    r -> norR.b;
    pr -> norS.a;
    s -> norS.b;
    
    norR.out -> cs.a;
    norS.out -> cs.b;

    cs.qout -> q;
    cs.nqout -> nq;

    cs.qout -> lastOut.inputQ;
    cs.nqout -> lastOut.inputNQ;
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

    LastOut lastOut;
    NOR3Gate nor1, nor2;
    LastOut lastOut;

    

    // Connectors
    r -> nor1.a;
    clr -> nor1.c;
    lastOut.outputNQ -> nor1.b;

    s -> nor2.a;
    pr -> nor2.c;
    lastOut.outputQ -> nor2.b;

    nor1.out -> q;
    nor2.out -> nq;

    nor1.out -> lastOut.inputQ;
    nor2.out -> lastOut.inputNQ;

    */

}
