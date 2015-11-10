/* ----ASSIGMENT_5---------
 * Author: Rick Galbo
 * Assigment: 5
 * Probleml:  1
 * Date: October 28, 2015
 * SAS303 - FALL 2015


A)import data applying formats and labeling other points
GENERIC drug is coded as A, B, C or F
PREMIUM drug is coded as D, E, G and H. 
*/
Proc Format;
Value $SES 'L' = 'Low'
			'M' = 'Medium'
			'H'  = 'High';

Value GENDER 1 = 'Male'
			2 = 'Female'
			OTHER = 'Miscoded';


Value AGE Low-20 = '20 and younger'
			21-40 = '21-40'
			41-High = '41 and older';
run;

/*create data and apply formatting and labels*/
Data drug;
input ID $ GENDER SES $ DRUG $ AGE;
label SES = 'Socioeconomic Status'
		DRUG = 'Drug Group'
		AGE = 'Age of Subject';

IF UPCASE(DRUG) = 'A' THEN COST = 'Generic';
ELSE IF UPCASE(DRUG) ='B' THEN COST = 'Generic';
ELSE IF UPCASE(DRUG) = 'C' THEN COST = 'Generic';
ELSE IF UPCASE(DRUG) = 'F' THEN COST = 'Generic';
ELSE IF UPCASE(DRUG) = 'D' THEN COST = 'Premium';
ELSE IF UPCASE(DRUG) = 'E' THEN COST = 'Premium';
ELSE IF UPCASE(DRUG) = 'G' THEN COST = 'Premium';
ELSE IF UPCASE(DRUG) = 'H' THEN COST = 'Premium';
ELSE COST = 'Miscoded';

format GENDER GENDER.
		SES $SES.;

DATALINES;
001 1   L B 15
002 2 M    Z   35
003    2 H  F 76
004 1 L c 21
005 2 H . 58
006 2 L    G 47
007  2 L  D    23
008 1  M E  51
009 1 H    A  32
010   1  H   g  19
011   1  . b  21
012 2  L  ? 38
013 1  M  F  26
014  1 H d 36
015  2  M a    25
;

/*C)print the data*/
Proc Print data=drug;
run;

/*D)create frequency tables for SES COST AGE(in three groups */
Proc freq data=drug;
table ses*cost*age;
format age AGE.;
run;

