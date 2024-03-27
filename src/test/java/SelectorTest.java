/*
 * Created on Tue Mar 26 2024
 *
 * Copyright (c) 2024 Xiangyu Tong
 */
import processor.switching.Selector;
import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.params.ParameterizedTest;
import org.junit.jupiter.params.provider.Arguments;
import org.junit.jupiter.params.provider.MethodSource;

import org.junit.jupiter.api.Test;

import java.util.stream.Stream;
public class SelectorTest {
    private Selector sel;

    @BeforeEach
    void setUp() {
        sel = new Selector();
        sel.setUp();
        sel.init();
    }

    @Test
    void testSelector() {
        sel.getS().update(false);
        sel.getD1().update(true);
        sel.getD0().update(true);
        sel.compute();

        System.out.println("Out = " + sel.getOut().getValue());
        Assertions.assertEquals(true, sel.getOut().getValue(), "expected out");
    }
}
