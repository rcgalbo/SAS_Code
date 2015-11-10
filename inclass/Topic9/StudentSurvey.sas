Data Survey;
length status $20;
Input a 1- 2 s $ 3 ys  4 cf 5;

Label a = "Age" s = "Sex" ys = "Year in College" cf = "Campus  food rating";

*If ys < 0 then status = .;
If ys < 0 then status = " ";

If ys <= 2 then Status  = 'Underclassmen';
Else if ys <= 4 then Status = 'Upperclassmen';
Else Status = 'Graduate Student';

Datalines;
18114
22142
19212
20221
24151
23233
17212
26232
19.23
20224
21232
2815.
18213
20221
2214.
23242
20113
20142
27253
21241
18212
18213
22242
20124
25213
19114
2131
19222
22252
21144
19223
;


