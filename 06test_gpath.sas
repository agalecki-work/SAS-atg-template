/* see http://support.sas.com/rnd/app/ODSGraphics/papers/overview_odsgraphics_94.pdf */
/* Program illustrates how to redirect graphics to .graphics folder */
/* important for SAS executed in a batch mode */

/*===== SAS SETUP starts */

/* Auto executed. Note the location of the file*/
filename setupc   "C:/Users/Public/__sas_session_info.sas";
%include setupc;

filename sassetup "&repo_path.__123setup.inc";
%include sassetup;

/*===== SAS SETUP ends ====== */

/*--- OUR SESSION STARTS --- */

options nocenter;
ods listing close;


ods html file  = "06test-gpath.html"
         path  = "&repo_path.reports/"
         gpath = "&repo_path.reports/graphs/"  (url="./graphs/")
         style = Analysis
;
%include ods_init; /* Basic info about SAS session */
ods graphics on / imagefmt = png imagename="&sas_progname"; /* enable graphics */

Title "Weight ~ Height"; 
proc reg data=sashelp.Class;
model Weight=Height;
quit;

ods graphics off;
ods html close;
