*import the weather sheetl;
Proc Import Out = WEATHER datafile = "P:\STAT303\SAS_Code\HW2\DATA\Weather"
DBMS = xls;
GETNAMES = yes;
RUN;


Proc Means Mean STD Var CLM Data = WEATHER;
var MeanTemperatureF MaxTemperatureF MinTemperatureF;
run;

*MEANS OF DECEMBER, FEBRUARY AND MARCH;
Proc Means Mean STD CLM Data = WEATHER;
var MeanTemperatureF MaxTemperatureF MinTemperatureF;
where Month = 'DEC' or Month = 'JAN' or Month = 'FEB';
run;

*CREATE HISTOGRAM OF WINDSPEED;
Proc Univariate Data = WEATHER NOPRINT;
Title "MEAN WIND SPEED MPH";
histogram MeanWindSpeedMPH /NORMAL;
inset   skewness = "Skew"
		Kurtosis = "Kurtosis"
		mean = "Mean"
		std="Std Dev" /Pos = NE
		Height = 4;

*CREATE HISTOGRAM OF Maxwindspeed;
Proc Univariate Data = WEATHER NOPRINT;
Title "MAX WIND SPEED MPH";
histogram MaxWindSpeedMPH / NORMAL;
inset   skewness = "Skew"
		Kurtosis = "Kurtosis"
		mean = "Mean"
		std="Std Dev" /Pos = NE
		Height = 4;

*CREATE HISTOGRAM OF MaxGustspeed;
Proc Univariate Data = WEATHER NOPRINT;
Title "MAX GUST SPEED MPH";
histogram MaxGustSpeedMPH / NORMAL;
inset   skewness = "Skew"
		Kurtosis = "Kurtosis"
		mean = "Mean"
		std="Std Dev" /Pos = NE
		Height = 4;
