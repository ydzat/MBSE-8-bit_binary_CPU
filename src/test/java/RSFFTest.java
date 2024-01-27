/*
 * @Author: Dongze Yang
 * @Date: 2024-01-27 04:26:02
 * @LastEditors: Dongze Yang
 * @LastEditTime: 2024-01-27 05:54:52
 * @Description: 
 */
import processor.memory.RSFF;
import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.params.ParameterizedTest;
import org.junit.jupiter.params.provider.Arguments;
import org.junit.jupiter.params.provider.MethodSource;

import java.util.stream.Stream;

//import montiarc.rte.timesync.BooleanInPort;

public class RSFFTest {

    private RSFF rsff;

    @BeforeEach
    void setUp() {
        rsff = new RSFF();
        rsff.setUp();
        rsff.init();
    }

    static Stream<Arguments> testData() {
        return Stream.of(
            // 测试用例格式：r, s, clr, pr, expectedQ, expectedNq
            Arguments.of(false, false, false, false, false, true), // 初始状态
            Arguments.of(false, true, false, false, true, false),  // 设置
            Arguments.of(true, false, false, false, false, true),  // 重置
            Arguments.of(false, false, true, false, false, true),  // 清除
            Arguments.of(false, false, false, true, true, false)   // 预置
            // 可以添加更多测试用例
        );
    }

    @ParameterizedTest
    @MethodSource("testData")
    void testRSFF(boolean r, boolean s, boolean clr, boolean pr, boolean expectedQ, boolean expectedNq) {
        // 设置输入
        // rsff.setR(r);
        // rsff.setS(s);
        // rsff.setClr(clr);
        // rsff.setPr(pr);
        rsff.getR().update(r);
        rsff.getS().update(s);
        rsff.getClr().update(clr);
        rsff.getPr().update(pr);


        // System.out.println("-----------");
        // System.out.println(rsff.getR().getValue());
        // // 执行计算
        rsff.compute();

        // System.out.println("-----------");
        // System.out.println(expectedQ);
        // System.out.println(rsff.getQ().getValue());
        // System.out.println("-----------");

        // 验证输出
        Assertions.assertEquals(expectedQ, rsff.getQ().getValue(),"expected Q");
        Assertions.assertEquals(expectedNq, rsff.getNq().getValue(),"expected NQ");
    }
}
