#read in RDS
lineitems <- readRDS("lineitems.rds")

#see the column names
colnames(lineitems)

#neat way
new_names <- c("NewCol1", "NewCol2", "NewCol3", "NewCol4", "NewCol5")
names(lineitems) <- new_names

#hard to manage way
names(lineitems) <- c("NewCol1", "NewCol2", "NewCol3", "NewCol4", "NewCol5")

colnames(lineitems)