data assign;
do subj = 1 to 10000;
vari = rannor(-1);
output;
end;
run;


data sample;
do i = 100 to 9000 by 100;
  set assign point=i;
  output;
  end;
  stop;
run;


Data slimkins;
input Subj Wk1 Wk2 Wk3 Wk4 Wk5;
datalines;
1 4 2 5 -1 3
2 3 8 2 3 3
3 5 1 0 2 -2
4 1 1 4 7  .
5 2 6 -1 . .
;


data slimuni;
set slimkins;
array y(*) weightloss1-weightloss5;
do i = 1 to 5;
    wloss = y(i);
    output;
 end;
 drop i weightloss1-weightloss5;
 run;
