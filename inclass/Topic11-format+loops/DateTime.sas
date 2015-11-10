Data PAY;
input id lastname $ firstname $ 
	payrate / hour1-hour3/
	startdate MMDDYY10.;
x = year(startdate);
format startdate MMDDYY10.;
Datalines;
528013351 Jones Emily 15.85 
30 40 37
1/13/2012 
205284178 Smith Jeremy 13.45
44 38 42
1/13/2012
271044878 Mitchell Tyler 15.65
39 38 45
1/13/2012
;