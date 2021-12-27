libname sas "specify your sas7bdat folder" access=readonly inencoding=any;

%macro sas2xlsx;

proc sql noprint;
    /* store number of datasets */
    select count(*) into :nobs trimmed
    from dictionary.tables
    where libname = "SAS";

    /* store the name of datasets */
    select lowcase(memname)
    into :ds1 - :ds&nobs.
    from dictionary.tables
    where libname = "SAS";
quit;

/*convert sas to xlsx */
%do i = 1 %to &nobs.;
    proc export 
          data=sas.&&ds&i.
          dbms=xlsx 
          outfile=".\xlsx\&&ds&i...xlsx" /*specify output folder*/
          replace;
    run;
%end;

%mend;

%sas2xlsx;
