%let ascfolder = %nrstr(/*fullpath for ascii files(*.asc) */);

%macro asc2sas(filename);

    proc import out= &filename.
        datafile="&ascfolder.\&filename..asc"
        dbms=csv replace;
        getnames=no;
        datarow=1;
        guessingrows=100000;
        delimiter="$";
    run; 

%mend;

%asc2sas(filename=llt);
%asc2sas(filename=llt_j);
%asc2sas(filename=pt);
%asc2sas(filename=pt_j);
%asc2sas(filename=soc);
%asc2sas(filename=soc_j);

proc sql noprint;
    create table llt2  as
        select L.*, R.VAR2 as llt_j, R.VAR3 as currency_j
        from llt as L
        inner join llt_j as R 
        on L.VAR1 = R.VAR1
    ;        
    ;
    create table llt_pt as
        select L.VAR1 as llt_code, L.VAR2 as llt , L.llt_j, L.VAR10 as currency, L.currency_j, L.VAR3 as pt_code, R.VAR2 as pt, R.VAR4 as soc_code
        from llt2 as L
        inner join pt as R 
        on L.VAR3 = R.VAR1
    ;
    create table llt_pt_j as
        select L.*, R.VAR2 as pt_j
        from llt_pt as L
        inner join pt_j as R 
        on L.pt_code = R.VAR1
    ;
    create table llt_pt_j_soc as
        select L.*, R.VAR2 as soc
        from llt_pt_j as L
        inner join soc as R 
        on L.soc_code = R.VAR1
    ;
    create table meddra as
        select L.*, R.VAR2 as soc_j
        from llt_pt_j_soc as L
        inner join soc_j as R 
        on L.soc_code = R.VAR1
    ;
quit;


libname save ".";

data save.meddra;
    set meddra;
run;

