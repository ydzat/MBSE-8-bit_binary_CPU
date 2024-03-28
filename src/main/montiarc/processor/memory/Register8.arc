package processor.memory;

component Register8{

    port in boolean x7,x6,x5,x4,x3,x2,x1,x0;
    port in boolean st,cl;
    port out boolean a7,a6,a5,a4,a3,a2,a1,a0;

    DFF dff7,dff6,dff5,dff4,dff3,dff2,dff1,dff0;

    cl -> dff7.cl;
    cl -> dff6.cl;
    cl -> dff5.cl;
    cl -> dff4.cl;
    cl -> dff3.cl;
    cl -> dff2.cl;
    cl -> dff1.cl;
    cl -> dff0.cl;

    st -> dff7.st;
    st -> dff6.st;
    st -> dff5.st;
    st -> dff4.st;
    st -> dff3.st;
    st -> dff2.st;
    st -> dff1.st;
    st -> dff0.st;

    x7 -> dff7.d;
    x6 -> dff6.d;
    x5 -> dff5.d;
    x4 -> dff4.d;
    x3 -> dff3.d;
    x2 -> dff2.d;
    x1 -> dff1.d;
    x0 -> dff0.d;

    dff7.out -> a7;
    dff6.out -> a6;
    dff5.out -> a5;
    dff4.out -> a4;
    dff3.out -> a3;
    dff2.out -> a2;
    dff1.out -> a1;
    dff0.out -> a0;

}