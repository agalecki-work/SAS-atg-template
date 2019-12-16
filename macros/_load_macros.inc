/* File is used to load SAS macros stored in this directory. */
/*  It requires macro `repo_path` to be defined ---*/

%let tmp = &repo_path.macros/;

filename ff "&tmp.attrn_nlobs.sas";
%include ff;

filename ff "&tmp.attrn_nvars.sas";
%include ff;

filename ff "&tmp.copy_work_datasets.sas";
%include ff;

filename ff "&tmp.delete_datasets.sas";
%include ff;

filename ff "&tmp.export_toDMBS.sas";
%include ff;

filename ff "&tmp.getvarnames.sas";
%include ff;

filename ff "&tmp.import_fromDBMS.sas";
%include ff;

filename ff "&tmp.library_datainfo.sas";
%include ff;

/*--- cleanup -----*/
%symdel tmp;