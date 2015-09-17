

Proc import Out = WD.SALARIES datafile = "P:\STAT303\SAS_Code\inclass\DATA\teacher_sal.txt";
DBMS = '09'x;
GETNAMES = YES;
RUN;

PROC PRINT DATA = SALARIES;
RUN;
