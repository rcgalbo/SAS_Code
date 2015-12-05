/*------Test---------
* Author: Rick Galbo
* Probleml:  2
* Date: November 27, 2015
* SAS303 - FALL 2015

create a format for the dat that will be imported
*/
Proc format;
value GL
	1 = 'EAST'
	2 = 'SOUTH'
	3 = 'MIDWEST';
value $TYPE
	'PL' = 'PUBLIC'
	'PR' = 'PRIVATE';
value RATE
	80-high = 'ABOVE AVERAGE'
	0-80 = 'AVERAGE';
RUN;

Data GRAD;
infile "P:\STAT303\SAS_Code\TEST\DATA\graduationrates.txt" firstobs=2;
input @1 UNIV $30. @36 SAT 4. @41 ACT 2. @45 RATE 2. @51 ENROLL comma6. @60 GL 1. @72 TYPE $2.;
Label RATE = 'Graduation Rate' GL ="Geographical Location" TYPE = "Public or Private University";
if SAT >- 1200 then CHOICEY = 'Highly Selective';
if SAT <1200 then CHOICEY = 'Selective';
Format GL TYPE;
run;

ods GRAPHICS on;
ods RTF file="P:\STAT303\Assignments\Answers\TEST_1.1.rtf";


Proc ttest data=GRAD;
Class type;
var rate;
run;

Proc Freq order=data;
tables choicey/ chisq;
weight rate;
run;

Proc Freq order=data;
tables GL/ chisq;
weight rate;
run;

ods RTF CLOSE;
ods Graphics OFF;
