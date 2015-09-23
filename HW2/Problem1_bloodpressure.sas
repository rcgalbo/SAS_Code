*create data set 1;
Data PATIENT;
input ID 1-3 GENDER $ 4 RACE $ 5 AGE 6-7;
datalines;
001MW35
002FW41
003MB62
004FB38
005MW44
006FB47
007FW53
008MW58
009FB56
010FB39
;
*print set 1;
Proc Print Data = PATIENT;
run;

*create data set 2;
Data PATIENTVITALS;
input ID 1-3 HR 4-6 SBP 7-9 DBP 10-12 N_PROC 13-15;
AVE_BP = DBP + ((1/3)*(SBP - DBP));
Datalines;
00108013008010
00208811007205
00305018810002
004   10806801
00506812208204
006101   07404
00707810406603
00804811207006
00907719011009
01006616410610
;

*print set two;
Proc Print Data = PATIENTVITALS;
run;

*obs, means std and confidence;
Proc Means N Mean STD CLM Median Data = PATIENTVITALS;
var SBP DBP AVE_BP;
run;

*sort the data sets to merge;
Proc Sort PATIENT;
BY ID;
run;

Proc Sort PATIENTVITALS;
By ID;
run;

*merge the data sets;
Data PATIENT_COMBINED;
Merge PATIENT PATIENTVITALS;
By ID;
run;

*print out combined data set;
Proc Print Data = PATIENT_COMBINED;
run;

*sort by RACE;
Proc Sort Data = PATIENT_COMBINED;
By RACE;
run;

*Create a boxplot of data;
Proc boxplot data = PATIENT_COMBINED;
plot HR*RACE;
run;
