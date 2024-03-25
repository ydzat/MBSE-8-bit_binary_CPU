/*
 * @Author: Dongze Yang
 * @Date: 2024-01-27 04:26:02
 * @LastEditors: Dongze Yang
 * @LastEditTime: 2024-03-25 16:14:26
 * @Description: 
 */
import processor.memory.DFF;
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
            {false, true, false, false, false, true},
            {false, false, false, false, false, true},
            {true,  false, false, false, false, true},
            {false, true,  false, false, false, true},
            {true,  true,  false, false, true,  false},
            {false, true,  true,  false, false, true},
            {true,  true,  true,  false, false, true},
            {false, true,  false, true,  true,  false},
            {true,  true,  false, true,  true,  false}
        };

    

        for(int i = 0; i < input.length; i++){
            System.out.println("-----------" + i + "-----------");
            System.out.println("d = " + input[i][0] + " en = " + input[i][1] + " clr = " + input[i][2] + " pr = " + input[i][3] + " expectedQ = " + input[i][4] + " expectedNq = " + input[i][5]);
            dff.getD().update(input[i][0]);
            dff.getEn().update(input[i][1]);
            dff.getClr().update(input[i][2]);
            dff.getPr().update(input[i][3]);
            //System.out.println(dff.rsff.getCurrentState());
            
            dff.compute();
            
            
            
            System.out.println("Q = " + dff.getQ().getValue() + " NQ = " + dff.getNq().getValue());

            Assertions.assertEquals(input[i][4], dff.getQ().getValue(),"expected Q");
            Assertions.assertEquals(input[i][5], dff.getNq().getValue(),"expected NQ");
        }

    }




}
