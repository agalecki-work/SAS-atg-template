/*-- Typically, there is no need to modify this file --- */

title "SAS session info (Executed on &sysdate)";
proc odstext; 
p "Report created by &sas_progname..sas" / style=[color=red fontsize=15pt];
p "Repository name: &repo_name"; /* Repository name */
p "Repository description: &repo_description"; /* Provided in ...*/
p "Repository maintainer: &repo_maintainer";   /* ... `_2USER-assets-load.inc` */

*** p "Repo path: &repo_path"; /*--- Optional ---*/
p '';
p "Userid:                 &sysuserid";
p "Host:                   &SERVER_HOST";
p "SAS in batch mode?      &sas_batchmode";
p "SAS Version:            &SYSVLONG4";
p "OS:                     &SYSSCPL";
p "SAS Template Version:   &SAS_atgtmplt_ver";
run;






