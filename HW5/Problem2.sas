/*----ASSIGMENT_5---------
 * Author: Rick Galbo
 * Assigment: 5
 * Probleml:  2
 * Date: October 28, 2015
 * SAS303 - FALL 2015


A)CHI-Square val, expected and sd*/
Data crime;
input CRIME $ ALC $ COUNT;
total = Drinker + NonDrinker;
Datalines;
Arson yes 50
Arson no 43
Rape yes 88
Rape no 62
Violence yes 155
Violence no 110
Stealing yes 379 
Stealing no 300
Coining yes 18
Coining no 14
Fraud yes 63
Fraud no 144
;

Proc Freq data=crime order=data;
TABLES CRIME*ALC /CHISQ DEVIATION EXPECTED nopercent norow nocol;
Weight COUNT;
RUN;

/*B)
Ho: The experimental data doesnt show a dependency between CRIME and ALC

Ha: The experimental data shows that there is a dependency between CRIME and ALC

C) The conclusion at 0.05% significance level is that we reject the null hypothisis
givin the p-val of <.0001 and a test statistic 49.7306. Given this rejection
we can say that there is a dependecy between CRIME and ALC 

D)Based on the data it appears that drinkers do commit more crimes on average.
They arent very good at fraud however.
*/
