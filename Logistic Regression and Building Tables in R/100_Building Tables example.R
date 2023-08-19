#read in a subset of BRFSS data
BRFSS <- readRDS(file="BRFSS_i.rds")
colnames(BRFSS)
nrow(BRFSS)

#Imagine we want to build a Table 1 for a study
#We will have a few rows of data
#and four columns: All, and then three columns for SMOKGRP)

#We can build a blank Table 1 to start with
#and add values we will replace.
#Lets make vectors of our columns to our Table 1
#then bind them together

#Here are the columns
table(BRFSS$SMOKGRP)

#Here are the rows
table(BRFSS$EDGROUP)
table(BRFSS$HISPANIC)

CatLev <- c("All", "Ed-LTHS", "Ed-HS", "Ed-SOMECOLL", "Ed-GRAD", "Ed-Unk",
	"Hispanic-Yes")
All <- rep(0, length(CatLev))
CurSmok <- rep(0, length(CatLev))
NSmok <- rep(0, length(CatLev))
UnkSmok <- rep(0, length(CatLev))

tbl <- data.frame(CatLev, All, CurSmok, NSmok, UnkSmok)

#fill in cell for total
total_n <- nrow(BRFSS)
tbl[1,2] <- total_n

#fill in top row
smok_freqs <- as.data.frame(table(BRFSS$SMOKGRP))
tbl[1,3:5] <- smok_freqs[1:3,2]

#fill in All for EDGROUP
ed_freqs <- as.data.frame(table(BRFSS$EDGROUP))
tbl[2:6,2] <- ed_freqs[,2]

#fill in columns for EDGROUP
ed_smok_freqs <- as.data.frame(table(BRFSS$EDGROUP, BRFSS$SMOKGRP))
tbl[2:6,3] <- ed_smok_freqs[1:5,3]
tbl[2:6,4] <- ed_smok_freqs[6:10,3]
tbl[2:6,5] <- ed_smok_freqs[11:15,3]

#fill in All for HISPANIC
hisp_freqs <- as.data.frame(table(BRFSS$HISPANIC))
tbl[7,2] <- hisp_freqs[2,2]

#fill in columns for HISPANIC
hisp_smok_freqs <- as.data.frame(table(BRFSS$HISPANIC, BRFSS$SMOKGRP))
tbl[7,3] <- hisp_smok_freqs[2,3]
tbl[7,4] <- hisp_smok_freqs[4,3]
tbl[7,5] <- hisp_smok_freqs[6,3]

#rename to be unique
demo_tbl <- tbl

#export as CSV
write.csv(demo_tbl, "demo_tbl.csv")





