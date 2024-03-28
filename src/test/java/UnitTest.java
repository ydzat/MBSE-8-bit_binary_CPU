/*
 * @Author: Dongze Yang
 * @Date: 2024-03-28 13:57:00
 * @LastEditors: Dongze Yang
 * @LastEditTime: 2024-03-28 14:39:19
 * @Description: 
 */
package processor.memory;

// Units
import processor.memory.CombineLatch;
import processor.memory.DFF;




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
    public void testLatch(){
        // Latch
        testL();
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

            System.out.println("Expected Out: " + input[i][2]);
            System.out.println("Current Out:  " + latch.getOut().getValue());
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
            {true, true, false, true},
            {false, true, false, true}
        };


    }


}