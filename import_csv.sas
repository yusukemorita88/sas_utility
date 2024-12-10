*pecifies whether all columns default to a CHAR data type to avoid misinterpretation of a SAS datetime. ;
*Beginning in SAS 9.4TS1M4, you can specify the EFI macro variable, EFI_ALLCHARS, ;
*which causes PROC IMPORT to define all of the variables as character. ;
%let EFI_ALLCHARS=YES;

proc import out= csvdata
    datafile="fullpath for csv"
    dbms=csv replace;
    getnames=yes;
    datarow=2;
    guessingrows=max;
run; 
