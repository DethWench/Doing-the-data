#read in RDS
lineitems <- readRDS("lineitems.rds")

#see the column names
colnames(lineitems)

#what column number is CostRowID?
which(colnames(lineitems)=="CostRowID")

#save it as a variable
CostRowID_cn <- which(colnames(lineitems)=="CostRowID")