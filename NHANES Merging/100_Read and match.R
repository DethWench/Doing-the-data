#set the working directory to the directory where you put data
setwd("C:/Users/dethw/OneDrive/PersonalWork_SD/SAS Blog/Articles-Deth by Data/231030_NHANES data/Analytics/Data")

#set the working directory to the directory where you put data
setwd("C:/[fill in with your file location]")

#use foreign package to import SAS xpt into R

library(foreign)

demo_a <- read.xport("P_DEMO.XPT")
dent_a <- read.xport("P_OHXDEN.XPT")

#Keep only the columns wanted from denominator dataset for left join
#and first join-on dataset

keep_demo <- c("SEQN", "DMDYRUSZ")
keep_dent <- c("SEQN", "OHXIMP")

nrow(demo_a)
demo_b <- demo_a[keep_demo]
nrow(demo_b)
ncol(demo_b)
colnames(demo_b)

nrow(dent_a)
dent_b <- dent_a[keep_dent]
nrow(dent_b)
ncol(dent_b)
colnames(dent_b)

#left join the datasets with demo (denominator) on the left
nrow(demo_b)
merged_a <- merge(demo_b, dent_b, by = c("SEQN"), all.x=TRUE)
nrow(merged_a)
colnames(merged_a)

###For some reason, it would not merge if I used by = SEQN
###I had to use by = c("SEQN") even though it is numeric
###First time I encountered this, not sure why.

#Review what did not join.
#The NAs represent where the respondent was not asked the question
#So we have no data on them for that variable.
table(merged_a$OHXIMP, useNA = c("always"))

#add a flag for being in the OHX dataset
merged_a$IN_OHX <- 0
merged_a$IN_OHX[merged_a$OHXIMP %in% c(1:2)] <- 1
table(merged_a$OHXIMP, merged_a$IN_OHX, useNA = c("always"))

#What if we add a data point from another table?
#Let's add a question from a smoking questionnaire
smok_a <- read.xport("P_SMQ.XPT")
keep_smok <- c("SEQN", "SMQ020")
smok_b <- smok_a[keep_smok]
nrow(smok_b)
colnames(smok_b)

#left join smoking variable onto merged_a
nrow(merged_a)
merged_b <- merge(merged_a, smok_b, by = c("SEQN"), all.x=TRUE)
nrow(merged_b)

#review what did not join
table(merged_b$SMQ020, useNA = c("always"))

#add a flag
merged_b$IN_SMOK <- 0
merged_b$IN_SMOK[merged_b$SMQ020 %in% c(1:2)] <- 1
table(merged_b$SMQ020, merged_b$IN_SMOK, useNA = c("always"))

#evaluate selection bias
box_one <- merged_b
nrow(box_one)
box_two <- subset(box_one, IN_OHX == 1)
nrow(box_two)
box_three <- subset(box_two, IN_SMOK == 1)
nrow(box_three)






