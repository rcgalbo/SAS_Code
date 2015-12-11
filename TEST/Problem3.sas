/*------Test---------
* Author: Rick Galbo
* Probleml:  3
* Date: November 27, 2015
* SAS303 - FALL 2015
*/

PROC FORMAT;
VALUE GENDERform  1="MALE"
                2="FEMALE";
RUN;

DATA AIRLINES;
INFILE "P:\STAT303\SAS_Code\TEST\DATA\airline.txt" dlm=' ';
LENGTH AIRLINE$ 20;

DO AIRLINE="DELTA","SOUTHWEST","AMERICAN","UNITED";
    DO GENDER= 1 TO 2;
        DO SATISFACTION_i=1 TO 9;
            INPUT SATISFACTION @@;
            OUTPUT;
        END;
    END;
END;

FORMAT GENDER GENDERform.;

ods graphics on;
ods rtf file="P:\STAT303\SAS_Code\TEST\output.rtf";

*sort on satisfaction;
PROC SORT DATA=AIRLINES;
BY SATISFACTION;
run;

PROC Anova DATA = AIRLINES;
class AIRLINE;
model SATISFACTION = AIRLINE;
means AIRLINE / snk;
run;

PROC GLM DATA=AIRLINES;
CLASS GENDER AIRLINE;
model SATISFACTION = AIRLINE GENDER AIRLINE*GENDER;
means GENDER AIRLINE / snk;
run;

ods graphics off;
ods rtf close;