package processor.memory;

component LastOut {
    port in boolean inputQ;
    port in boolean inputNQ;
    port <<delayed>> out boolean outputQ;
    port <<delayed>> out boolean outputNQ;

    
    automaton{
        initial {
            outputQ = false;
            outputNQ = true;
        } state S;

        S -> S  / {
            outputQ = inputQ;
            outputNQ = inputNQ;
        };
    }
    

    /*
    init {
        outputQ = false;
        outputNQ = false;
    }
    compute {
        outputQ = inputQ;
        outputNQ = inputNQ;
    }
    */




    
}

