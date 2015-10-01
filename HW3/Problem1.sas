/*
 * ----ASSIGMENT_3---------
 * Author: Rick Galbo
 * Assigment: 3
 * Probleml:  1
 * Date: Octobre 1, 2015
 * SAS303 - FALL 2015
 */

*import reading data;
Data READING;
input SYS $ SCORE @@;
DIFF = SMITH - CODY;
Datalines;
CODY 500 CODY 450 CODY 505 CODY 404 CODY 555 CODY 567 CODY 588 CODY 577 CODY 566 CODY 644 CODY 511 CODY 522 CODY 543 CODY 578
SMITH 355 SMITH 388 SMITH 440 SMITH 600 SMITH 510 SMITH 501 SMITH 502 SMITH 489 SMITH 499 SMITH 489 SMITH 515 SMITH 520 SMITH 520 SMITH 480
;
ODS RTF file = "HW3-1.rtf";
/*check for statistically significant evidence to suggest that \
the means of the tests are different.
Ho : mu-SMITH - mu-CODY = 0
Ha : mu-SMIRH - mu-CODY != 0*/;
Proc Ttest;
Class SYS;
var SCORE;
run;


/*check for difference in means using Wilcoxon Signed-Rank Test
Ho: The distributions of studens on both plans are the same
Ha: The distributions of the separate plans have different distributions*/

proc npar1way wilcoxon;
class SYS;
var SCORE;
run;
ODS RTF CLOSE;
