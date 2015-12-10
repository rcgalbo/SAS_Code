/*------Test---------
* Author: Rick Galbo
* Probleml:  3
* Date: November 27, 2015
* SAS303 - FALL 2015
*/



Data airline;
infile "P:\STAT303\SAS_Code\TEST\DATA\airline.txt" dlm = ' ';
LENGTH AIRLINE$ 20;

DO AIRLINE="DELTA","SOUTHWEST","AMERICAN","UNITED";
    DO GENDER= 1 TO 2;
        DO SATISFACTION_i=1 TO 9;
            INPUT SATISFACTION @@;
            OUTPUT;
        END;
    END;
END;

end;
stop;
RUN;
