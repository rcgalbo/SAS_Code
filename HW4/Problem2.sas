Proc import datafile="P:\STAT303\SAS_Code\HW4\DATA\BoneCrackingHypercarnivoresData.xlsx" out=CAR dbms=xlsx;
run;


Data CAR_qd;
Set CAR;
MAsq = MA**2;
MAex = exp(MA);
run;

ODS RTF file="P:\STAT303\SAS_Code\HW4\HW4.rtf";
ODS GRAPHICS ON;
Proc reg data=CAR 
	plots=predictions(x=MA);
model SEJ = MA;
run;
ODS GRAPHICS off;


ODS GRAPHICS ON;
Proc reg data=CAR_qd
	plots=predictions(x=MA);
model SEJ = MA MAsq;
run;
ODS GRAPHICS off;

ODS GRAPHICS ON;
Proc reg data=CAR_qd
	plots=predictions(x=MA);
model SEJ = MA MAex;
run;
ODS GRAPHICS off;

ods rtf CLOSE;

