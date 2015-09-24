/*
 * ----ASSIGMENT_2---------
 * Author: Rick Galbo
 * Assigment: 2
 * Probleml:  3
 * Date: September 23, 2015
 * SAS303 - FALL 2015
 */

Data ADOPTION;
infile "P:\STAT303\SAS_Code\HW2\DATA\adoption.txt" delimiter = ' ';
input COUNTRY $ YEAR ADOPTIONS;
RUN;
/*Part A)
create horizontal barchart*/;
proc sgplot data = ADOPTION noautolegend;
*By COUNTRY;
Where COUNTRY = 'China';
hbar YEAR / response = ADOPTIONS group = COUNTRY groupdisplay=Cluster 
transparency=0.00 stat=Mean dataskin=None name='Bar';
xaxis;
yaxis grid label= "Years";
run;

*sort on countries;
proc sort data = ADOPTION;
by COUNTRY;
run;
*Part b);
*barchart with all counries;
proc sgplot data = ADOPTION noautolegend;
Title "NUMBER OF ADOPTIONS PER YEAR BY COUNTRY";
vbar COUNTRY / response = ADOPTIONS group = YEAR groupdisplay = Cluster 
transparency = 0.00 stat = Sum dataskin = None name = 'Bar';

*Part C)
*sum the data by country for pie chart;


*making pie (charts);
Proc Gchart data = COUNTRY_SUM;
Title "Adoptions By Country";
pie ADOPTIONS / group = COUNTRY;
run;
