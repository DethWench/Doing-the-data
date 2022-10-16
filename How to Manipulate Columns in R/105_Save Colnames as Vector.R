#read in RDS
lineitems <- readRDS("lineitems.rds")

#see the column names
colnames(lineitems)

#save column names as character vector

lineitems_header <- colnames(lineitems)