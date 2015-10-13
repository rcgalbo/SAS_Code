Proc Import datafile="P:\STAT303\SAS_Code\inclass\DATA\TreeWeight.xls" OUT=TREES dbms=excel;

Data NEW_TREES;
SET TREES;
GirthSq = TrunkGirth**2;
run;

ods graphics on;

proc reg DATA = NEW_TREES plots=predictions(x = TrunkGirth);
MODEL Weight = TrunkGirth GirthSq;
run;

ods graphics off;
