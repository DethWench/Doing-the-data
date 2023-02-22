#read in month_c
month_f <- readRDS("month_f.rds")
#create MOS Group
month_f$MOSGRP <- substr(month_f$MOS, 1, 2)
colnames(month_f)
#Drop MOS code
keep <- c("RowID", "FileName", "FileYear", "FileMonth", "DEID",
	"AGE", "AGEGRP", "MOSGRP")
colnames(month_f)
month_g <- month_f[keep]
colnames(month_g)
#prepare for export
analytic <- month_g
#export
write.csv(analytic, "analytic.csv")