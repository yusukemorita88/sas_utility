libname sdtm "fullpath" access = readonly inencoding=any;

proc sql;
    /* create table varspec as *if you need spec as a dataset;*/
    select memname, name, label, type, length, format, informat
    from dictionary.columns
    where libname = "SDTM" and name in ("USUBJID", "VISIT")
    order by name, memname;
quit;

