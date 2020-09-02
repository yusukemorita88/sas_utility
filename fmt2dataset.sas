proc format;
    value YN
        0 = "No"
        1 = "Yes"
    ;
    value $YNC
        "Y" = "YES"
        "N" = "NO"
    ;
run;

proc format lib=WORK cntlout=WORK.FMTDS;
run;
