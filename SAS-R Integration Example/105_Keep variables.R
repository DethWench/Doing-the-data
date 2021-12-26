#read in BRFSS_a

BRFSS_a <- readRDS(file = "BRFSS_a.rds")
colnames(BRFSS_a)

#define varlist

BRFSSVarList <- c("SEQNO", "HLTHPLN1", "MEDCOST", "X_STATE", 
			"X_PSU", "X_STSTR", "X_LLCPWT")

#subset by varlist

BRFSS_b <- BRFSS_a[BRFSSVarList]

#check columns

colnames(BRFSS_b)

#check rows

nrow(BRFSS_b)

#export as RDS

saveRDS(BRFSS_b, file = "BRFSS_b.rds")




