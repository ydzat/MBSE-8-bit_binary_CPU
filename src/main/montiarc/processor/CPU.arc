package processor;

import ProcessorIO.*;

component CPU{

    NANDGate nandGate;
    /*
    LogicGates logicGates;
    ALU alu;
    Register register;
    ControlUnit controlUnit;
    ProgramCounter programCounter;
    */

    port in boolean s1;
    port in boolean s2;
    port out boolean s3;

    // 连接各个组件
    s1 -> nandGate.a;
    s2 -> nandGate.b;
    nandGate.c -> s3;

    component NANDGate{
        port in boolean a;
        port in boolean b;
        port out boolean c;
        compute{
            c = !(a&&b);
        }
    }


    

}