/*
 * @Author: Dongze Yang
 * @Date: 2024-01-27 04:26:02
 * @LastEditors: Dongze Yang
 * @LastEditTime: 2024-03-25 16:14:26
 * @Description: 
 */
import processor.m500_memory.DFF;
import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.params.ParameterizedTest;
import org.junit.jupiter.params.provider.Arguments;
import org.junit.jupiter.params.provider.MethodSource;

import org.junit.jupiter.api.Test;

import java.util.stream.Stream;

//import montiarc.rte.timesync.BooleanInPort;

public class DFFTest {

    private DFF dff;

    @BeforeEach
    void setUp() {
        dff = new DFF();
        dff.setUp();
        dff.init();
    }


    @Test
    void testDFF() {
        // 测试用例格式：d, en, clr, pr, expectedQ, expectedNq
        boolean [][] input = {
            {false, false, false, false},
            {false, true, false, false},
            {true,  true, false, false},
            {true, false,  false, false},
            {true,  true,  false, false},
            {true, true,  true,  true},
            {true,  false,  true,  true},
            {false, false,  true, true},
            {false,  true,  true, true},
            {true,  true,  false, true},
            {true,  false,  false, true},
            {true,  false,  true, false},
            {true,  false,  false, false},
            {true,  true,  false, false},
            {true,  true,  true, true},
        };

    

        for(int i = 0; i < input.length; i++){
            System.out.println("-----------" + i + "-----------");
            System.out.println("st = " + input[i][0] + " d = " + input[i][1] + " cl = " + input[i][2] +  " expectedOut = " + input[i][3]);
            dff.getSt().update(input[i][0]);
            dff.getD().update(input[i][1]);
            dff.getCl().update(input[i][2]);
            //System.out.println(dff.rsff.getCurrentState());
            
            
            // dff.getComponentL0().compute();
            // dff.getComponentL1().compute();
            dff.compute();
            
            
            
            // System.out.println("And0 Out = " + dff.getComponentAnd0().getOut().getValue());
            // System.out.println("d = " + dff.getD().getValue());
            // System.out.println("L0 Out = " + dff.getComponentL0().getOut().getValue());
            // System.out.println("And1 Out = " + dff.getComponentAnd1().getOut().getValue());

            // System.out.println("L1 d = " + dff.getComponentL1().getD().getValue());
            // System.out.println("L1 st = " + dff.getComponentL1().getSt().getValue());
            // System.out.println("L1 Out = " + dff.getComponentL1().getOut().getValue());

            System.out.println("Out = " + dff.getOut().getValue());

            // Assertions.as   sertEquals(input[i][4], dff.getQ().getValue(),"expected Q");
            // Assertions.assertEquals(input[i][5], dff.getNq().getValue(),"expected NQ");
        }

    }




}
