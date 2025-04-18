package processor.m200_arithmetics;
import processor.m100_logicGates.ORGate;
import processor.m100_logicGates.InvertGate;

component LessThanZero {
    port in boolean x7, x6, x5, x4, x3, x2, x1, x0;
    port out boolean out;

    compute {
        if (x7 == true){
            out = true;
        }else{
            out = false;
        }
    }
}