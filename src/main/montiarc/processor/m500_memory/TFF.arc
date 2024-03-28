package processor.m500_memory;



component TFF {

    port in boolean cp;
    port in boolean clr;
    port in boolean pr;

    port <<delayed>> out boolean q;

    /*
    EdgeFF edgeFF0;

    clr -> edgeFF0.clr;
    pr -> edgeFF0.pr;

    component Temp{
        port in boolean a;
        port out boolean out;
        compute {
            out = a;
        }
    }

    Temp t0;

    cp -> edgeFF0.cp;
    edgeFF0.nq -> t0.a;
    t0.out -> edgeFF0.d;

    edgeFF0.q -> q;
    */

    automaton {
        initial {
            q = false;
        }state S0;

        state S1;

        S0 -> S0 [(clr == true) || (cp == false)] /{
            q = q;
        };

        S0 -> S1 [(pr == true) || (cp == true)] /{
            q = true;
        };

        S1 -> S1 [(pr == true) || (cp == false)] / {
            q = q;
        };

        S1 -> S0 [(clr == true) || (cp == true)] / {
            q = false;
        };
    }

    
    
    


}