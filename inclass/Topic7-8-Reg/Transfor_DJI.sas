Data DJI;
Input Date DJ; 
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

Data DJI_tran;
Set DJI;
lnDJ = log(DJ);


ODS GRAPHICS ON;
Proc Reg data = DJI_tran
		PLOTS=PREDICTIONS(x = Date);
model lnDJ = Date;
output out = DJ_pred
  predicted = predy;
run;
ODS Graphics OFF;

*create the untransformed data by taking e;
Data untransform;
Set DJI_tran;
predicty = exp(lnDJ);
run;

*print the untransformed data;
Proc Print Data=untransform;
run;