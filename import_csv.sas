proc import out= csvdata
    datafile="fullpath for csv"
    dbms=csv replace;
    getnames=yes;
    datarow=2;
    guessingrows=max;
run; 
