/*just to make sure LIBNAME is mapped*/
LIBNAME X "/home/dethwench0/X";
run;

/*Running PROC SURVEYFREQ on access to care variables*/
/*in "skinny" analytic dataset prepared in R and uploaded as CSV*/
/*Code provided by BRFSS/CDC for modification. That way, I knew*
/*I put the stratum variables in the right options.*/
proc surveyfreq
	data = x.analytic;
/* Use common weight because both questions are from the core section */
	weight x_llcpwt;
	strata x_ststr;
	cluster x_psu;
table noplan;
table medcostflag;
run;