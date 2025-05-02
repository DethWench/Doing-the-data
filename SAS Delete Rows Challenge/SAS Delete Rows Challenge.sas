/*Set a libname, and upload your SAS file to that libname*/
/*I'm using libname PHDS*/

Libname PHDS "/home/dethwench0/PHDS";
run;

/*data step to read in dataset and rename with naming conventions*/
data PHDS.CP_a;
	set PHDS.CP;
run;

proc contents data=PHDS.CP_a;
run;

/*first delete transformation step*/
data PHDS.CP_b;
	set PHDS.CP_a;
	if Number_of_faults = 0;
run;

/*second delete transformation step*/
data PHDS.CP_c;
	set PHDS.CP_b;
	if Owner = "ChargePlace Scotland, Aberdeen City Council";
run;
