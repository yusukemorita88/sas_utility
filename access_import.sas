proc import out=<sas dataset name>
   datatable="<table_name>"
   dbms=access replace;
   database="<fullpath for *.accdb>";
   usedate=yes;
   scantime=no;
   dbsaslabel=none;
run;
