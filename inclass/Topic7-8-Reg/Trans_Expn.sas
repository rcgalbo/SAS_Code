data practicetransform;
input x y @@;
lny = log(y);
datalines;
4 0.2 6 0.7 8 1.4 10 2.8 12 5.8
14 11.1 16 21.7 18 43.2 20 80.1
;

ODS GRAPHICS ON;
Proc Reg data = practicetransform
		PLOTS=PREDICTIONS(x = x);
model lny = x;
output out = predicteddata
  predicted = predy;
run;
ODS Graphics OFF;

Proc PRINT	data =  predicteddata;
var x y lny predy ;
run;

*create the untransformed data by taking e;
Data untransform;
Set predicteddata;
predicty = exp(predy);
run;

*print the untransformed data;
Proc Print Data=untransform;
run;

*plot bothy predictions and the data;
symbol1 value = "circle" color =blue;
symbol2 color = orange I=join;
proc gplot data  = untransform;
plot y*x = 1
     predicty*x = 2/overlay;
run; 

