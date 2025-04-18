package processor.m100_logicGates;

component TriGate{

    port in boolean di7, di6,di5,di4,di3,di2,di1,di0;

    port in boolean en;

    port out boolean do7,do6,do5,do4,do3,do2,do1,do0;

    TriState ts7,ts6,ts5,ts4,ts3,ts2,ts1,ts0;

    en -> ts7.en;
    en -> ts6.en;
    en -> ts5.en;
    en -> ts4.en;
    en -> ts3.en;
    en -> ts2.en;
    en -> ts1.en;
    en -> ts0.en;

    di7 -> ts7.in;
    di6 -> ts6.in;
    di5 -> ts5.in;
    di4 -> ts4.in;
    di3 -> ts3.in;
    di2 -> ts2.in;
    di1 -> ts1.in;
    di0 -> ts0.in;

    ts7.out -> do7;
    ts6.out -> do6;
    ts5.out -> do5;
    ts4.out -> do4;
    ts3.out -> do3;
    ts2.out -> do2;
    ts1.out -> do1;
    ts0.out -> do0;


}