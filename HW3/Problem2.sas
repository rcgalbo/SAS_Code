/*
 * ----ASSIGMENT_3---------
 * Author: Rick Galbo
 * Assigment: 3
 * Probleml:  2
 * Date: Octobre 1, 2015
 * SAS303 - FALL 2015
 */

Data DIET;
input BA $ WEIGHT @@;
datalines;
B 300 B 350 B 190 B 400 B 244 B 321 B 330 B 250 B 190 B 160 B 260 B 240
A 290 A 331 A 200 A 395 A 240 A 300 A 332 A 242 A 185 A 158 A 256 A 220
;

ODS RTF file = "HW3-2.rtf";
/*
T-test hypothesis
Ho : mu-before = mu-after 
Ha : mu-before != mu-after*/;
Proc Ttest;
CLASS BA;
var WEIGHT;
run;

/*
Wilcoxon Sum-Rank Hypothesis
Ho: There is no difference between the means 
Ha: There is a differenc in sample means between variables*/

proc npar1way wilcoxon;
class BA;
var WEIGHT;
run;

ODS RTF CLOSE;
