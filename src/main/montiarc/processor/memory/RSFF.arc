package processor.memory;

import processor.logicGates.NOR3Gate;

component RSFF {

    port in boolean r;
    port in boolean s;
    port in boolean clr;
    port in boolean pr;

    port <<delayed>> out boolean q;
    port <<delayed>> out boolean nq;

    /*
    according to the r and s, set q and nq
    r == 1 == s is forbidden
    */
    
    init {
        q = false;
        nq = true;
    }

    boolean internalQ;
    boolean internalNq;

    compute {
        if (clr) {
            internalQ = false;
            internalNq = true;
        } else if (pr) {
            internalQ = true;
            internalNq = false;
        } else {
            // 根据 NOR 门的逻辑更新内部状态
            internalQ = !(r || internalNq);
            internalNq = !(s || internalQ);
        }
        // 更新延迟输出端口
        q = internalQ;
        qn = internalQn;
    }
    

    /*
    NOR3Gate norGateR, norGateS;

    r -> norGateR.a;
    clr -> norGateR.b;
    internalNq -> norGateR.c;
    norGateR.out -> q;

    // Connect S and pr to norGateS
    s -> norGateS.a;
    pr -> norGateS.b;
    internalQ -> norGateS.c;
    norGateS.out -> nq;
    
    */

}