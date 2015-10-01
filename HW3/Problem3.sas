/*
 * ----ASSIGMENT_3---------
 * Author: Rick Galbo
 * Assigment: 3
 * Probleml:  3
 * Date: Octobre 1, 2015
 * SAS303 - FALL 2015
 */

*import aresnic data;
Data ARSENIC;
input LEVELS;
datalines;
10.622  
10.262  
10.876  
9.487  
9.774  
10.213  
10.157  
9.556  
9.667  
10.809  
10.624  
10.588
;

/*one sided T-test
Ho: mu-Ar = 10ppb
Ha: mu-Ar > 10pbb
*/
ODS RTF file = "HW3-3.rtf";
Proc ttest h0= 10;
var LEVELS;
run;
ODS RTF CLOSE;


