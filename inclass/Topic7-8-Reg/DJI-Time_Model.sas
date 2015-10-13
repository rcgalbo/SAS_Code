Data DJI;
Input Date DJ;
DateSq = Date ** 2;
DateCu = Date ** 3; 
Datalines;
1913 1886
1923 1252
1929 4556
1933 1694
1943 1770
1953 2367
1963 5761
1973 4161
1983 2715
1993 5727
1999 14690
2003 12018
2007 14315
2008 9421
2013 16123
;

*create a quadratic model for the DJI;
ODS GRAPHICS ON;
Proc REG Data=DJI
		plots=predictions(x=Date);
model DJ = Date DateSq;
run;
ODS GRAPHICS OFF;


