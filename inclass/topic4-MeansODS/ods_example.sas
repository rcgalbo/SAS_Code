
Data Parts;
   input Deviation @@;
   datalines;
-.0653 0.0141 -.0702 -.0734 -.0649 -.0601
-.0631 -.0148 -.0731 -.0764 -.0275 -.0497
-.0741 -.0673 -.0573 -.0629 -.0671 -.0246
-.0222 -.0807 -.0621 -.0785 -.0544 -.0511
-.0138 -.0609 0.0038 -.0758 -.0731 -.0455
;
ods RTF file= "Desktop\deviation.rtf";
ods select moments plots;

Proc Univariate data = parts plot;
var deviation;
run;

ods rtf close;
quit;
