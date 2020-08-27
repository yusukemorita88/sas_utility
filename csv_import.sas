proc import out= csvdata
    datafile="fullpath for csv"
    dbms=csv replace;
    getnames=yes;
    datarow=2;
    guessingrows=200;
run; 
