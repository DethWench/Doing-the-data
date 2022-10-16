#read in RDS
lineitems <- readRDS("lineitems.rds")

#see column names
colnames(lineitems)

#Load column into vector
RptID_Column <- lineitems$RptID

#same thing
RptID_Column <- lineitems[,2]

#make new vector with only unique values
#Kind of a SELECT DISTINCT for R

length(RptID_Column)

RptID_Unique <- unique(RptID_Column)

length(RptID_Unique)
