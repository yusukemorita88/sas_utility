options nofmterr;

libname in v6 'fullpath for *.SD2' access=readonly;
libname out v9 'fullpath for *.sas7bdat';

proc copy inlib=in outlib=out;
run;
