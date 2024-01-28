package processor.logicGates;



component NOR3Gate {
    port in boolean a;
    port in boolean b;
    port in boolean c;
    port out boolean out;
    compute { 
        if (c){
            out = !c;
        }
        else {
            out = !(a || b);
        }
    }
}