Proc import datafile="P:\STAT303\SAS_Code\HW4\DATA\BaseballStats2013.xlsx" out=MLB13 dbms=xlsx;

ODS RTF file="P:\STAT303\SAS_Code\HW4\HW4_1.rtf";
ODS Graphics ON;

Proc corr data=MLB13 noprob nosimple;
run;

/* the strongest pos correlation to W/L is OBP
means getting on base more means winning more

strongest neg corr is ERA
means that having more runs scored against is indicative to winning less

OBP has highest overall correlation */;

Proc Sort data=MLB13;
By League;
run;

Proc corr data=MLB13 nosimple noprob;
by League;
run;

ODS Graphics off;
Ods Rtf CLOSE;