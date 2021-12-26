/*Here, I set LIBNAME to point to folder in SAS ODA*/
/*I made earlier, where I will put data and code for this*/
LIBNAME X "/home/dethwench0/X";
run;

/*Earlier, I used the upload utility to get the CSV into SAS.*/
/*Here, I identify uploaded CSV file as REFFILE to SAS.*/
FILENAME REFFILE '/home/dethwench0/X/access_analytic.csv';

/*PROC IMPORT code: I used the SAS ODA import utility to help me write this code.*/
/*This code converts the REFFILE to a SAS dataset called "analytic"*/
/*and puts it in the X folder mapped to the LIBNAME.*/
PROC IMPORT DATAFILE=REFFILE
	DBMS=CSV
	OUT=x.analytic;
	GETNAMES=YES;
RUN;

/*Here we can review contents of imported SAS dataset*/
PROC CONTENTS DATA=x.analytic;
RUN;