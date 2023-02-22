#read in raw dataset
month_a <- read.csv(file = "JAN2023.csv", header = TRUE, sep = ",")
nrow(month_a)
colnames(month_a)
#add row ID
month_a$RowID <- c(1:nrow(month_a))
#add file name, month, and year
month_a$FileName <- c("2023JAN")
month_a$FileYear <- c(2023)
month_a$FileMonth <- c(1)
#export out as RDS
saveRDS(month_a, "month_a.rds")