/*----  Loading macro definitions and other assets stored in repository --- */
/*--- Macro variables: sas_batchmode, sas_fullname created in C:/Users/Public/_repo_autoexec.sas ---*/

%let  SAS_atgtmplt_ver = V0.1-19DEC2019;  /* SAS-atg-template version */


/* working path for my projects (requires SAS9.4T1M4 */
%*** let rc = %sysfunc(dlgcdir("&repo_path"));

filename fnm  "&repo_path._1repo-assets-load.inc";
%include fnm;

/*---- Loading macro definitions and other assets defined by the user ---- */
filename fnm  "&repo_path._2user-assets-load.inc";
%include fnm;

/*---- NOTE: Include `ods_init` fileref in SAS program after ods destination is opened */
filename ods_init  "&repo_path._3prog-ods-init.inc"; 


