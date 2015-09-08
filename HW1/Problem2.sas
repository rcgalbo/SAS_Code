*****************************************************************************
* Programmed By:Rick Galbo                                                  *
* August 2015                                                               *
* Coded in SAS 9.2                                                          *
*                                                                           * 
*                                                                           *
*  These programs demonstrate how to imput data in various types of forms   * 
*  and do basic opperations such as printing and merging data               *
****************************************************************************;

/*	Data step includes importing table 
	Var: Last Name/First Name/Sex/Military Branch/Years of Service
*/

*assigns working directory;
libname hwd "P:\STAT303\SAS_Code\HW1\DATA";

*Data input and normal print;
Data hwd.service;
infile "P:\STAT303\SAS_Code\HW1\DATA\MilitaryService.txt" DLM = '/';
input LAST $ FIRST $ SEX $ BRANCH $ YEARS;
run;

Proc print Data = hwd.service;
Title 'Service Records';
run;

*Sorted print out of service members;
Proc sort Data = hwd.service;
By BRANCH;
RUN;

Proc print Data = hwd.service;
Title 'Service Records (By Branch)';
ID BRANCH;
Var LAST SEX YEARS
run;

*average years served per branch;
Proc Means Data = hwd.service;
Var BRANCH;
run;
