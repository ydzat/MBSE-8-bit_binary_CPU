package processor.m100_logicGates;

component TriState{

    port in boolean in, en;
    port out boolean out;

    compute {
        if (en) {
            out = in;
        }
        else {
            out = false;
        }
    }

}