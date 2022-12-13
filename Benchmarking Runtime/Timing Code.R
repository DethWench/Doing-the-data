#read in RDS version of BRFSS
Large_RDS_df <- readRDS(file = "BRFSS_a.rds")
colnames(Large_RDS_df)

#read in CSV version of same file
#for time comparison
Large_CSV_df <- read.csv(file = "BRFSS_a.csv")
colnames(Large_CSV_df)

#calculate how long it takes to read it in
#Put time in variables, then manipulate variables

start_read_rds <- Sys.time()
Large_RDS_df <- readRDS(file = "BRFSS_a.rds")
end_read_rds <- Sys.time()

RDSTime <- end_read_rds - start_read_rds
RDSTime

start_read_csv <- Sys.time()
Large_CSV_df <- read.csv(file = "BRFSS_a.csv")
end_read_csv <- Sys.time()

CSVTime <- end_read_csv - start_read_csv
CSVTime

#How do I reduce runtime for the CSV?

ten_column_names <- c("X_STATE", "FMONTH", "IDATE", "IMONTH", "IDAY", "IYEAR", "DISPCODE", "SEQNO", "X_PSU", "CTELENM1")
ten_column_df <- Large_CSV_df[ten_column_names]
write.csv(ten_column_df, "ten_column_df.csv")

five_column_names <- c("IYEAR", "DISPCODE", "SEQNO", "X_PSU", "CTELENM1")
five_column_df <- Large_CSV_df[five_column_names]
write.csv(five_column_df, "five_column_df.csv")

#Compare different numbers of columns

start_read_tencol_csv <- Sys.time()
tencol_df <- read.csv(file = "ten_column_df.csv")
end_read_tencol_csv <- Sys.time()

tencol_CSVTime <- end_read_tencol_csv - start_read_tencol_csv
tencol_CSVTime

start_read_fivecol_csv <- Sys.time()
fivecol_df <- read.csv(file = "five_column_df.csv")
end_read_fivecol_csv <- Sys.time()

fivecol_CSVTime <- end_read_fivecol_csv - start_read_fivecol_csv
fivecol_CSVTime