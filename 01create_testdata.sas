/***********************************************************/
/*                                                         */
/* creates data for testing and stores them in `testdata`  */
/*    folders                                              */                 
/*                                                         */
/***********************************************************/

/*===== SAS SETUP starts */
/* Auto executed. Note the location of the file*/
filename setupc   "C:/Users/Public/__sas_session_info.sas";
%include setupc;

filename sassetup "./__123setup.inc";
%include sassetup;

/*===== SAS SETUP ends ====== */


/*--- OUR SESSION STARTS --- */

options nocenter;
ods _all_ close;

/*=== ODS Report initiated=== */                                              
ods html;

/* --- include ods_init: Basic info about SAS session. */
/* It will show up at the beginning of the ODS report */
%include ods_init;                         /* Recommended statement.  */

/*---  Dataset `classx` created for testing ----*/ 

data classx (label = "Derived from sashelp.class data");
  set sashelp.class (keep= weight height sex);
run;

/* Bone Marrow Transplant Patients */
data bmt(label = "Bone Marrow Transplant data");
  set sashelp.BMT;
run;


%copy_work_datasets(datatest, classx bmt);
%library_datainfo(datatest); /* Info on datasets in `datatest` library */
ods html close;
