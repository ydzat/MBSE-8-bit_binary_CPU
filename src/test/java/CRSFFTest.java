/*
 * @Author: Dongze Yang
 * @Date: 2024-01-27 04:26:02
 * @LastEditors: Dongze Yang
 * @LastEditTime: 2024-03-27 17:03:00
 * @Description: 
 */
package processor.memory;

import processor.memory.CombineRSFF;
import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.params.ParameterizedTest;
import org.junit.jupiter.params.provider.Arguments;
import org.junit.jupiter.params.provider.MethodSource;

import montiarc.rte.log.Log;
import de.se_rwth.commons.logging.LogStub;

import org.junit.jupiter.api.Test;

import java.util.stream.Stream;

//import montiarc.rte.timesync.BooleanInPort;

public class CRSFFTest {

    private CombineRSFF rsff;

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
    public void testRSFF(){
        testRS();
    }

    public void testRS(){
        CombineRSFF rsff = new CombineRSFF();
        rsff.setUp();
        rsff.init();
        
        //r, s, clr, pr, expectedQ, expectedNq
        boolean [][] input = {
            {false, false, true, false, false, true},
            {false, true, false, false, true, false},
            {true, false, false, false, false, true},
            {false, false, true, false, false, true},
            {false, false, false, true, true, false},
            {false, false, false, false, true, false}
        };

        boolean lastQ = false, lastNQ = false;
        for (int i = 0; i < input.length; i++) {

            System.out.println("------------"+ i +"--------------");
            rsff.getR().update(input[i][0]);
            rsff.getS().update(input[i][1]);
            rsff.getClr().update(input[i][2]);
            rsff.getPr().update(input[i][3]);
            //System.out.println(rsff.getCurrentState());
            // if(i > 0){
            //     rsff.lo.getInputQ().update(lastQ);
            //     rsff.lo.getInputNQ().update(lastNQ);
            // }


            rsff.compute();

            lastQ = rsff.rsff.getQ().getValue();
            lastNQ = rsff.rsff.getNq().getValue();

            System.out.println("Expected Q: " + input[i][4] + " Expected NQ: " + input[i][5]);
            System.out.println("lastQ =     " + lastQ +       " lastNQ =     " + lastNQ);

            rsff.tick();
            //Assertions.assertEquals(input[i][4], rsff.getQ().getValue(),"expected Q");
            //Assertions.assertEquals(input[i][5], rsff.getNq().getValue(),"expected NQ");
        }
        
        
    }


















    // static Stream<Arguments> testData() {
    //     return Stream.of(
    //         //测试用例格式：r, s, clr, pr, expectedQ, expectedNq
            
    //         //初始清除：初始状态下进行清除。

    //         Arguments.of(false, false, true, false, false, true),
    //         //设置：在清除后设置。

    //         Arguments.of(false, true, false, false, true, false),
    //         //重置：在设置后重置。

    //         Arguments.of(true, false, false, false, false, true),
    //         //再次清除：在重置后进行清除。

    //         Arguments.of(false, false, true, false, false, true),
    //         //预置：在清除后预置。

    //         Arguments.of(false, false, false, true, true, false),
    //         //保持状态：所有输入为 0，保持当前状态（在此案例中，最后的状态是预置，即 q=true, nq=false）。

    //         Arguments.of(false, false, false, false, true, false)


    //     );
    // }

    // @ParameterizedTest
    // @MethodSource("testData")
    // void testRSFF(boolean r, boolean s, boolean clr, boolean pr, boolean expectedQ, boolean expectedNq) {
    //     // 设置输入
    //     // rsff.setR(r);
    //     // rsff.setS(s);
    //     // rsff.setClr(clr);
    //     // rsff.setPr(pr);
    //     rsff.getR().update(r);
    //     rsff.getS().update(s);
    //     rsff.getClr().update(clr);
    //     rsff.getPr().update(pr);


    //     System.out.println("-----input: r s clr pr q nq------");
    //     System.out.println(rsff.getR().getValue()+ " " + 
    //                         rsff.getS().getValue()+ " " +
    //                         rsff.getClr().getValue()+ " " +
    //                         rsff.getPr().getValue()+ " " +
    //                         expectedQ+ " " +
    //                         expectedNq+ " " );
    //     System.out.println("-----------");
    //     System.out.println(rsff.getCurrentState());
    //     // // 执行计算
    //     rsff.compute();
    //     System.out.println(rsff.getCurrentState());
    //     //System.out.println("outputQ = " + rsff.lastOut.getOutputQ().getValue());
    //     //System.out.println("outputNQ = " + rsff.lastOut.getOutputNQ().getValue());

    //     System.out.println("-------output----");
    //     System.out.println(rsff.getR().getValue()+ " " + 
    //                         rsff.getS().getValue()+ " " +
    //                         rsff.getClr().getValue()+ " " +
    //                         rsff.getPr().getValue()+ " " +
    //                         rsff.getQ().getValue()+ " " +
    //                         rsff.getNq().getValue()+ " " );
    //     System.out.println("-----------");

    //     // 验证输出
    //     Assertions.assertEquals(expectedQ, rsff.getQ().getValue(),"expected Q");
    //     Assertions.assertEquals(expectedNq, rsff.getNq().getValue(),"expected NQ");
    // }
}
