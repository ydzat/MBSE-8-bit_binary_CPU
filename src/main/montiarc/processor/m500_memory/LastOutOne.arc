package processor.m500_memory;

component LastOutOne{

    port in boolean in;
    port <<delayed>> out boolean out;

    automaton{

        initial {
            out = false;
        } state S;

        S -> S / {
            out = in;
        };


    }

}