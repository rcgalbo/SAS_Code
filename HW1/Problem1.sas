*****************************************************************************
* Programmed By:Rick Galbo                                                  *
* August 2015                                                               *
* Coded in SAS 9.2                                                          *
*                                                                           * 
*                                                                           *
*  These programs demonstrate how to imput data in various types of forms   * 
*  and do basic opperations such as printing and merging data               *
****************************************************************************;

/********************************************************************************
*Data step:  Data is over time period expressing subjects height and weight     *                                                                 * mice to complete a known maze pattern.                                         *
*                                                                               *
*  This step creates new variables and preform basic opperations on the data set*
*********************************************************************************/


Data training;
input SUBJ 1-3 HEIGHT 4-5 WT_INIT 6-8 WT_FINAL 9-11;

BMI_INIT = (WT_INIT / 2.2) / ((HEIGHT * 0.0254)**2);
BMI_FINAL = (WT_FINAL / 2.2) / ((HEIGHT * 0.0254)**2);
BMI_DIFF = BMI_FINAL - BMI_INIT;

Datalines;
00768155150
00272250240
00563240200
00170345298
;
run;
Proc Sort Data = training;
BY SUBJ;
run;

Proc print Data = training;
Title "Diet Data";
Var SUBJ HEIGHT BMI_INIT BMI_FINAL BMI_DIFF;
run;
