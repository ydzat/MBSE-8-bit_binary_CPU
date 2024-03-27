
/*
 * Created on Tue Mar 26 2024
 *
 * Copyright (c) 2024 Xiangyu Tong
 */
import processor.memory.Latch;
import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.params.ParameterizedTest;
import org.junit.jupiter.params.provider.Arguments;
import org.junit.jupiter.params.provider.MethodSource;

import org.junit.jupiter.api.Test;

import java.util.stream.Stream;

public class LatchTest {
    private Latch latch;

    // @BeforeEach
    // void setUp() {
    //     latch = new Latch();
    //     latch.setUp();
    //     latch.init();
    // }

    @Test
    void testLatch(){
        gao();
    }

    void gao() {
        Latch latch = new Latch();
        latch.setUp();
        latch.init();
        // 测试用例格式：d, st, expectedOut
        boolean [][] input = {
            {false, true, false},
            {true, true, true},
            {true, false, false},
            {false, false, false},
            {true,  false, false},
            {false, false,  false},
            {true,  true,  true},
            {true, false,  false},
            {true,  true,  true},
            {false, true,  true},
            {true, true,  true},
            {false, true,  true},
            {false, false,  true},
            {true,  false,  false}
        };

    

        // for(int i = 0; i < input.length; i++){
        int i = 0;
        System.out.println("-----------" + i + "-----------");
        System.out.println("st = " + input[i][0] + " d = " + input[i][1] + " expectedOut = " + input[i][2]);
        latch.getSt().update(input[i][0]);
        latch.getD().update(input[i][1]);
        latch.compute();
        
        System.out.println("Count = " + latch.getCount().getValue());
        System.out.println("Last = " + latch.getLast().getValue());
        System.out.println("Out = " + latch.getOut().getValue());

        Assertions.assertEquals(input[i][2], latch.getOut().getValue(), "expected out");
        // }
        i = 1;
        System.out.println("-----------" + i + "-----------");
        System.out.println("st = " + input[i][0] + " d = " + input[i][1] + " expectedOut = " + input[i][2]);
        latch.getSt().update(input[i][0]);
        latch.getD().update(input[i][1]);
        latch.compute();
        
        System.out.println("Count = " + latch.getCount().getValue());
        System.out.println("Last = " + latch.getLast().getValue());
        System.out.println("Out = " + latch.getOut().getValue());

        Assertions.assertEquals(input[i][2], latch.getOut().getValue(), "expected out");
        
        i = 3;
        System.out.println("-----------" + i + "-----------");
        System.out.println("st = " + input[i][0] + " d = " + input[i][1] + " expectedOut = " + input[i][2]);
        latch.getSt().update(input[i][0]);
        latch.getD().update(input[i][1]);
        latch.compute();
        
        System.out.println("Count = " + latch.getCount().getValue());
        System.out.println("Last = " + latch.getLast().getValue());
        System.out.println("Out = " + latch.getOut().getValue());

        Assertions.assertEquals(input[i][2], latch.getOut().getValue(), "expected out");

    }
}
