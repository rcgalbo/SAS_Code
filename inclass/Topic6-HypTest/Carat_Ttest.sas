Data DIAMOND;
input CARAT;
Datalines;
0.46  
0.61  
0.52  
0.48  
0.57  
0.54 
;

ODS GRAPHICS on;
Proc ttest h0= 0.5;
var CARAT;
run;
ods graphics off;