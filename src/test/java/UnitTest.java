/*
 * @Author: Dongze Yang
 * @Date: 2024-03-28 13:57:00
 * @LastEditors: Dongze Yang
 * @LastEditTime: 2024-03-29 14:54:17
 * @Description: 
 */
package processor.m500_memory;

// Units
//import processor.m500_memory.Demo;
import processor.m500_memory.CombineLatch;
import processor.m500_memory.DFF;
import processor.m500_memory.Register;
import processor.m500_memory.RAM8;
import processor.m600_processor.Computer;
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
    private RAM8 ram8;
    private Computer computer;

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
        //testRAM();    // check
        // testRAM8();
        /*  Processor  */
        testComputer();
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
                false, false, false, false, false, false, false, false}, // 全部都是false
            {false, false, false, 
                true, false, false, false, 
                false, false, false, false, false, false, false, false, 
                false, false, false, false, false, false, false, false}, // 改变cl
            {false, false, false, 
                true, true, false, false, 
                false, false, false, false, false, false, false, false, 
                false, false, false, false, false, false, false, false}, // 改变st
            {false, false, false, 
                true, true, true, false, 
                false, false, false, false, false, false, false, false, 
                false, false, false, false, false, false, false, false}, // 改变w
            {false, false, false, 
                true, true, true, true, 
                false, false, false, false, false, false, false, false, 
                false, false, false, false, false, false, false, false}, // 改变r
            {false, false, true, 
                true, true, true, true, 
                false, false, false, false, false, false, false, false, 
                false, false, false, false, false, false, false, false}, // 改变地址
            // 000 写入 11111111后读取
            {false, false, false, 
                false, true, true, true, 
                true, true, true, true, true, true, true, true, 
                false, false, false, false, false, false, false, false}, // 改变数据
            {false, false, false,
                true, true, true, true,
                true, true, true, true, true, true, true, true,
                true, true, true, true, true, true, true, true}, // 改变数据
            // 010 
            {false, true, false, 
                false, true, true, true, 
                true, false, true, false, true, false, true, false, 
                false, false, false, false, false, false, false, false}, // 改变地址
            {false, true, false,
                true, true, true, true,
                true, false, true, false, true, false, true, false,
                true, false, true, false, true, false, true, false}, // 改变数据
            // 101
            {true, false, true,
                false, true, true, true,
                false, false, false, true, false, false, true, false,
                false, false, false, false, false, false, false, false}, // 改变地址
            {true, false, true,
                true, true, true, true,
                false, false, false, true, false, false, true, false,
                false, false, false, true, false, false, true, false}, // 改变数据
            // 110
            {true, true, false,
                false, true, true, true,
                false, true, true, false, true, true, true, false,
                false, false, false, false, false, false, false, false}, // 改变地址
            {true, true, false,
                true, true, true, true,
                false, true, true, false, true, true, true, false,
                false, true, true, false, true, true, true, false}, // 改变数据
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
            {false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,true,false},
            {false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,true,true}
        };

        for(int i = 0 ; i < input.length; i++){
            computer.getI0().update(input[i][0]);
            computer.getI1().update(input[i][1]);
            computer.getI2().update(input[i][2]);
            computer.getI3().update(input[i][3]);
            computer.getI4().update(input[i][4]);
            computer.getI5().update(input[i][5]);
            computer.getI6().update(input[i][6]);
            computer.getI7().update(input[i][7]);
            computer.getI8().update(input[i][8]);
            computer.getI9().update(input[i][9]);
            computer.getI10().update(input[i][10]);
            computer.getI11().update(input[i][11]);
            computer.getI12().update(input[i][12]);
            computer.getI13().update(input[i][13]);
            computer.getI14().update(input[i][14]);
            computer.getI15().update(input[i][15]);
            computer.getCl().update(input[i][16]);


            computer.compute();
            System.out.println("=====================================================");
            System.out.println("A7 = " + computer.getComponentMem().getComponentRegister_a().getA7().getValue());
            System.out.println("A6 = " + computer.getComponentMem().getComponentRegister_a().getA6().getValue());
            System.out.println("A5 = " + computer.getComponentMem().getComponentRegister_a().getA5().getValue());
            System.out.println("A4 = " + computer.getComponentMem().getComponentRegister_a().getA4().getValue());
            System.out.println("A3 = " + computer.getComponentMem().getComponentRegister_a().getA3().getValue());
            System.out.println("A2 = " + computer.getComponentMem().getComponentRegister_a().getA2().getValue());
            System.out.println("A1 = " + computer.getComponentMem().getComponentRegister_a().getA1().getValue());
            System.out.println("A0 = " + computer.getComponentMem().getComponentRegister_a().getA0().getValue());
            computer.tick();
            
        }
    }

}