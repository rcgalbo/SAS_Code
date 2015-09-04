libname wd "P:\STAT303\SAS_Code\inclass\DATA";

Data wd.mice1;
infile "P:\STAT303\SAS_Code\inclass\DATA\mice1.txt" DLM = '09'x;
input Subject$ Sex$ Age Time;
run;

Data wd.mice2;
infile "P:\STAT303\SAS_Code\inclass\DATA\mice2.txt" DLM = '09'x;
input Subject $ Sex $ Age Time;
run;

Proc sort Data = wd.mice1;
By Subject;
run;

Proc sort Data = wd.mice2;
By Subject;
run;

Data wd.mice_complete;
set wd.mice1 wd.mice2;
by Subject;
run;

dm dexport wd.mice_complete 'P:\STAT303\SAS_Code\inclass\DATA\mice_complete.csv' ;
