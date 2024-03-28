/*
 * @Author: Dongze Yang
 * @Date: 2024-03-28 13:57:00
 * @LastEditors: Dongze Yang
 * @LastEditTime: 2024-03-28 15:27:06
 * @Description: 
 */
package processor.m500_memory;

// Units
import processor.m500_memory.CombineLatch;
import processor.m500_memory.DFF;




// Test JUNIT 5
import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.params.ParameterizedTest;
import org.junit.jupiter.params.provider.Arguments;
import org.junit.jupiter.params.provider.MethodSource;
import org.junit.jupiter.api.Test;
// Log 
import montiarc.rte.log.Log;
import de.se_rwth.commons.logging.LogStub;
// Java 
import java.util.stream.Stream;

public class UnitTest {
    // declaration
    private CombineLatch latch;
    private DFF dff;

    @BeforeEach
    void setUp(){
        // initialize the Log such that the MontiArc output can be seen
        LogStub.initPlusLog();
        Log.setTraceEnabled(true);
        LogStub.enableFailQuick(false);
    }


    @Test
    public void tester(){
        // Latch
        //testL();
        // DFF
        testD();

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

            //System.out.println("Expected Out: " + input[i][2]);
            //System.out.println("Current Out:  " + latch.getOut().getValue());
            Assertions.assertEquals(input[i][2], latch.getOut().getValue(), "Expected out");
            latch.tick();
        }

    }

    // Test DFF
    public void testD(){
        dff = new DFF();
        dff.setUp();
        dff.init();

        /*
         * st   d   cl  out
         * 1    0   0   0
         * 1    1   0   0
         * 0    -   0   keep, if st == 0 && cl == 0
         */
        // st d cl out
        boolean [][] input = {
            {false, false, false, false},
            {true, false, false, false},
            {true, true, false, false},
            {false, true, false, false},
            {false, false, true, false},

            {true, false, true, true},

            {true, true, true, true},
            {true, false, true, true},
            {true, true, true, true},
            {false, true, false, true},
            {false, false, false, true},
            {true, false, false, true},
            {true, true, false, true},
            {true, false, false, true},
            {true, false, true, false}
        };

        for(int i = 0; i < input.length; i++){
            System.out.println("------------ "+ i +"--------------");
            dff.getSt().update(input[i][0]);
            dff.getD().update(input[i][1]);
            dff.getCl().update(input[i][2]);
            dff.compute();

            //System.out.println("Expected Out: " + input[i][3]);
            //System.out.println("Current Out:  " + dff.getOut().getValue());
            Assertions.assertEquals(input[i][3], dff.getOut().getValue(), "Expected out");
            dff.tick();
        }

    }


}