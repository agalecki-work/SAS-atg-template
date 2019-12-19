/* SAS options tentatively defined */
options nocenter date;

/*--- Additional global macro variables can be defined here ----*/
%global repo_description repo_maintainer;
%let repo_description = One line repository description (see _2USER-assets-load.inc file);
%let repo_maintainer = John Doe ;

/*--- Define SAS libraries in this repo---*/

libname datain "&repo_path.datain";         /* `./datain` folder */
libname datatest "&repo_path.datatest";     /* `./datatest` folder */
libname dataout "&repo_path.dataout";       /* `./dataout` folder */

/* SAS libraries external to this repository*/
*** libname bpcog "W:\Intmed_Rsrch2\GenMed\Restricted\BP COG\New Data 10-09-19 (MESA CHS)";