#read in demographic
library(foreign)

BLPS_a <- read.xport("P_BPXO.xpt")
nrow(BLPS_a)

#review distribution for first SBP
hist(BLPS_a$BPXOSY1)
quantile(BLPS_a$BPXOSY1, na.rm = TRUE)

#Make a classification variable called BLPSGrp
#following the AHA guidelines for SBP
#Normal = <120 mmHg
#Elevated = 120 - <130 mmHg
#Hypertensive = 130+

BLPS_a$BLPSGrp <- 9
BLPS_a$BLPSGrp[BLPS_a$BPXOSY1 < 120] <- 1
BLPS_a$BLPSGrp[BLPS_a$BPXOSY1 >= 120 & BLPS_a$BPXOSY1 < 130] <- 2
BLPS_a$BLPSGrp[BLPS_a$BPXOSY1 >= 130] <- 3

table(BLPS_a$BPXOSY1, BLPS_a$BLPSGrp, useNA = c("always"))

quantile(BLPS_a$BPXOSY1, na.rm = TRUE, probs = c(0, .333, .666, 1.0))

