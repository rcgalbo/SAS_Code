/* Topic 11 data formating */

Data PAY;
Input id lastname $ firstname $ payrate;
Input hour1 - hour3;
paycheck1 = payrate*hour1;
paycheck2 = payrate*hour2;
paycheck3 = payrate*hour3;
Format id ssn11.
	payrate dollar6.2;
Datalines;
528013351 Jones Emily 15.85
38 40 37
205284178 Smith Jeremy 13.45
44 38 42
271044878 Mitchell Tyler 15.65
39 38 45
;
