package processor.m500_memory;

// 8 bit
// input: d7-d0
// output: a7-a0

component Register {
    
    port in boolean st; 
    
    port in boolean d7;
    port in boolean d6;
    port in boolean d5;
    port in boolean d4;
    port in boolean d3;
    port in boolean d2;
    port in boolean d1;
    port in boolean d0;

    port in boolean cl;

    port out boolean a7;
    port out boolean a6;
    port out boolean a5;
    port out boolean a4;
    port out boolean a3;
    port out boolean a2;
    port out boolean a1;
    port out boolean a0;

    DFF dff7,dff6,dff5,dff4,dff3,dff2,dff1, dff0;

    st -> dff7.st;
    st -> dff6.st;
    st -> dff5.st;
    st -> dff4.st;
    st -> dff3.st;
    st -> dff2.st;
    st -> dff1.st;
    st -> dff0.st;

    d7 -> dff7.d;
    d6 -> dff6.d;
    d5 -> dff5.d;
    d4 -> dff4.d;
    d3 -> dff3.d;
    d2 -> dff2.d;
    d1 -> dff1.d;
    d0 -> dff0.d;

    cl -> dff7.cl;
    cl -> dff6.cl;
    cl -> dff5.cl;
    cl -> dff4.cl;
    cl -> dff3.cl;
    cl -> dff2.cl;
    cl -> dff1.cl;
    cl -> dff0.cl;

    dff7.out -> a7;
    dff6.out -> a6;
    dff5.out -> a5;
    dff4.out -> a4;
    dff3.out -> a3;
    dff2.out -> a2;
    dff1.out -> a1;
    dff0.out -> a0;
}