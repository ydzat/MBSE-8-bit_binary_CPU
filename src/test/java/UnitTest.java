/*
 * @Author: Dongze Yang
 * @Date: 2024-03-29 01:43:52
 * @LastEditors: Dongze Yang
 * @LastEditTime: 2024-03-31 01:38:34
 * @Description: 
 */
package processor.m500_memory;

// Units
import processor.m500_memory.CombineLatch;
import processor.m500_memory.DFF;
import processor.m500_memory.Register;
import processor.m500_memory.RAM8;
import processor.m600_processor.Computer;

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
import java.util.ArrayList;

public class UnitTest {
    // declaration
    private CombineLatch latch;
    private DFF dff;
    private Register reg;
    private RAM8 ram8;
    private Computer computer;

    //private Calculator calculator;

    @BeforeEach
    void setUp(){
        // initialize the Log such that the MontiArc output can be seen
        // LogStub.initPlusLog();
        // Log.setTraceEnabled(true);
        // LogStub.enableFailQuick(false);
    }


    @Test
    public void tester(){
 
        /*  Memory  */
        // testLatch();  // check
        // testDFF();    // check
        // testReg();    // check
        // testRAM();    // check
        // testRAM8();   // check

        /*  Processor  */
        // testComputer(); // check
    }

    public void testLatch(){
        latch = new CombineLatch();
        latch.setUp();
        latch.init();

        /*
         * st   d   expectedOut LastOutOne
         * 1    0   0           default
         * 1    1   1           0
         * 0    1   keep        1
         * 0    0   keep        1
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

            Assertions.assertEquals(input[i][2], latch.getOut().getValue(), "Expected out");
            latch.tick();
        }

    }

    // Test DFF
    public void testDFF(){
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

            Assertions.assertEquals(input[i][3], dff.getOut().getValue(), "Expected out");
            dff.tick();
        }

    }

    public void testReg(){
        reg = new Register();
        reg.setUp();
        reg.init();

        boolean[][] input = {
            // st, cl, d7, d6, d5, d4, d3, d2, d1, d0, expected a7, a6, a5, a4, a3, a2, a1, a0
            {false, false, 
                false, false, false, false, false, false, false, false, 
                false, false, false, false, false, false, false, false}, 
            {false, true, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false},  
            {true, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false}, 
            {true, true, 
                false, false, false, false, false, false, false, false, 
                false, false, false, false, false, false, false, false},   
            {true, false,
                true, true, true, true, true, true, true, true, 
                false, false, false, false, false, false, false, false},                  
            
            {true, true, 
                true, true, true, true, true, true, true, true, 
                true, true, true, true, true, true, true, true},                  
        };

        for (int i = 0; i < input.length; i++){
            System.out.println("------------ "+ i +"--------------");
            reg.getSt().update(input[i][0]);
            reg.getCl().update(input[i][1]);
            reg.getD7().update(input[i][2]);
            reg.getD6().update(input[i][3]);
            reg.getD5().update(input[i][4]);
            reg.getD4().update(input[i][5]);
            reg.getD3().update(input[i][6]);
            reg.getD2().update(input[i][7]);
            reg.getD1().update(input[i][8]);
            reg.getD0().update(input[i][9]);
            reg.compute();

            Assertions.assertEquals(input[i][10], reg.getA7().getValue(), "Expected a7");
            Assertions.assertEquals(input[i][11], reg.getA6().getValue(), "Expected a6");
            Assertions.assertEquals(input[i][12], reg.getA5().getValue(), "Expected a5");
            Assertions.assertEquals(input[i][13], reg.getA4().getValue(), "Expected a4");
            Assertions.assertEquals(input[i][14], reg.getA3().getValue(), "Expected a3");
            Assertions.assertEquals(input[i][15], reg.getA2().getValue(), "Expected a2");
            Assertions.assertEquals(input[i][16], reg.getA1().getValue(), "Expected a1");
            Assertions.assertEquals(input[i][17], reg.getA0().getValue(), "Expected a0");
            reg.tick();
        }
    }

    public void testRAM8(){
        ram8 = new RAM8();
        ram8.setUp();
        ram8.init();

        boolean[][] input = {
            // ad2, ad1, ad0, 
            //      cl, st, w, r, 
            //      d7, d6, d5, d4, d3, d2, d1, d0, 
            //      a7, a6 ,a5,a4,a3,a2,a1,a0
            {false, false, false, 
                false, false, false, false, 
                false, false, false, false, false, false, false, false, 
                false, false, false, false, false, false, false, false}, 
            {false, false, false, 
                true, false, false, false, 
                false, false, false, false, false, false, false, false, 
                false, false, false, false, false, false, false, false}, 
            {false, false, false, 
                true, true, false, false, 
                false, false, false, false, false, false, false, false, 
                false, false, false, false, false, false, false, false}, 
            {false, false, false, 
                true, true, true, false, 
                false, false, false, false, false, false, false, false, 
                false, false, false, false, false, false, false, false}, 
            {false, false, false, 
                true, true, true, true, 
                false, false, false, false, false, false, false, false, 
                false, false, false, false, false, false, false, false}, 
            {false, false, true, 
                true, true, true, true, 
                false, false, false, false, false, false, false, false, 
                false, false, false, false, false, false, false, false}, 

            {false, false, false, 
                false, true, true, true, 
                true, true, true, true, true, true, true, true, 
                false, false, false, false, false, false, false, false}, 
            {false, false, false,
                true, true, true, true,
                true, true, true, true, true, true, true, true,
                true, true, true, true, true, true, true, true}, 
            // 010 
            {false, true, false, 
                false, true, true, true, 
                true, false, true, false, true, false, true, false, 
                false, false, false, false, false, false, false, false}, 
            {false, true, false,
                true, true, true, true,
                true, false, true, false, true, false, true, false,
                true, false, true, false, true, false, true, false}, 
            // 101
            {true, false, true,
                false, true, true, true,
                false, false, false, true, false, false, true, false,
                false, false, false, false, false, false, false, false}, 
            {true, false, true,
                true, true, true, true,
                false, false, false, true, false, false, true, false,
                false, false, false, true, false, false, true, false}, 
            // 110
            {true, true, false,
                false, true, true, true,
                false, true, true, false, true, true, true, false,
                false, false, false, false, false, false, false, false}, 
            {true, true, false,
                true, true, true, true,
                false, true, true, false, true, true, true, false,
                false, true, true, false, true, true, true, false}, 
            // random access
            // read 010
            {false, true, false,
                false, true, true, true,
                false, false, false, false, false, false, false, false,
                true, false, true, false, true, false, true, false},
            {false, true, false,
                false, true, false, true,
                false, false, false, false, false, false, false, false,
                true, false, true, false, true, false, true, false},
            {false, true, false,
                false, false, false, true,
                false, false, false, false, false, false, false, false,
                true, false, true, false, true, false, true, false},
            // read 110
            {true, true, false,
                false, false, false, true,
                false, false, false, false, false, false, false, false,
                false, true, true, false, true, true, true, false},
            // read 000
            {false, false, false,
                false, false, false, true,
                false, false, false, false, false, false, false, false,
                true, true, true, true, true, true, true, true},
            // read 101
            {true, false, true,
                false, false, false, true,
                false, false, false, false, false, false, false, false,
                false, false, false, true, false, false, true, false},
            // overwrite 010
            {false, true, false,
                false, true, false, true,
                true, false, false, true, true, false, false, true,
                true, false, true, false, true, false, true, false},
            {false, true, false,
                false, true, true, true,
                true, false, false, true, true, false, false, true,
                true, false, true, false, true, false, true, false},
            {false, true, false,
                true, true, true, true,
                true, false, false, true, true, false, false, true,
                true, false, false, true, true, false, false, true},
        };

        for(int i = 0 ; i < input.length; i++){
            ram8.getAd2().update(input[i][0]);
            ram8.getAd1().update(input[i][1]);
            ram8.getAd0().update(input[i][2]);
            ram8.getCl().update(input[i][3]);
            ram8.getSt().update(input[i][4]);

            // There are inputs r and w when designing the circuit, but they are optimized during the implementation process.
            // ram8.getW().update(input[i][5]);
            // ram8.getR().update(input[i][6]);

            ram8.getD7().update(input[i][7]);
            ram8.getD6().update(input[i][8]);
            ram8.getD5().update(input[i][9]);
            ram8.getD4().update(input[i][10]);
            ram8.getD3().update(input[i][11]);
            ram8.getD2().update(input[i][12]);
            ram8.getD1().update(input[i][13]);
            ram8.getD0().update(input[i][14]);

            ram8.compute();
            Assertions.assertEquals(input[i][15], ram8.getA7().getValue(), "Expected a7");
            Assertions.assertEquals(input[i][16], ram8.getA6().getValue(), "Expected a6");
            Assertions.assertEquals(input[i][17], ram8.getA5().getValue(), "Expected a5");
            Assertions.assertEquals(input[i][18], ram8.getA4().getValue(), "Expected a4");
            Assertions.assertEquals(input[i][19], ram8.getA3().getValue(), "Expected a3");
            Assertions.assertEquals(input[i][20], ram8.getA2().getValue(), "Expected a2");
            Assertions.assertEquals(input[i][21], ram8.getA1().getValue(), "Expected a1");
            Assertions.assertEquals(input[i][22], ram8.getA0().getValue(), "Expected a0");
            ram8.tick();
            
        }
    }

    public void testComputer(){
        computer = new Computer();
        computer.setUp();
        computer.init();

        boolean[][] input = {
            // cl  i15, i14, i13, i12, i11, i10, i9, i8, i7, i6, i5, i4, i3, i2, i1, i0
            // cl  ci   -    -    *    -    u    op1 op0 zx  sw  a   d   sa  lt  eq  gt   
            // A = 1, D = 0
            {false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,true},
            {true,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,true},
            // A = 2, D = 0
            {false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,true,false},
            {true,false,false,false,false,false,false,false,false,false,false,false,false,false,false,true,false},
            // A = 3, D = 0
            {false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,true,true},
            {true,false,false,false,false,false,false,false,false,false,false,false,false,false,false,true,true},
            // A = 4, D = 0
            {false,false,false,false,false,false,false,false,false,false,false,false,false,false,true,false,false},
            {true,false,false,false,false,false,false,false,false,false,false,false,false,false,true,false,false},
            // A = 5, D = 0
            {false,false,false,false,false,false,false,false,false,false,false,false,false,false,true,false,true},
            {true,false,false,false,false,false,false,false,false,false,false,false,false,false,true,false,true},
            // A = 6, D = 0
            {false,false,false,false,false,false,false,false,false,false,false,false,false,false,true,true,false},
            {true,false,false,false,false,false,false,false,false,false,false,false,false,false,true,true,false},
            // A = 7, D = 0
            {false,false,false,false,false,false,false,false,false,false,false,false,false,false,true,true,true},
            {true,false,false,false,false,false,false,false,false,false,false,false,false,false,true,true,true},
            // A = 8, D = 0
            {false,false,false,false,false,false,false,false,false,false,false,false,false,true,false,false,false},
            {true,false,false,false,false,false,false,false,false,false,false,false,false,true,false,false,false},

            // A = 5, D = 0
            {false,false,false,false,false,false,false,false,false,false,false,false,false,false,true,false,true},
            {true,false,false,false,false,false,false,false,false,false,false,false,false,false,true,false,true},
            // D = 0
            {false,true,false,false,false,false,false,false,false,true,false,false,true,false,false,false,false},
            {true,true,false,false,false,false,false,false,false,true,false,false,true,false,false,false,false},
            // D = D + A
            {false,true,false,false,false,false,true,false,false,false,false,false,true,false,false,false,false},
            {true,true,false,false,false,false,true,false,false,false,false,false,true,false,false,false,false},
            // A = 2
            {false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,true,false},
            {true,false,false,false,false,false,false,false,false,false,false,false,false,false,false,true,false},
            // D = D + A
            {false,true,false,false,false,false,true,false,false,false,false,false,true,false,false,false,false},
            {true,true,false,false,false,false,true,false,false,false,false,false,true,false,false,false,false},
            // A = 0
            {false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false},
            {true,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false},
            // SA = D + A
            {false,true,false,false,false,false,true,false,false,false,false,false,false,true,false,false,false},
            {true,true,false,false,false,false,true,false,false,false,false,false,false,true,false,false,false},
        };

        boolean [][] outputA = new boolean[input.length][8];
        boolean [][] expectedA = {
            // A = 1, D = 0
            {false, false, false, false, false, false, false, false},
            {false, false, false, false, false, false, false, true},
            // A = 2, D = 0
            {false, false, false, false, false, false, false, true},
            {false, false, false, false, false, false, true, false},
            // A = 3, D = 0
            {false, false, false, false, false, false, true, false},
            {false, false, false, false, false, false, true, true},
            // A = 4, D = 0
            {false, false, false, false, false, false, true, true},
            {false, false, false, false, false, true, false, false},
            // A = 5, D = 0
            {false, false, false, false, false, true, false, false},
            {false, false, false, false, false, true, false, true},
            // A = 6, D = 0
            {false, false, false, false, false, true, false, true},
            {false, false, false, false, false, true, true, false},
            // A = 7, D = 0
            {false, false, false, false, false, true, true, false},
            {false, false, false, false, false, true, true, true},
            // A = 8, D = 0
            {false, false, false, false, false, true, true, true},
            {false, false, false, false, true, false, false, false},

            // A = 5, D = 0
            {false, false, false, false, true, false, false, false},
            {false, false, false, false, false, true, false, true},
            // D = 0
            {false, false, false, false, false, true, false, true},
            {false, false, false, false, false, true, false, true},
            // D = D + A
            {false, false, false, false, false, true, false, true},
            {false, false, false, false, false, true, false, true},
            // A = 2
            {false, false, false, false, false, true, false, true},
            {false, false, false, false, false, false, true, false},
            // D = D + A
            {false, false, false, false, false, false, true, false},
            {false, false, false, false, false, false, true, false},
            // A = 0
            {false, false, false, false, false, false, true, false},
            {false, false, false, false, false, false, false, false},
            // SA = D + A
            {false, false, false, false, false, false, false, false},
            {false, false, false, false, false, false, false, false},
        };

        boolean [][] outputD = new boolean[input.length][8];
        boolean [][] expectedD = {
            {false, false, false, false, false, false, false, false},
            {false, false, false, false, false, false, false, false},
            {false, false, false, false, false, false, false, false},
            {false, false, false, false, false, false, false, false},
            {false, false, false, false, false, false, false, false},
            {false, false, false, false, false, false, false, false},
            {false, false, false, false, false, false, false, false},
            {false, false, false, false, false, false, false, false},
            {false, false, false, false, false, false, false, false},
            {false, false, false, false, false, false, false, false},
            {false, false, false, false, false, false, false, false},
            {false, false, false, false, false, false, false, false},
            {false, false, false, false, false, false, false, false},
            {false, false, false, false, false, false, false, false},
            {false, false, false, false, false, false, false, false},
            {false, false, false, false, false, false, false, false},

            {false, false, false, false, false, false, false, false},
            {false, false, false, false, false, false, false, false},
            // D = 0
            {false, false, false, false, false, false, false, false},
            {false, false, false, false, false, false, false, false},
            // D = D + A
            {false, false, false, false, false, false, false, false},
            {false, false, false, false, false, true, false, true},
            // A = 2
            {false, false, false, false, false, true, false, true},
            {false, false, false, false, false, true, false, true},
            // D = D + A
            {false, false, false, false, false, true, false, true},
            {false, false, false, false, false, true, true, true},
            // A = 0
            {false, false, false, false, false, true, true, true},
            {false, false, false, false, false, true, true, true},
            // SA = D + A
            {false, false, false, false, false, true, true, true},
            {false, false, false, false, false, true, true, true},

        };

        // sa, The current value in RAM at the address given by A the register
        boolean [][] outputSA = new boolean[input.length][8];
        boolean [][] expectedSA = {
            {false, false, false, false, false, false, false, false},
            {false, false, false, false, false, false, false, false},
            {false, false, false, false, false, false, false, false},
            {false, false, false, false, false, false, false, false},
            {false, false, false, false, false, false, false, false},
            {false, false, false, false, false, false, false, false},
            {false, false, false, false, false, false, false, false},
            {false, false, false, false, false, false, false, false},
            {false, false, false, false, false, false, false, false},
            {false, false, false, false, false, false, false, false},
            {false, false, false, false, false, false, false, false},
            {false, false, false, false, false, false, false, false},
            {false, false, false, false, false, false, false, false},
            {false, false, false, false, false, false, false, false},
            {false, false, false, false, false, false, false, false},
            {false, false, false, false, false, false, false, false},
            {false, false, false, false, false, false, false, false},
            {false, false, false, false, false, false, false, false},
            // D = 0
            {false, false, false, false, false, false, false, false},
            {false, false, false, false, false, false, false, false},
            // D = D + A
            {false, false, false, false, false, false, false, false},
            {false, false, false, false, false, false, false, false},
            // A = 2
            {false, false, false, false, false, false, false, false},
            {false, false, false, false, false, false, false, false},
            // D = D + A
            {false, false, false, false, false, false, false, false},
            {false, false, false, false, false, false, false, false},
            // A = 0
            {false, false, false, false, false, false, false, false},
            {false, false, false, false, false, false, false, false},
            // SA = D + A
            {false, false, false, false, false, false, false, false},
            {false, false, false, false, false, true, true, true},
        };

        for(int i = 0 ; i < input.length; i++){
            computer.getCl().update(input[i][0]);
            computer.getI15().update(input[i][1]);
            computer.getI14().update(input[i][2]);
            computer.getI13().update(input[i][3]);
            computer.getI12().update(input[i][4]);
            computer.getI11().update(input[i][5]);
            computer.getI10().update(input[i][6]);
            computer.getI9().update(input[i][7]);
            computer.getI8().update(input[i][8]);
            computer.getI7().update(input[i][9]);
            computer.getI6().update(input[i][10]);
            computer.getI5().update(input[i][11]);
            computer.getI4().update(input[i][12]);
            computer.getI3().update(input[i][13]);
            computer.getI2().update(input[i][14]);
            computer.getI1().update(input[i][15]);
            computer.getI0().update(input[i][16]);


            computer.compute();
            System.out.println("========================"+i+"=========================");

            outputA[i][0] = computer.getComponentMem().getComponentRegister_a().getA7().getValue();
            outputA[i][1] = computer.getComponentMem().getComponentRegister_a().getA6().getValue();
            outputA[i][2] = computer.getComponentMem().getComponentRegister_a().getA5().getValue();
            outputA[i][3] = computer.getComponentMem().getComponentRegister_a().getA4().getValue();
            outputA[i][4] = computer.getComponentMem().getComponentRegister_a().getA3().getValue();
            outputA[i][5] = computer.getComponentMem().getComponentRegister_a().getA2().getValue();
            outputA[i][6] = computer.getComponentMem().getComponentRegister_a().getA1().getValue();
            outputA[i][7] = computer.getComponentMem().getComponentRegister_a().getA0().getValue();

            outputD[i][0] = computer.getComponentMem().getComponentRegister_d().getA7().getValue();
            outputD[i][1] = computer.getComponentMem().getComponentRegister_d().getA6().getValue();
            outputD[i][2] = computer.getComponentMem().getComponentRegister_d().getA5().getValue();
            outputD[i][3] = computer.getComponentMem().getComponentRegister_d().getA4().getValue();
            outputD[i][4] = computer.getComponentMem().getComponentRegister_d().getA3().getValue();
            outputD[i][5] = computer.getComponentMem().getComponentRegister_d().getA2().getValue();
            outputD[i][6] = computer.getComponentMem().getComponentRegister_d().getA1().getValue();
            outputD[i][7] = computer.getComponentMem().getComponentRegister_d().getA0().getValue();

            outputSA[i][0] = computer.getComponentMem().getSa7().getValue();
            outputSA[i][1] = computer.getComponentMem().getSa6().getValue();
            outputSA[i][2] = computer.getComponentMem().getSa5().getValue();
            outputSA[i][3] = computer.getComponentMem().getSa4().getValue();
            outputSA[i][4] = computer.getComponentMem().getSa3().getValue();
            outputSA[i][5] = computer.getComponentMem().getSa2().getValue();
            outputSA[i][6] = computer.getComponentMem().getSa1().getValue();
            outputSA[i][7] = computer.getComponentMem().getSa0().getValue();
           
            Assertions.assertArrayEquals(expectedA[i], outputA[i], "Expected A "+i);
            Assertions.assertArrayEquals(expectedD[i], outputD[i], "Expected D "+i);
            Assertions.assertArrayEquals(expectedSA[i], outputSA[i], "Expected SA "+i);


            // System.out.println("A7 = " + computer.getComponentMem().getComponentRegister_a().getA7().getValue());
            // System.out.println("A6 = " + computer.getComponentMem().getComponentRegister_a().getA6().getValue());
            // System.out.println("A5 = " + computer.getComponentMem().getComponentRegister_a().getA5().getValue());
            // System.out.println("A4 = " + computer.getComponentMem().getComponentRegister_a().getA4().getValue());
            // System.out.println("A3 = " + computer.getComponentMem().getComponentRegister_a().getA3().getValue());
            // System.out.println("A2 = " + computer.getComponentMem().getComponentRegister_a().getA2().getValue());
            // System.out.println("A1 = " + computer.getComponentMem().getComponentRegister_a().getA1().getValue());
            // System.out.println("A0 = " + computer.getComponentMem().getComponentRegister_a().getA0().getValue());
            // System.out.println(" ");
            // System.out.println("D7 = " + computer.getComponentMem().getComponentRegister_d().getA7().getValue());
            // System.out.println("D6 = " + computer.getComponentMem().getComponentRegister_d().getA6().getValue());
            // System.out.println("D5 = " + computer.getComponentMem().getComponentRegister_d().getA5().getValue());
            // System.out.println("D4 = " + computer.getComponentMem().getComponentRegister_d().getA4().getValue());
            // System.out.println("D3 = " + computer.getComponentMem().getComponentRegister_d().getA3().getValue());
            // System.out.println("D2 = " + computer.getComponentMem().getComponentRegister_d().getA2().getValue());
            // System.out.println("D1 = " + computer.getComponentMem().getComponentRegister_d().getA1().getValue());
            // System.out.println("D0 = " + computer.getComponentMem().getComponentRegister_d().getA0().getValue());





            // System.out.println(" ");
            // System.out.println("X7 = " + computer.getComponentMem().getX7().getValue());
            // System.out.println("X6 = " + computer.getComponentMem().getX6().getValue());
            // System.out.println("X5 = " + computer.getComponentMem().getX5().getValue());
            // System.out.println("X4 = " + computer.getComponentMem().getX4().getValue());
            // System.out.println("X3 = " + computer.getComponentMem().getX3().getValue());
            // System.out.println("X2 = " + computer.getComponentMem().getX2().getValue());
            // System.out.println("X1 = " + computer.getComponentMem().getX1().getValue());
            // System.out.println("X0 = " + computer.getComponentMem().getX0().getValue());
            // System.out.println("A = " + computer.getComponentMem().getA().getValue());
            // System.out.println("D = " + computer.getComponentMem().getD().getValue());
            // System.out.println("SA = " + computer.getComponentMem().getSa().getValue());
            // System.out.println("CL = " + computer.getComponentMem().getCl().getValue());

            // System.out.println("========================CU=========================");
            // System.out.println("A7 = " + computer.getComponentCu().getA7().getValue());
            // System.out.println("A6 = " + computer.getComponentCu().getA6().getValue());
            // System.out.println("A5 = " + computer.getComponentCu().getA5().getValue());
            // System.out.println("A4 = " + computer.getComponentCu().getA4().getValue());
            // System.out.println("A3 = " + computer.getComponentCu().getA3().getValue());
            // System.out.println("A2 = " + computer.getComponentCu().getA2().getValue());
            // System.out.println("A1 = " + computer.getComponentCu().getA1().getValue());
            // System.out.println("A0 = " + computer.getComponentCu().getA0().getValue());
            // System.out.println(" ");
            // System.out.println("D7 = " + computer.getComponentCu().getD7().getValue());
            // System.out.println("D6 = " + computer.getComponentCu().getD6().getValue());
            // System.out.println("D5 = " + computer.getComponentCu().getD5().getValue());
            // System.out.println("D4 = " + computer.getComponentCu().getD4().getValue());
            // System.out.println("D3 = " + computer.getComponentCu().getD3().getValue());
            // System.out.println("D2 = " + computer.getComponentCu().getD2().getValue());
            // System.out.println("D1 = " + computer.getComponentCu().getD1().getValue());
            // System.out.println("D0 = " + computer.getComponentCu().getD0().getValue());
            // System.out.println("===============AU R================");
            // System.out.println("R7 = " + computer.getComponentCu().getComponentInstruction().getComponentAlu().getComponentAu().getOut7().getValue());
            // System.out.println("R6 = " + computer.getComponentCu().getComponentInstruction().getComponentAlu().getComponentAu().getOut6().getValue());
            // System.out.println("R5 = " + computer.getComponentCu().getComponentInstruction().getComponentAlu().getComponentAu().getOut5().getValue());
            // System.out.println("R4 = " + computer.getComponentCu().getComponentInstruction().getComponentAlu().getComponentAu().getOut4().getValue());
            // System.out.println("R3 = " + computer.getComponentCu().getComponentInstruction().getComponentAlu().getComponentAu().getOut3().getValue());
            // System.out.println("R2 = " + computer.getComponentCu().getComponentInstruction().getComponentAlu().getComponentAu().getOut2().getValue());
            // System.out.println("R1 = " + computer.getComponentCu().getComponentInstruction().getComponentAlu().getComponentAu().getOut1().getValue());
            // System.out.println("R0 = " + computer.getComponentCu().getComponentInstruction().getComponentAlu().getComponentAu().getOut0().getValue());
            // System.out.println(" ");
            // System.out.println("X7 = " + computer.getComponentCu().getComponentInstruction().getComponentAlu().getComponentAu().getX7().getValue());
            // System.out.println("X6 = " + computer.getComponentCu().getComponentInstruction().getComponentAlu().getComponentAu().getX6().getValue());
            // System.out.println("X5 = " + computer.getComponentCu().getComponentInstruction().getComponentAlu().getComponentAu().getX5().getValue());
            // System.out.println("X4 = " + computer.getComponentCu().getComponentInstruction().getComponentAlu().getComponentAu().getX4().getValue());
            // System.out.println("X3 = " + computer.getComponentCu().getComponentInstruction().getComponentAlu().getComponentAu().getX3().getValue());
            // System.out.println("X2 = " + computer.getComponentCu().getComponentInstruction().getComponentAlu().getComponentAu().getX2().getValue());
            // System.out.println("X1 = " + computer.getComponentCu().getComponentInstruction().getComponentAlu().getComponentAu().getX1().getValue());
            // System.out.println("X0 = " + computer.getComponentCu().getComponentInstruction().getComponentAlu().getComponentAu().getX0().getValue());
            // System.out.println(" ");
            // System.out.println("Y7 = " + computer.getComponentCu().getComponentInstruction().getComponentAlu().getComponentAu().getY7().getValue());
            // System.out.println("Y6 = " + computer.getComponentCu().getComponentInstruction().getComponentAlu().getComponentAu().getY6().getValue());
            // System.out.println("Y5 = " + computer.getComponentCu().getComponentInstruction().getComponentAlu().getComponentAu().getY5().getValue());
            // System.out.println("Y4 = " + computer.getComponentCu().getComponentInstruction().getComponentAlu().getComponentAu().getY4().getValue());
            // System.out.println("Y3 = " + computer.getComponentCu().getComponentInstruction().getComponentAlu().getComponentAu().getY3().getValue());
            // System.out.println("Y2 = " + computer.getComponentCu().getComponentInstruction().getComponentAlu().getComponentAu().getY2().getValue());
            // System.out.println("Y1 = " + computer.getComponentCu().getComponentInstruction().getComponentAlu().getComponentAu().getY1().getValue());
            // System.out.println("Y0 = " + computer.getComponentCu().getComponentInstruction().getComponentAlu().getComponentAu().getY0().getValue());
            // System.out.println(" ");
            // System.out.println("OP0 = " + computer.getComponentCu().getComponentInstruction().getComponentAlu().getComponentAu().getOp0().getValue());
            // System.out.println("OP1 = " + computer.getComponentCu().getComponentInstruction().getComponentAlu().getComponentAu().getOp1().getValue());
            // System.out.println(" ");
            // System.out.println("ADD7 = " + computer.getComponentCu().getComponentInstruction().getComponentAlu().getComponentAu().getComponentAdd8().getS7().getValue());
            // System.out.println("ADD6 = " + computer.getComponentCu().getComponentInstruction().getComponentAlu().getComponentAu().getComponentAdd8().getS6().getValue());
            // System.out.println("ADD5 = " + computer.getComponentCu().getComponentInstruction().getComponentAlu().getComponentAu().getComponentAdd8().getS5().getValue());
            // System.out.println("ADD4 = " + computer.getComponentCu().getComponentInstruction().getComponentAlu().getComponentAu().getComponentAdd8().getS4().getValue());
            // System.out.println("ADD3 = " + computer.getComponentCu().getComponentInstruction().getComponentAlu().getComponentAu().getComponentAdd8().getS3().getValue());
            // System.out.println("ADD2 = " + computer.getComponentCu().getComponentInstruction().getComponentAlu().getComponentAu().getComponentAdd8().getS2().getValue());
            // System.out.println("ADD1 = " + computer.getComponentCu().getComponentInstruction().getComponentAlu().getComponentAu().getComponentAdd8().getS1().getValue());
            // System.out.println("ADD0 = " + computer.getComponentCu().getComponentInstruction().getComponentAlu().getComponentAu().getComponentAdd8().getS0().getValue());
            // System.out.println(" ");
            // System.out.println("ADD B7 = " + computer.getComponentCu().getComponentInstruction().getComponentAlu().getComponentAu().getComponentAdd8().getB7().getValue());
            // System.out.println("ADD B6 = " + computer.getComponentCu().getComponentInstruction().getComponentAlu().getComponentAu().getComponentAdd8().getB6().getValue());
            // System.out.println("ADD B5 = " + computer.getComponentCu().getComponentInstruction().getComponentAlu().getComponentAu().getComponentAdd8().getB5().getValue());
            // System.out.println("ADD B4 = " + computer.getComponentCu().getComponentInstruction().getComponentAlu().getComponentAu().getComponentAdd8().getB4().getValue());
            // System.out.println("ADD B3 = " + computer.getComponentCu().getComponentInstruction().getComponentAlu().getComponentAu().getComponentAdd8().getB3().getValue());
            // System.out.println("ADD B2 = " + computer.getComponentCu().getComponentInstruction().getComponentAlu().getComponentAu().getComponentAdd8().getB2().getValue());
            // System.out.println("ADD B1 = " + computer.getComponentCu().getComponentInstruction().getComponentAlu().getComponentAu().getComponentAdd8().getB1().getValue());
            // System.out.println("ADD B0 = " + computer.getComponentCu().getComponentInstruction().getComponentAlu().getComponentAu().getComponentAdd8().getB0().getValue());
            // System.out.println(" ");
            // System.out.println("ADD A7 = " + computer.getComponentCu().getComponentInstruction().getComponentAlu().getComponentAu().getComponentAdd8().getA7().getValue());
            // System.out.println("ADD A6 = " + computer.getComponentCu().getComponentInstruction().getComponentAlu().getComponentAu().getComponentAdd8().getA6().getValue());
            // System.out.println("ADD A5 = " + computer.getComponentCu().getComponentInstruction().getComponentAlu().getComponentAu().getComponentAdd8().getA5().getValue());
            // System.out.println("ADD A4 = " + computer.getComponentCu().getComponentInstruction().getComponentAlu().getComponentAu().getComponentAdd8().getA4().getValue());
            // System.out.println("ADD A3 = " + computer.getComponentCu().getComponentInstruction().getComponentAlu().getComponentAu().getComponentAdd8().getA3().getValue());
            // System.out.println("ADD A2 = " + computer.getComponentCu().getComponentInstruction().getComponentAlu().getComponentAu().getComponentAdd8().getA2().getValue());
            // System.out.println("ADD A1 = " + computer.getComponentCu().getComponentInstruction().getComponentAlu().getComponentAu().getComponentAdd8().getA1().getValue());
            // System.out.println("ADD A0 = " + computer.getComponentCu().getComponentInstruction().getComponentAlu().getComponentAu().getComponentAdd8().getA0().getValue());

            // System.out.println("===============ALU R================");
            // System.out.println("R7 = " + computer.getComponentCu().getComponentInstruction().getComponentAlu().getOut7().getValue());
            // System.out.println("R6 = " + computer.getComponentCu().getComponentInstruction().getComponentAlu().getOut6().getValue());
            // System.out.println("R5 = " + computer.getComponentCu().getComponentInstruction().getComponentAlu().getOut5().getValue());
            // System.out.println("R4 = " + computer.getComponentCu().getComponentInstruction().getComponentAlu().getOut4().getValue());
            // System.out.println("R3 = " + computer.getComponentCu().getComponentInstruction().getComponentAlu().getOut3().getValue());
            // System.out.println("R2 = " + computer.getComponentCu().getComponentInstruction().getComponentAlu().getOut2().getValue());
            // System.out.println("R1 = " + computer.getComponentCu().getComponentInstruction().getComponentAlu().getOut1().getValue());
            // System.out.println("R0 = " + computer.getComponentCu().getComponentInstruction().getComponentAlu().getOut0().getValue());
            // System.out.println(" ");
            // System.out.println("U = " + computer.getComponentCu().getComponentInstruction().getComponentAlu().getU().getValue());
            // System.out.println("OP1 = " + computer.getComponentCu().getComponentInstruction().getComponentAlu().getOp1().getValue());
            // System.out.println("OP0 = " + computer.getComponentCu().getComponentInstruction().getComponentAlu().getOp0().getValue());
            // System.out.println("ZX = " + computer.getComponentCu().getComponentInstruction().getComponentAlu().getZx().getValue());
            // System.out.println("SW = " + computer.getComponentCu().getComponentInstruction().getComponentAlu().getSw().getValue());
            // System.out.println(" ");
            // System.out.println("X7 = " + computer.getComponentCu().getComponentInstruction().getComponentAlu().getX7().getValue());
            // System.out.println("X6 = " + computer.getComponentCu().getComponentInstruction().getComponentAlu().getX6().getValue());
            // System.out.println("X5 = " + computer.getComponentCu().getComponentInstruction().getComponentAlu().getX5().getValue());
            // System.out.println("X4 = " + computer.getComponentCu().getComponentInstruction().getComponentAlu().getX4().getValue());
            // System.out.println("X3 = " + computer.getComponentCu().getComponentInstruction().getComponentAlu().getX3().getValue());
            // System.out.println("X2 = " + computer.getComponentCu().getComponentInstruction().getComponentAlu().getX2().getValue());
            // System.out.println("X1 = " + computer.getComponentCu().getComponentInstruction().getComponentAlu().getX1().getValue());
            // System.out.println("X0 = " + computer.getComponentCu().getComponentInstruction().getComponentAlu().getX0().getValue());
            // System.out.println(" ");
            // System.out.println("Y7 = " + computer.getComponentCu().getComponentInstruction().getComponentAlu().getY7().getValue());
            // System.out.println("Y6 = " + computer.getComponentCu().getComponentInstruction().getComponentAlu().getY6().getValue());
            // System.out.println("Y5 = " + computer.getComponentCu().getComponentInstruction().getComponentAlu().getY5().getValue());
            // System.out.println("Y4 = " + computer.getComponentCu().getComponentInstruction().getComponentAlu().getY4().getValue());
            // System.out.println("Y3 = " + computer.getComponentCu().getComponentInstruction().getComponentAlu().getY3().getValue());
            // System.out.println("Y2 = " + computer.getComponentCu().getComponentInstruction().getComponentAlu().getY2().getValue());
            // System.out.println("Y1 = " + computer.getComponentCu().getComponentInstruction().getComponentAlu().getY1().getValue());
            // System.out.println("Y0 = " + computer.getComponentCu().getComponentInstruction().getComponentAlu().getY0().getValue());
            // System.out.println("===============INSTRUCTION R================");
            // System.out.println("R7 = " + computer.getComponentCu().getComponentInstruction().getR7().getValue());
            // System.out.println("R6 = " + computer.getComponentCu().getComponentInstruction().getR6().getValue());
            // System.out.println("R5 = " + computer.getComponentCu().getComponentInstruction().getR5().getValue());
            // System.out.println("R4 = " + computer.getComponentCu().getComponentInstruction().getR4().getValue());
            // System.out.println("R3 = " + computer.getComponentCu().getComponentInstruction().getR3().getValue());
            // System.out.println("R2 = " + computer.getComponentCu().getComponentInstruction().getR2().getValue());
            // System.out.println("R1 = " + computer.getComponentCu().getComponentInstruction().getR1().getValue());
            // System.out.println("R0 = " + computer.getComponentCu().getComponentInstruction().getR0().getValue());
            // System.out.println("===============CU R================");
            // System.out.println("R7 = " + computer.getComponentCu().getR7().getValue());
            // System.out.println("R6 = " + computer.getComponentCu().getR6().getValue());
            // System.out.println("R5 = " + computer.getComponentCu().getR5().getValue());
            // System.out.println("R4 = " + computer.getComponentCu().getR4().getValue());
            // System.out.println("R3 = " + computer.getComponentCu().getR3().getValue());
            // System.out.println("R2 = " + computer.getComponentCu().getR2().getValue());
            // System.out.println("R1 = " + computer.getComponentCu().getR1().getValue());
            // System.out.println("R0 = " + computer.getComponentCu().getR0().getValue());
            computer.tick();
        }
    }
}