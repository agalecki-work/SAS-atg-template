/*-- SAS code to be included at the beginning of possibly all SAS  programs */
/*-- Typically you do not make any changes below ----*/

%macro sas_session_info / des = "Defined in C:\Users\Public _01DAL_setup.sas" ;
/*---- Dec 2019  atg -----*/
 /* For Windows only. Can be easily adopted to UNIX */
 /* Get the Host Name and Port Number of the             */
 /* Stored Process Server that executed this request.    */

data _null_;
  format obparms $char1000.;
  obparms=getoption('objectserverparms');
  x1 = index(obparms,"port=");
  port = substr(obparms,x1+5);
  x1 = index(port," ");
  port = substr(port,1,x1);
  *** call symput('_PORT',trim(left(put(port,6.))));  
  host =sysget('COMPUTERNAME');    /* Use this statement on WINDOWS */
  /*  host =sysget('HOST'); */     /* Use this statement on UNIX    */
  call symput('server_host',trim(left(put(host,$80.)))); 
run;

/* sas_batchmode */

%if %length(%sysfunc(getoption(sysin))) > 0 %then  %let sas_batchmode=Y;
    %else %let sas_batchmode=N;;

/* sas_full program name */

%if &sas_batchmode=Y %then %let sas_fullname = %sysfunc(getoption(sysin));;
%if &sas_batchmode=N %then %do;
 %let sas_fullname = %sysget(SAS_EXECFILEPATH);
%end;


%*put sas_fullname := &sas_fullname;

%let sep_cnt=%sysfunc(count(&sas_fullname,%str(\)));
%*put sep_count := &sep_cnt;

%let sas_progname = %qscan(&sas_fullname, %eval(&sep_cnt+1),%str(\));

data _null_;
  length sas_fullname sas_progpath $ 300;
  sas_fullname = symget('sas_fullname');
  sas_progname = symget('sas_progname');
  
  sep_cnt      = input(symget('sep_cnt'), 5.);
  call scan(sas_fullname, sep_cnt+1, pos, len,'\'); 
  drop len;
  sas_progpath = substr(sas_fullname, 1, pos-1);
  call symput ('sas_progpath', strip(sas_progpath));  /* SAS program path */
  call symput ('sas_progname', scan(strip(sas_progname),1, '.'));   /* Remove . sas from the name */
run;

%let repo_path = &sas_progpath;

%put ==== Macro sas_session_info executed ======;
%put SAS_atg_tmplt_version   := &SAS_atgtmplt_ver;
%put server_host             := &server_host;       
%put sas_batchmode           := &sas_batchmode;
%put sas_fullname            := &sas_fullname;
%put repo_path               := &repo_path;
%put sas_progpath            := &sas_progpath;
%put sas_progname            := &sas_progname;
%*** put perl_path             := &perl_path;
%*** put dir_dot               := &dir_dot;
%*** put project_name          := &project_name;
%*** put perl_data_path        := &perl_data_path;
%put ==== Macro sas_session_info ended ======;
%mend sas_session_info;

/*========== Execution starts ====*/

/* global macro variables declared */
%global
        server_host sas_batchmode
        repo_path 
        sas_progname 
 ;
%sas_session_info;

/* Load SAS fcmp function definitions */
filename f_fcmp "&repo_path.fcmp/_load_fcmp.inc";
%include f_fcmp;


/* Load SAS macros definitions */
filename f_macros "&repo_path.macros/_load_macros.inc";
%include f_macros;



