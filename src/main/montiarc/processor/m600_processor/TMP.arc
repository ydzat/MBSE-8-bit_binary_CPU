package processor.m600_processor;
component TMP {
    port in boolean in;
    port out boolean out;
    compute {
        out = in;
    }
}