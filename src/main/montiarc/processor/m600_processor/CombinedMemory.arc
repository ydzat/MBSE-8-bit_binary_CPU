
package processor.m600_processor;
import processor.m000_circuits.AlwaysTrue;
import processor.m500_memory.Register;
import processor.m500_memory.RAM8;

component CombinedMemory {

    port in boolean a, d, sa, cl;
    port in boolean x7,x6,x5,x4,x3,x2,x1,x0;
    port out boolean a7,a6,a5,a4,a3,a2,a1,a0;
    port out boolean d7,d6,d5,d4,d3,d2,d1,d0;
    port out boolean sa7,sa6,sa5,sa4,sa3,sa2,sa1,sa0;

    RAM8 ram;
    Register register_a;
    Register register_d;
    AlwaysTrue t;

    a -> register_a.st;
    x7 -> register_a.d7;
    x6 -> register_a.d6;
    x5 -> register_a.d5;
    x4 -> register_a.d4;
    x3 -> register_a.d3;
    x2 -> register_a.d2;
    x1 -> register_a.d1;
    x0 -> register_a.d0;
    cl -> register_a.cl;
    t.out -> register_a.w;
    t.out -> register_a.r;

    d -> register_d.st;
    x7 -> register_d.d7;
    x6 -> register_d.d6;
    x5 -> register_d.d5;
    x4 -> register_d.d4;
    x3 -> register_d.d3;
    x2 -> register_d.d2;
    x1 -> register_d.d1;
    x0 -> register_d.d0;
    cl -> register_d.cl;
    t.out -> register_d.w;
    t.out -> register_d.r;

    sa -> ram.st;
    x7 -> ram.d7;
    x6 -> ram.d6;
    x5 -> ram.d5;
    x4 -> ram.d4;
    x3 -> ram.d3;
    x2 -> ram.d2;
    x1 -> ram.d1;
    x0 -> ram.d0;

    register_a.a0 -> ram.ad0;
    register_a.a1 -> ram.ad1;
    register_a.a2 -> ram.ad2;
    cl -> ram.cl;

    register_a.a7 -> a7;
    register_a.a6 -> a6;
    register_a.a5 -> a5;
    register_a.a4 -> a4;
    register_a.a3 -> a3;
    register_a.a2 -> a2;
    register_a.a1 -> a1;
    register_a.a0 -> a0;

    register_d.a7 -> d7;
    register_d.a6 -> d6;
    register_d.a5 -> d5;
    register_d.a4 -> d4;
    register_d.a3 -> d3;
    register_d.a2 -> d2;
    register_d.a1 -> d1;
    register_d.a0 -> d0;

    ram.a7 -> sa7;
    ram.a6 -> sa6;
    ram.a5 -> sa5;
    ram.a4 -> sa4;
    ram.a3 -> sa3;
    ram.a2 -> sa2;
    ram.a1 -> sa1;
    ram.a0 -> sa0;

}