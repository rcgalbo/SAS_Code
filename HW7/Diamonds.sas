/*----ASSIGMENT_7---------
 * Author: Rick Galbo
 * Assigment: 7
 * Probleml:  1
 * Date: December 3, 2015
 * SAS303 - FALL 2015 

import data from xls file
*/

Proc import datafile="P:\STAT303\SAS_Code\HW7\DATA\Diamonds+Multi+Reg.xls"
	out=diamonds_multi_reg
	dbms=xls;
run;

Data diamonds;

set diamonds_multi_reg;

if color = "D" then colornumber = 1;
else if color = "E" then colornumber = 2;
else if color = "F" then colornumber = 3;
else if color = "G" then colornumber = 4;
else if color = "H" then colornumber = 5;
else if color = "I" then colornumber = 6;
else if color = "J" then colornumber = 7;

if clarity = "FL" then claritynumber = 1;
else if clarity = "IF" then claritynumber = 2;
else if clarity = "VVS1" then claritynumber = 3;
else if clarity = "VVS2" then claritynumber = 4;
else if clarity = "VS1" then claritynumber = 5;
else if clarity = "VS2" then claritynumber = 6;
else if clarity = "SI1" then claritynumber = 7;
else if clarity = "SI2" then claritynumber = 8;

if cut = "EXCELLENT" then cutnumber = 1;
else if cut = "VERY GOOD" then cutnumber = 2;
else if cut = "GOOD" then cutnumber = 3;

caratsq = carat**2;
colorsq = colornumber**2;
claritysq = claritynumber**2;
cutsq = cutnumber**2;
caratcolor = carat*colornumber;
caratclarity = carat*claritynumber;
caratcut = carat*cutnumber;
colorclarity = colornumber*claritynumber;
colorcut = colornumber*cutnumber;
claritycut = claritynumber*cutnumber;
run;


ods graphics on;
ods rtf file='P:\STAT303\SAS_Code\HW7\output1-1.rtf';

Proc reg data=diamonds;
model price = carat colornumber claritynumber cutnumber/ vif r cli clm;
run;

Proc corr data=diamonds noprob;
var carat colornumber claritynumber cutnumber;
run;

Proc reg data=diamonds;
model price = carat colornumber claritynumber cutnumber/selection = Stepwise vif r cli clm;
run;

Proc reg data=diamonds;
model price = carat colornumber claritynumber cutnumber/selection = Backwards vif r cli clm;
run;

ods graphics off;
ods rtf close;