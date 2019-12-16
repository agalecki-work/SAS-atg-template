%macro delete_datasets(selectData, lib = WORK) / des ="Deletes selected datsets from a SAS library" ;
proc datasets lib=&lib nolist;
 delete &selectData / memtype = DATA;
quit;
run;
%mend delete_datasets;