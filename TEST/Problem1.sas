/*------Test---------
* Author: Rick Galbo
* Probleml:  1
* Date: November 27, 2015
* SAS303 - FALL 2015

Conversion factor from Celsius to Kelvin 274.15
*/

proc import datafile="P:\STAT303\SAS_Code\TEST\DATA\Pressure.xlsx" 
	out=infile
	dbms=xlsx;
run;

*i) convert temperature to kelvin and add new vars;
Data PRESSURE;
Set infile;
TEMP_K = Temperature + 273.15;
TEMP_Ksq = TEMP_K**2;
TEMP_inv = 1/TEMP_K;
TEMP_ln = log(TEMP_K);
lnPRESSURE = log(PRESSURE);


*i) create model from formula;
ods GRAPHICS on;
ods RTF file="P:\STAT303\Assignments\Answers\TEST_1.1.rtf";

proc reg DATA=pressure;
model lnPRESSURE = TEMP_Ksq TEMP_inv TEMP_ln / r clm ;
plot (predicted. lnpressure)*temp_ksq / overlay;
run;


ods RTF CLOSE;
ods Graphics OFF;