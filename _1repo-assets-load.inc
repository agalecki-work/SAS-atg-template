/*-- SAS code to be included at the beginning of SAS program */
/*-- Typically you do not make any changes below ----*/


/*========== Execution starts ====*/


/* Load SAS fcmp function definitions */
filename f_fcmp "&repo_path.fcmp/_load_fcmp.inc";
%include f_fcmp;


/* Load SAS macros definitions */
filename f_macros "&repo_path.macros/_load_macros.inc";
%include f_macros;



