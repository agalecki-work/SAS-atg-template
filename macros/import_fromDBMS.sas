%macro _import_dbmsdata(datafile, dataout, dbms) / des = "Imports from DBMS data file"; 

%*** Call: %_import_data(./data/bpcog_1rps.csv, lib.bpcpg_1rps, CSV) ;

proc import datafile = "&datafile"
 out  = &dataout
 dbms = &dbms
 ;
run;
%mend _import_dbmsdata;


%macro _import_csvdata(csvfile, dataout) / des = "Imports from CSV data file"; 

%*** Call: %_import_csvdata(./data/bpcog_1rps.csv, lib.bpcpg_1rps) ;

proc import datafile = "&csvfile"
 out = &dataout
 dbms = CSV
 ;
run;
%mend _import_csvdata;

