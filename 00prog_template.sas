/***********************************************************/
/*                                                         */
/* SAS program template                                    */
/* include other info about this progaram                   */
/*                                                         */
/***********************************************************/

/*===== SAS SETUP starts */

filename sassetup "./__123setup.inc";
%include sassetup;

/*===== SAS SETUP ends ====== */


/*--- OUR SESSION STARTS --- */

options nocenter;
ods _all_ close;
ods graphics off;

/*=== ODS Report initiated=== */                                              
ods html file = "00prog_template.html"     /* Name of the report. Should be derived from SAS prog name */
         path = "&repo_path.reports"       /* Path to `./reports` subfolder */
         ;

/* --- include ods_init: Basic info about SAS session. */
/* It will show up at the beginning of the ODS report */
%include ods_init;                         /* Recommended statement.  */

/*---  Dataset `classx` created for the analysis*/ 

data classx (label = "Derived from sashelp.class data");
  set sashelp.class (keep= weight height sex);
run;
 

Title "GLM: weight ~ height";
ods proclabel = "User proclabel";  /* Recommnded */
proc glm data = classx;
class sex(ref="M");
model weight = height sex height*sex /solution;
run;

ods html close;

/*--- cleanup ---*/
%delete_datasets(classx); /* Recommended */

