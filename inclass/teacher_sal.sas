DATA SCHOOLEMP;
input id $ gender $ degree $ yrsexp salary dollar9.0;

format salary comma9.0;

datalines;
108	M	BS	4	$47,000 
111	M	BS	27	$72,000 
222 F	BS	8	$56,000 
;

Proc Print Data = SCHOOLEMP;
run;
