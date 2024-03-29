/*
 * @Author: Dongze Yang
 * @Date: 2024-03-28 13:57:00
 * @LastEditors: Dongze Yang
 * @LastEditTime: 2024-03-29 06:36:58
 * @Description: 
 */
package processor.m500_memory;

// Units
//import processor.m500_memory.Demo;
import processor.m500_memory.CombineLatch;
import processor.m500_memory.DFF;
import processor.m500_memory.Register;
import processor.m500_memory.Register8;
import processor.m500_memory.RAM;

//import processor.m600_processor.CombinedMemory;

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
    //private Demo demo;
    private CombineLatch latch;
    private DFF dff;
    private Register reg;
    private Register8 reg8;
    private RAM ram;


    @BeforeEach
    void setUp(){
        // initialize the Log such that the MontiArc output can be seen
        LogStub.initPlusLog();
        Log.setTraceEnabled(true);
        LogStub.enableFailQuick(false);
    }


    @Test
    public void tester(){
        //testDemo();
        /*  Memory  */
        //testLatch();  // check
        //testDFF();    // check
        //testReg();    // check
        //testReg8();   // check
        //testRAM();    // check

        /*  Processor  */
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

            //System.out.println("Expected Out: " + input[i][3]);
            //System.out.println("Current Out:  " + dff.getOut().getValue());
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
                false, false, false, false, false, false, false, false}, // 当st和cl都为0时，所有输出应保持为0
            {false, true, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false},  // 当st为0且cl为1时，所有输出应保持为0
            {true, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false},  // 当st为1且cl为0时，所有输出应保持为0
            {true, true, 
                false, false, false, false, false, false, false, false, 
                false, false, false, false, false, false, false, false},   // 当st和cl都为1且所有数据输入都为0时，所有输出应为0
            {true, false,
                true, true, true, true, true, true, true, true, 
                false, false, false, false, false, false, false, false},                  // 当st为1且cl为0时，所有输出应保持为0
            
            {true, true, 
                true, true, true, true, true, true, true, true, 
                true, true, true, true, true, true, true, true},                  // 当st和cl都为1且所有数据输入都为1时，所有输出应为1
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

            //System.out.println("Expected Out: " + input[i][3]);
            //System.out.println("Current Out:  " + dff.getOut().getValue());
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

    // public void testReg8(){
    //     reg8 = new Register8();
    //     reg8.setUp();
    //     reg8.init();

    //     boolean[][] input = {
    //         // st, cl, x7, x6, x5, x4, x3, x2, x1, x0, expected a7, a6, a5, a4, a3, a2, a1, a0
    //         {false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false}, // 当st和cl都为0时，所有输出应保持为0
    //         {true, false, true, true, true, true, true, true, true, true, false, false, false, false, false, false, false, false},  // 当st为1且cl为0时，所有输出应保持为0，因为没有时钟上升沿
    //         {true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true},  // 当st为1且cl从0变为1时，所有输出应为1，因为有时钟上升沿且st为1
    //         {false, true, false, false, false, false, false, false, false, false, true, true, true, true, true, true, true, true},  // 当st为0且cl为1时，所有输出应保持为1，因为st为0，所以不会存储新的数据
    //         {false, false, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true},  // 当st为0且cl为0时，所有输出应保持为1，因为没有时钟上升沿
    //     };

    //     for(int i = 0; i < input.length; i++){
    //         System.out.println("------------ "+ i +"--------------");
    //         reg8.getSt().update(input[i][0]);
    //         reg8.getCl().update(input[i][1]);
    //         reg8.getX7().update(input[i][2]);
    //         reg8.getX6().update(input[i][3]);
    //         reg8.getX5().update(input[i][4]);
    //         reg8.getX4().update(input[i][5]);
    //         reg8.getX3().update(input[i][6]);
    //         reg8.getX2().update(input[i][7]);
    //         reg8.getX1().update(input[i][8]);
    //         reg8.getX0().update(input[i][9]);
    //         reg8.compute();
    //         Assertions.assertEquals(input[i][10], reg8.getA7().getValue(), "Expected a7");
    //         Assertions.assertEquals(input[i][11], reg8.getA6().getValue(), "Expected a6");
    //         Assertions.assertEquals(input[i][12], reg8.getA5().getValue(), "Expected a5");
    //         Assertions.assertEquals(input[i][13], reg8.getA4().getValue(), "Expected a4");
    //         Assertions.assertEquals(input[i][14], reg8.getA3().getValue(), "Expected a3");
    //         Assertions.assertEquals(input[i][15], reg8.getA2().getValue(), "Expected a2");
    //         Assertions.assertEquals(input[i][16], reg8.getA1().getValue(), "Expected a1");
    //         Assertions.assertEquals(input[i][17], reg8.getA0().getValue(), "Expected a0");
    //         reg8.tick();
    //     }
    // }

    public void testRAM(){
        ram = new RAM();
        ram.setUp();
        ram.init();

        boolean[][] input = {
            // ad, st, cl, x7, x6, x5, x4, x3, x2, x1, x0, expected a7, a6, a5, a4, a3, a2, a1, a0
            {false, false, false, 
                false, false, false, false, false, false, false, false,
                false, false, false, false, false, false, false, false}, // 当ad、st和cl都为0时，所有输出应保持为0
            {true, false, false, 
                true, true, true, true, true, true, true, true,
                false, false, false, false, false, false, false, false},  // 当ad为1且st和cl为0时，所有输出应保持为0，因为没有时钟上升沿
            {false, true, false, 
                true, true, true, true, true, true, true, true, 
                false, false, false, false, false, false, false, false},  // 当st为1且ad和cl为0时，所有输出应保持为0，因为没有时钟上升沿
            {false, false, true, 
                true, true, true, true, true, true, true, true,
                false, false, false, false, false, false, false, false},  // 当cl为1且ad和st为0时，所有输出应保持为0，因为st为0，所以不会存储新的数据
            {false, true, true, 
                true, true, true, true, true, true, true, true, 
                true, true, true, true, true, true, true, true},  // 当st和cl都为1且ad为0时，所有输出应为1，因为有时钟上升沿且st为1
            {true, true, true, 
                false, false, false, false, false, false, false, false,
                false, false, false, false, false, false, false, false},  // 当ad和和st和cl都为1且st为0时，输出为0
            {true, false, true,
                true, true, true, true, true, true, true, true,
                false, false, false, false, false, false, false, false 
            }// 当ad和cl为1且st为0时，输出为0
        };
    
        for(int i = 0 ; i < input.length; i++){
            System.out.println("------------ "+ i +"--------------");
            ram.getAd().update(input[i][0]);
            ram.getSt().update(input[i][1]);
            ram.getCl().update(input[i][2]);
            ram.getX7().update(input[i][3]);
            ram.getX6().update(input[i][4]);
            ram.getX5().update(input[i][5]);
            ram.getX4().update(input[i][6]);
            ram.getX3().update(input[i][7]);
            ram.getX2().update(input[i][8]);
            ram.getX1().update(input[i][9]);
            ram.getX0().update(input[i][10]);
            ram.compute();
            Assertions.assertEquals(input[i][11], ram.getA7().getValue(), "Expected a7");
            Assertions.assertEquals(input[i][12], ram.getA6().getValue(), "Expected a6");
            Assertions.assertEquals(input[i][13], ram.getA5().getValue(), "Expected a5");
            Assertions.assertEquals(input[i][14], ram.getA4().getValue(), "Expected a4");
            Assertions.assertEquals(input[i][15], ram.getA3().getValue(), "Expected a3");
            Assertions.assertEquals(input[i][16], ram.getA2().getValue(), "Expected a2");
            Assertions.assertEquals(input[i][17], ram.getA1().getValue(), "Expected a1");
            Assertions.assertEquals(input[i][18], ram.getA0().getValue(), "Expected a0");
            ram.tick();
        }
    }

    // public void testDemo(){
    //     demo = new Demo();
    //     demo.setUp();
    //     demo.init();
    //     demo.compute();

    //     demo.getIn().update(true);
        

    //     System.out.println("------------ Demo -------------- ");
    //     System.out.println("Out: " + demo.getOut().getValue());
    // }

}