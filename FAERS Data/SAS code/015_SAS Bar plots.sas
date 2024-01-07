/*proc freq without options*/
proc freq data=PHDS.BF_a;
tables Type * Period;
run;

/*easier way to look at the table*/
proc freq data=PHDS.BF_a;
tables Type * Period /list;
run;

/*make a chart*/
Ods graphics on;
Proc freq data=PHDS.BF_a order=freq;
Tables Type * Period/ plots=freqplot (type=bar scale=percent);
Run;
Ods graphics off;
