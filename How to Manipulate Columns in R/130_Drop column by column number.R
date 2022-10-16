#read in RDS
lineitems <- readRDS("lineitems.rds")

#see the column names
colnames(lineitems)

#what column number is CostRowID?
#save it as variable CostRowID_cn
CostRowID_cn <- which(colnames(lineitems)=="CostRowID")

#make new dataframe without
#dropped variable CostRowID
lineitems2 <- lineitems[,-CostRowID_cn]

#same as
lineitems2 <- lineitems[,-4]
#but you have to know the column number

colnames(lineitems2)