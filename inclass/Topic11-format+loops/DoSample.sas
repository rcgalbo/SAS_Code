Data inv;
input invest rate;

do i = 1 to 5;
invest = invest*(1+rate);
output;
end;
drop i;

Datalines;
20000 0.07
10000 0.066
;
