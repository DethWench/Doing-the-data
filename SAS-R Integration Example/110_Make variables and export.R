#read in RDS of BRFSS_b

BRFSS_b <- readRDS(file = "BRFSS_b.rds")

#Create flag for no health insurance

BRFSS_b$NOPLAN <- 0
BRFSS_b$NOPLAN [BRFSS_b$HLTHPLN1 !=1 ] <- 1
table(BRFSS_b$NOPLAN, BRFSS_b$HLTHPLN1)

#Create flag for barrier due to cost 

BRFSS_b$MEDCOSTFLAG <- 0
BRFSS_b$MEDCOSTFLAG[BRFSS_b$MEDCOST == 1] <- 1
table(BRFSS_b$MEDCOSTFLAG, BRFSS_b$MEDCOST, useNA = c("always"))

#advance prefix of data frame

BRFSS_c <- BRFSS_b

#trim off unneeded variables

keep_in_analytic <- c("SEQNO", "X_PSU", "X_STSTR", "X_LLCPWT", "X_STATE",
			"NOPLAN", "MEDCOSTFLAG")

BRFSS_d <- BRFSS_c[keep_in_analytic]

#export as an analytic dataset
#in CSV and in RDS

colnames(BRFSS_d)
write.csv(BRFSS_d, file = "access_analytic.csv", row.names = FALSE)
saveRDS(BRFSS_d, file = "access_analytic.rds")






