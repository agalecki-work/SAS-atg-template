/*-- You are welcome to modify this file  */
/* Include it from any SAS program by using statement: ---*/


title "SAS session info (on &sysdate)";
proc odstext; 
p "Report created by &sas_progname..sas" / style=[color=red fontsize=15pt];
p "Repository description: &repo_description";
p "Repository maintainer: &repo_maintainer";

*** p "Repo path: &repo_path";
p '';
p "Userid:                 &sysuserid";
p "Host:                   &SERVER_HOST";
p "SAS in batch mode?      &sas_batchmode";
p "SAS Version:            &SYSVLONG4";
p "OS:                     &SYSSCPL";
p "SAS Template Version:   &SAS_atgtmplt_ver";
run;






