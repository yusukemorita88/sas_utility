*windows10 + SAS9.4TS1M3;
proc import out = xlsdata
  datafile= "fullpath for xlsx file" 
  dbms=XLSX replace;
  range="Sheet1$A1:Z100";
  GETNAMES=YES;
run;
