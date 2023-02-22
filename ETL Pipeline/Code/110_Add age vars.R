#read in month_c
month_c <- readRDS("month_c.rds")
#add year of birth
month_c$YOB <- substr(month_c$DOB, 1, 4)
#add age at year of file
month_c$AGE <- as.numeric(month_c$FileYear) - as.numeric(month_c$YOB)
#read in AGE crosswalk
AGEGRP_Xwalk <- read.csv(file = "AGEGRP_Xwalk.csv", header = TRUE, sep = ",")
#do a full join
nrow(month_c)
month_d <- merge(x = month_c, y = AGEGRP_Xwalk)
nrow(month_d)
colnames(month_d)
#keep valid records
month_e <- subset(month_d, AGE >= LowAge & AGE < HighAge)
nrow(month_e)
#keep variables
keep <- c("RowID", "FileName", "FileYear", "FileMonth", "DEID",
	"AGE", "AGEGRP", "MOS")
colnames(month_e)
month_f <- month_e[keep]
colnames(month_f)
#export
saveRDS(month_f, "month_f.rds")


