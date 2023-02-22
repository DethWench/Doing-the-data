#read in month_a
month_a <- readRDS("month_a.rds")
#read in DEID xwalk
SSN_DEID_Xwalk <- read.csv(file = "SSN_DEID_Xwalk.csv", header = TRUE, sep = ",")
#inner join
nrow(month_a)
month_b <- merge(x = month_a, y = SSN_DEID_Xwalk, by = "SSN", all.x = TRUE)
nrow(month_b)
colnames(month_b)
#drop SSN
month_c <- month_b[,2:ncol(month_b)]
colnames(month_c)
#export
saveRDS(month_c, "month_c.rds")
