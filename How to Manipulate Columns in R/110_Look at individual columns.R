#read in RDS
lineitems <- readRDS("lineitems.rds")

#see column names
colnames(lineitems)

#Look at RptID

lineitems$RptID

lineitems[,2]