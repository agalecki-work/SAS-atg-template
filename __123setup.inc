/*----  Loading macro definitions and other assets stored in repository---- */

%let  SAS_atgtmplt_ver = V0.01-14DEC2019; /* SAS-atg-template version */

filename fnm  "./_repo-assets-load.inc";
%include fnm;

/*---- Loading macro definitions and other assets defined by the user ---- */
filename fnm  "&repo_path._user-assets-load.inc";
%include fnm;

/*---- NOTE: Include `ods_init` fileref in SAS program after ods destination is opened */
filename ods_init  "&repo_path._prog-ods-init.inc"; 
