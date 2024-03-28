package processor.memory;

import processor.memory.CombineLatch;
import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.params.ParameterizedTest;
import org.junit.jupiter.params.provider.Arguments;
import org.junit.jupiter.params.provider.MethodSource;

import montiarc.rte.log.Log;
import de.se_rwth.commons.logging.LogStub;

import org.junit.jupiter.api.Test;

import java.util.stream.Stream;



public class LatchTestNew {
    private CombineLatch latch;

    @BeforeEach
    void setUp() {
        // rsff = new RSFF();
        // rsff.setUp();
        // rsff.init();
        
        // initialize the Log such that the MontiArc output can be seen
        LogStub.initPlusLog();
        Log.setTraceEnabled(true);
        LogStub.enableFailQuick(false);
    }


    @Test
    public void testLatch(){
        testL();
    }

    public void testL(){
        latch = new CombineLatch();
        latch.setUp();
        latch.init();

        /*
         * st   d   expectedOut LastOutOne
         * 1    0   0           default
         * 1    1   1           0
         * 0    1   keep        1
         * 0    1   keep        1
         */

        // st, d, expectedOut
        boolean [][] input = {
            {false, false, false, false}, // LastOutOne default out = false
            {true, false, false, false},
            {true, true, true, false},
            {false, true, true, true},
            {false, false, true, true},
            {true, true, true, true},
            {true, false, false, true},
            {true, true, true, false},
            {false, true, true, true}
        };

        for (int i = 0; i < input.length; i++){
            System.out.println("------------ "+ i +"--------------");
            latch.getSt().update(input[i][0]);
            latch.getD().update(input[i][1]);
            latch.compute();

            System.out.println("Expected Out: " + input[i][2]);
            System.out.println("Current Out:  " + latch.getOut().getValue());
            latch.tick();
        }

    }
}
