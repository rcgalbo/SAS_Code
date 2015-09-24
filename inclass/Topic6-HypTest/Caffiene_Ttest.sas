Data CAFFIENE;
Input baseline caffiene diff;
Datalines;
6.37 4.52 1.85
5.69 5.44 0.25
5.58 4.70 0.88
5.27 3.81 1.46
5.11 4.06 1.05
4.89 3.22 1.67
4.70 2.96 1.74
3.53 3.20 0.33
;


Proc Ttest Side = U;
Paired baseline*caffiene;
Run;

* if have paird data use Sign Test / Wilcoxon Signed-Rank Test;
* if have independent pairs of observations Wilcoxon Whitney;


