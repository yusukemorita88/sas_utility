libname sas "<fullpath for the folder with sas-datasets>" access=readonly inencoding=any;
filename H "C:\tmp\filename.xlsx";

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
          outfile= H
          replace;
          sheet="&&ds&i.";
    run;
%end;

%mend;

%sas2xlsx;
