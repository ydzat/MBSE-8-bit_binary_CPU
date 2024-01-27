package processor.memory;



component TFF {

    port in boolean cp;
    port in boolean clr;
    port in boolean pr;

    port out boolean q;

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

}