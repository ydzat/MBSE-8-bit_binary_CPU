/*
 * @Author: Dongze Yang
 * @Date: 2024-01-25 02:30:53
 * @LastEditors: Dongze Yang
 * @LastEditTime: 2024-01-25 03:40:43
 * @Description: 
 */
import processor.CPU;
// import org.junit.Assert;
// import org.junit.Before;
// import org.junit.Test;
import ProcessorIO.NANDGate;

import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.params.ParameterizedTest;
import org.junit.jupiter.params.provider.Arguments;
import org.junit.jupiter.params.provider.MethodSource;

import java.util.stream.Stream;

public class ProcessorTest {

    

    @BeforeAll
    static void setUp() {
        // 初始化Processor实例
        
    }

    static Stream<Arguments> testData(){
        return Stream.of(
            Arguments.of(
                false,
                false,
                true
            ),
            Arguments.of(
                true,
                false,
                true
            ),
            Arguments.of(
                false,
                true,
                true                
            ),
            Arguments.of(
                true,
                true,
                false
            )
        );
    }




    @ParameterizedTest
    @MethodSource("testData")
    void test(
        boolean s1,
        boolean s2,
        boolean expectedR1
    ){
        CPU cpu = new CPU();
        cpu.setUp();
        cpu.init();

        //input
        var nand = new NANDGate();
        nand.setA(s1);
        nand.setB(s2);
        cpu.getS1().update(nand.a);
        cpu.getS2().update(nand.b);

        cpu.compute();

        var r1 = cpu.getS3().getValue();

        Assertions.assertTrue(r1 == expectedR1);
        cpu.tick();
    }
}
