
filename extfiles pipe 'dir (fullpath) /b /s';

data dirfiles;
    infile extfiles truncover lrecl=65536;
    length fname $400;
    input  fname $400.;
run;

* extract csv files and store them into macro variables;
proc sql noprint;
    select count(*) into :csv_num trimmed
    from dirfiles
    where kindex(fname, ".csv") > 0;

    select fname
        into :csv1 - :csv&csv_num
    from dirfiles
    where kindex(fname, ".csv") > 0;
quit;
