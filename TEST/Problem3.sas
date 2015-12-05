/*------Test---------
* Author: Rick Galbo
* Probleml:  3
* Date: November 27, 2015
* SAS303 - FALL 2015
*/



Data airline;
infile "P:\STAT303\SAS_Code\TEST\DATA\airline.txt";

do i = 1 to 24 by 2;
input #1 MaleSatDelta i - i+1 #2 FemateSatDelta i - i+1 #3 MaleSatSW i - i+1
	#4 FemaleSatSW i - i+1 #5 MaleSatAA i - i+1 #6 FemaleSatAA i - i+1 
	#7MaleSatUA i - i+1 #8 FemaleSatUA i - i+1;

end;
stop;
RUN;