%macro library_datainfo(libname, 
       outdata = _lib_data_names _lib_var_names,
       print = Y Y
       ) / des = "Basic info on datasets/variables in a SAS library";

%local dtnms vrnms prnt1 prnt2;
%let dtnms = %scan(&outdata,1);
%let vrnms = %scan(&outdata,2);
%if %length(&dtnms) =0 %then %let dtnms =_lib_data_names;;
%if %length(&vrnms) =0 %then %let vrnms =_lib_var_names;;
%let prnt1 =%scan(&print,1);
%let prnt2 =%scan(&print,2);
%if %length(&prnt1)= 0 %then %let prnt1 = Y;;

%if %length(&prnt2)= 0 %then %let prnt2 = N;;

%put  ====  Macro library_datainfo execution starts  ====;
%put SAS library name := &libname;

data &dtnms(label = "Dataset names in &libname SAS library");
 set SASHELP.VTABLE(where = (libname = upcase("&libname")));
run;

data &vrnms(label = "Variable names in &libname SAS library");;
 set SASHELP.VCOLUMN(where = (libname = upcase("&libname")));
run;


%if %upcase(&prnt1) = Y %then %do;

Title "List of datasets in &libname SAS library";
proc print data = &dtnms;
var libname memname crdate nobs nvar memlabel;
run;
%end;

%if %upcase(&prnt2) = Y %then %do;

Title "List of variables in &libname SAS library";
proc print data= &vrnms;
var libname memname varnum name type length label format informat sortedby; 
run;
%end;
%put  -----  Macro library_datainfo execution ends ----;

%mend library_datainfo;