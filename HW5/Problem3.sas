/*----ASSIGMENT_5---------
 * Author: Rick Galbo
 * Assigment: 5
 * Probleml:  3
 * Date: October 28, 2015
 * SAS303 - FALL 2015 */

/*A) i)Create count variable ii)Create double count*/
Data ASTHMA;
Input ASTHMA $ HAS $ COUNT TOTAL;
DOUBLE_COUNT = 2*COUNT;
Datalines;
LowSES yes 40 140
LowSES no 100 140
HighSES yes 30 160
HighSES no 130 160
;


/*B) f)preform a chi-square test
Ho: There is no relationship between SES and asthma
Ha: There is some kind of relationship between SES and asthma*/
Proc freq Data=asthma order=data;
Table ASTHMA * HAS / CHISQ CMH DEVIATION EXPECTED nocol norow nopercent;
Weight COUNT;
run;

/* g)Conclusion at 0.05% is that we can reject the null hyp with a pval of 0.0448
and a test statistic of 4.0262. There is a depencedncy between SES and ASTHMA

h)Calculating relative risk ratio

P1 = P(Asthma | LowSES) 40/140 = 0.2858
P2 = P(Asthma | HighSES)30/160 = 0.1875

Rel Risk = P1/P2 = 0.2858/0.1875 = 1.5238 times higher chance of asthma given
 a low SES


C)Chi-Square with doublecount
*/
Proc freq Data=asthma order=data;
Table ASTHMA * HAS / CHISQ CMH DEVIATION EXPECTED nocol norow nopercent;
Weight DOUBLE_COUNT;
run;
/*l)The test statistic value is twice as large as the normal count and the pvalue
is much smaller */



