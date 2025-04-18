package processor.m600_processor;

component DelayOut{

    port in boolean ain7,ain6,ain5,ain4,ain3,ain2,ain1,ain0;
    port in boolean din7,din6,din5,din4,din3,din2,din1,din0;
    port in boolean sain7,sain6,sain5,sain4,sain3,sain2,sain1,sain0;

    port <<delayed>> out boolean a7,a6,a5,a4,a3,a2,a1,a0;
    port <<delayed>> out boolean d7,d6,d5,d4,d3,d2,d1,d0;
    port <<delayed>> out boolean sa7,sa6,sa5,sa4,sa3,sa2,sa1,sa0;

    automaton {
        initial {
            a7 = false;
            a6 = false;
            a5 = false;
            a4 = false;
            a3 = false;
            a2 = false;
            a1 = false;
            a0 = false;

            d7 = false;
            d6 = false;
            d5 = false;
            d4 = false;
            d3 = false;
            d2 = false;
            d1 = false;
            d0 = false;

            sa7 = false;
            sa6 = false;
            sa5 = false;
            sa4 = false;
            sa3 = false;
            sa2 = false;
            sa1 = false;
            sa0 = false;

        }state S;

        S -> S / {
            a7 = ain7;
            a6 = ain6;
            a5 = ain5;
            a4 = ain4;
            a3 = ain3;
            a2 = ain2;
            a1 = ain1;
            a0 = ain0;

            d7 = din7;
            d6 = din6;
            d5 = din5;
            d4 = din4;
            d3 = din3;
            d2 = din2;
            d1 = din1;
            d0 = din0;

            sa7 = sain7;
            sa6 = sain6;
            sa5 = sain5;
            sa4 = sain4;
            sa3 = sain3;
            sa2 = sain2;
            sa1 = sain1;
            sa0 = sain0;
        };
    }

}