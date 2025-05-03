#read in dataset
CP <- read.csv("monthy_cp_report-December-2024.csv", header = TRUE, sep = ",")
colnames(CP)

#look at distribution
quantile(CP$Power_drawn_kWh)

#construct categorical variable
CP$PowerCat <- 9
CP$PowerCat[CP$Power_drawn_kWh < 75] <- 1
CP$PowerCat[CP$Power_drawn_kWh >= 75 & CP$Power_drawn_kWh < 400] <- 2
CP$PowerCat[CP$Power_drawn_kWh >= 400 & CP$Power_drawn_kWh < 1000] <- 3
CP$PowerCat[CP$Power_drawn_kWh >= 1000] <- 4

#check variable
table(CP$Power_drawn_kWh, CP$PowerCat, useNA = c("always"))