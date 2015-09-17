DATA SCHOOLEMP;
input id $ gender $ degree $ yrsexp salary dollar9.0;
format salary dollar9.0;

datalines;
108 M BS 4 $47,000
111 M BS 27 $72,000
222 F BS 8 $56,000
238 F MS 10 $80,000
239 M BS 8 $56,000
241 M BS 2 $42,000
278 M MS 18 $88,000
364 M MS 14 $81,000
385 F BS 5 $42,000
419 F BS 9 $57,000
483 M PHD 13 $97,000
512 M MS 23 $85,000
562 F PHD 22 $105,000
676 M MS 25 $98,000
703 F BS 11 $61,000
728 M BS 11 $59,000
735 F MS 7 $74,000
891 M BS 21 $68,000
976 M PHD 4 $85,000
;

run;

*create a frequency table of degrees;
Proc Freq Data = SCHOOLEMP;
Tables degree;
Title “title your table”;
Run;

*sort data for gender;
proc sort data=schoolemp;
by gender;
run;

*create two freq tables split by gender;
proc freq Data=schoolemp;
by gender;
table degree / nocum;
run;

*one table with both tables from previous;
proc freq data =schoolemp;
table gender*degree; *order matters;
run;

*make veritcal barchart;
Proc GChart;
vbar degree;
run;

*make horizontal barchart;
Proc GChart;
hbar degree;
run;

*use the levels option;
Proc Gchart data = schoolemp;
Title “Years of Teaching Experience”;
vbar yrsexp / levels = 8 ;
run;

*grouping the variables;
Proc Gchart data = schoolemp;
Title “Years of Teaching Experience”;
vbar salary/ group= gender;
run;

*grouping overlaying each other;
Proc Gchart data = schoolemp;
Title “Years of Teaching Experience”;
vbar salary / subgroup= gender;
run;

*using sumvar;
Proc Gchart data = schoolemp;
Title “Years of Teaching Experience”;
vbar degree / sumvar= yrsexp;
run;

*3DCLUSTER;
Proc gchart;
block gender / group=degree sumvar= salary type=mean;
run;

*pichart;
Proc Gchart data = schoolemp;
Title "Teacher Salary by Gender";
pie salary / group = gender;
run;

*making it all look fancy;
pattern value = E color = magenta;
Proc Gchart data = schoolemp;
Title "Mean Salary by Degree";
vbar degree / sumvar = salary type = mean width = 5;
run;

*scatterplotting;
Symbol value1 = circle I = none;
Proc gplot data = schoolemp;
Title "Salary by years of experience";
plot salary*yrsexp;
run;

*sorted and colored scatter;
symbol1 value = triangle color = red I = none;
symbol2 value = square color = blue I = none;
symbol3 value = circle color = green I = none;
Proc gplot data = schoolemp;
Title "Salary by years of experience by degree";
plot salary*yrsexp=degree;
run;

*creating regression lines;
symbol1 value = triangle color = red I = R;
symbol2 value = square color = blue I = R;
symbol3 value = circle color = green I = R;
Proc gplot data = schoolemp;
Title "Salary by years of experience by degree";
plot salary*yrsexp=degree;
run;

/*where these are true:
I = R --- regression line
I = Join --- joins points
I = RQ --- quadratic regression */


*testing quadratic regression lines;
symbol1 value = triangle color = red I = RQ;
symbol2 value = square color = blue I = R;
symbol3 value = circle color = green I = R;
Proc gplot data = schoolemp;
Title "Salary by years of experience by degree";
plot salary*yrsexp=degree;
run;


