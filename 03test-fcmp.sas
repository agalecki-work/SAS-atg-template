/**********************************************/
/*                                            */
/*  Test functions/subroutines stored in ./FCMP folder     */
/*                                            */
/**********************************************/

/*===== SAS SETUP starts */

/* Auto executed. Note the location of the file*/
filename setupc   "C:/Users/Public/__sas_session_info.sas";
%include setupc;


filename sassetup "&repo_path.__123setup.inc";
%include sassetup;

/*===== SAS SETUP ends ====== */


/*--- OUR SESSION STARTS --- */

ods listing close;

ods html;  /* See `sashtml.htm` file for the output */
%include ods_init; /* Basic info about SAS session */

proc print data=sasuser.ufuncs;
run;


/*---  Datasets `classF`for testing FCMP fnctions*/ 

data classF (label = "Females from  sashelp.class data.");
  set sashelp.class;
  if sex = 'F';
  hm  = height*2.54/100;        /* height in meters */ 
  wkg = weight*0.453592;        /* Weight in kg */ 
  bmi = bmi(hm, wkg);           /* function bmi() */
  bsa = bsa(hm, wkg);           /* function bmi() */
run;

/* Bone Marrow Transplant Patients */
data bmt;
  set sashelp.BMT;
run;


proc print data=classF;
run;

/*-- Cleanup -- */



