libname wd "P:\STAT303\SAS_Code\inclass\DATA";

Data wd.mice1;
infile "P:\STAT303\SAS_Code\inclass\DATA\mice1.txt" DLM = '09'x;
input Subject$ Sex$ Age Time;
run;

Proc sort Data = wd.mice1;
By Subject;
run;

Data micead;
infile "P:\STAT303\SAS_Code\inclass\DATA\mice1.txt" DLM = '09'x;
input Subject $ Time2;
run;

Proc Sort Data= micead;
By Subject;
run;

Data Merged;
Merge mice1 micead;
By Subject;
Diff = abs(time2 – time); 
Run;

Proc Print Data = Merged;
run;
