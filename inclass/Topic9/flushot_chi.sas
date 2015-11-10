data FluTreatment;
input result $ group $ count;
Datalines ;
flu noshot 24
flu oneshot 9
flu twoshot 13
noflu noshot 289 
noflu oneshot 100 
noflu twoshot 565
;

proc freq data = FluTreatment order = data;
tables result*group /chisq nocol norow nopercent expected;
weight count;
run;
