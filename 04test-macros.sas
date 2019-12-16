/**********************************************/
/*                                            */
/*  Test macros stored in ./macros folder     */
/*  datatest.BMT is needed                    /
/*                                            */
/**********************************************/

/*===== SAS SETUP starts */

/*----  Loading macro definitions and other assets stored in repository---- */
filename sassetup "./__123setup.inc";
%include sassetup;

/*===== SAS SETUP ends ====== */


/*--- OUR SESSION STARTS --- */

ods listing close;

ods html;  /* See `sashtml.htm` file for the output */
%include ods_init; /* Basic info about SAS session */



/* === attrn_nlobs and attrn_nvars macros tested === */
%let nobs = %attrn_nlobs(bmt, libname = datatest);  /* # obs in datasest  `datatest.bmt` */
%let nvars =%attrn_nvars(bmt, libname = datatest);  /* # vars in datasest `bmt` */

/* getvarnames macro tested */
%let vnms = %getvarnames(datatest.bmt);


Title  "Data: BMT (on &sysdate)";
title2 "Nobs= &nobs.. Nvars = &nvars"; 
title3 "Varnames are: &vnms";
proc print data = BMT;
run;

ods html close;

/*-- Cleanup -- */

/*==== Delete selected data from `WORK` SAS library ===*/
%delete_datasets(BMT);  /* optional */ 



