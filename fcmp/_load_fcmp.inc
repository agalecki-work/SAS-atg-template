/* File is used to load SAS FCMP functions stored in this directory. */
/*  It requires macro `repo_path` to be defined ---*/

%let tmp = &repo_path.fcmp/;

filename ff "&tmp.funcs.sas";
%include ff;


/*--- cleanup -----*/
%symdel tmp;