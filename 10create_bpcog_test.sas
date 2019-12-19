/************************************************/
/* 10create_bpcog.sas, Dec. 2019                  */ 
/* See RTW email:  BP COG Master  Dec. 4th, 2019   */
/* Illustrates possible structure of master BP-COG data */
/************************************************/
/*===== SAS SETUP starts */

/* Auto executed. Note the location of the file*/
filename setupc   "C:/Users/Public/__sas_session_info.sas";
%include setupc;


filename sassetup "&repo_path.__123setup.inc";
%include sassetup;

/*===== SAS SETUP ends ====== */



/*--- OUR SESSION STARTS --- */

ods listing close;   
ods html;/* See sashtml.htm file for the output */
%include ods_init; /* Basic info about SAS session */


%let csv_path = &repo_path.datatest-csv/;


Title  "Data bpcog_1rps: one row per subject(n=4).";
Title2 "Key vars: newid";
data bpcog_1rps(label= "bpcog_1rps: One row per subject");

/* subject A */
 newid = "A";
 age_visit1 = 45;
 sex = "F";
 output;
 
/* subject B */
  newid = "B";
  age_visit1 = 55;
  sex = "M";
 output;
 
/* subject C */
   newid = "C";
   age_visit1 = 65;
   sex = "M";
  output;
  
/* subject E */
   newid = "E";
   age_visit1 = 75;
   sex = "M";
  output;
run;

proc print data = bpcog_1rps;
run;

%let csvfile =&csv_path.bpcog_1rps.csv;/* Path to csv file */
%_export2csvfile(bpcog_1rps, &csvfile); 


Title "Data: bpcog_visits (n=27). Key vars: newid, visitcounter";

data bpcog_visits (label ="bpcog_visits: Multiple rows per subject" );;

  /* A */
  array da {7} _temporary_ (0 2660 4484 5723 7935 8887 8987);
  newid = "A";
  do visitcounter =1 to 7;
   daysfromv1 = da[visitcounter];
   output;
  end;
  
  /* B */
    array db {8} _temporary_ (0 2948 4688 5799 5799 7455 13957 15525); /* Note: 5799 repeated twice */ 
    newid = "B";
    do visitcounter =1 to 8;
     daysfromv1 = db[visitcounter];
     output;
  end;
  
  /* C */
    array dc {7} _temporary_ (0 5167 4484 5723 7935 8887 8987);
    newid = "C";
    do visitcounter = 1 to 7;
     daysfromv1 = dc[visitcounter];
     output;
    end;
  
  /* E */
      array dd {5} _temporary_ (0 5167 4484 5723 7935);
      newid = "E";
      do visitcounter = 1 to 5;
       daysfromv1 = dc[visitcounter];
       output;
    end;
  run;
  
 proc print data =bpcog_visits;
 run;
 
%let csvfile =&csv_path.bpcog_visits.csv;/* Path to csv file */
%_export2csvfile(bpcog_visits, &csvfile); 



Title "Subjects with stroke events. Key vars: newid, stroke_counter";
/* subjects with stroke events */
data bpcog_stroke_events;
  newid = "A";
  array sa {4}  _temporary_ (8762 9716 9728 11249);
  array sat {4} _temporary_ (1 1 1 1);
  do strk_counter = 1 to dim(sa);
   strk_daysfromv1 = sa[strk_counter];
   strk_type = sat[strk_counter];
   output;
  end;
  
  newid = "B";
    array sb {3}  _temporary_ (13417 13552 14281);
    array sbt {3} _temporary_ (1 2 2);
    do strk_counter = 1 to dim(sb);
     strk_daysfromv1 = sb[strk_counter];
     strk_type = sat[strk_counter];
     output;
  end;
run;

 proc print data =bpcog_stroke_events;
  run;
  
%let csvfile =&csv_path.bpcog_stroke_events.csv;/* Path to csv file */
%_export2csvfile(bpcog_stroke_events, &csvfile); 

 
Title "Subjects with CVD events. Key vars: newid, CVD_counter";
/* subjects with CVD events */
data bpcog_CVD_events;
  newid = "C";
  array sc {2}  _temporary_ (9659 9758);
  array sct {4} _temporary_ (1 1 1 1);
  do CVD_counter = 1 to dim(sc);
   CVD_daysfromv1 = sc[CVD_counter];
   CVD_type = sct[CVD_counter];
   output;
  end;
  
  newid = "E";
    array se {1}  _temporary_ (13552);
    array set {1} _temporary_ (1);
    do CVD_counter = 1 to dim(se);
     CVD_daysfromv1 = se[cvd_counter];
     CVD_type = set[cvd_counter];
     output;
  end;
run;

 proc print data =bpcog_CVD_events;
  run;

 proc export data = bpcog_CVD_events
 
 outfile="&csv_path.bpcog_CVD_events.csv" dbms =csv
 
 replace;
 
 run;
 
/* copies selected `work` datasets to `datatest` library*/
proc datasets lib = work nolist;
 copy out = datatest  memtype= data;
 select bpcog_1rps bpcog_visits bpcog_stroke_events bpcog_cvd_events;
run;
quit;

%library_datainfo(datatest);


