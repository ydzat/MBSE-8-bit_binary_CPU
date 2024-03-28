package processor.m100_logicGates;



component NORGate {
    port in boolean a;
    port in boolean b;
    port out boolean out;
    compute { out = !(a || b); }
}