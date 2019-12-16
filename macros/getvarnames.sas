%macro getvarnames(dsid) / des = "Returns variable names in a dataset";
  %let dsid=%sysfunc(open(&dsid, i));
  %let num=%sysfunc(attrn(&dsid,nvars));
  %let varlist=;
  %do i=1 %to &num ;
    %let varlist=&varlist %sysfunc(varname(&dsid, &i));
  %end;
  %let rc = %sysfunc(close(&DSID));
 &varlist
%mend getvarnames;
