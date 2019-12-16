%macro _export2dbmsfile(data, outfile, dbms) / des = "Exports to DBMS data file"; 

%*** Call: %_export2dbmsfile(lib.bpcpg_1rps, ./data/bpcog_1rps.csv,  CSV) ;

proc export 
 data = &data
 outfile  = "&outfile"
 dbms = &dbms
 replace
 ;
run;
%mend _export2dbmsfile;


%macro _export2csvfile(data, csvfile) / des = "Exports to CSV data file"; 

%*** Call: %_export2csvfile(lib.bpcpg_1rps, ./data/bpcog_1rps.csv) ;

proc export 
 outfile = "&csvfile"
 data    = &data
 dbms    = CSV
 replace
 ;
run;
%mend _export2csvfile;

