%macro copy_work_datasets (outlib, selectedData) / des = "Copy selected work data to a permanent SAS library" ;

/* copies selected work data to outlib */
proc datasets lib = work nolist;
 copy out = &outlib memtype= data;
 select &selectedData;
run;
quit;


%mend copy_work_datasets;
