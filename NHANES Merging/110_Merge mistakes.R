library(foreign)

#repeat extracting the data from
#source datasets
demo_a <- read.xport("P_DEMO.XPT")
dent_a <- read.xport("P_OHXDEN.XPT")
smok_a <- read.xport("P_SMQ.XPT")

keep_demo <- c("SEQN", "DMDYRUSZ")
keep_dent <- c("SEQN", "OHXIMP")
keep_smok <- c("SEQN", "SMQ020")

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

nrow(smok_a)
smok_b <- smok_a[keep_smok]
nrow(smok_b)
colnames(smok_b)

#correct left join
nrow(demo_b)
merged_a <- merge(demo_b, dent_b, by = c("SEQN"), all.x=TRUE)
nrow(merged_a)
colnames(merged_a)

#Mistake #1: Right joining by using all.y = TRUE instead of all.x
#left join the datasets with demo (denominator) on the left
nrow(demo_b)
merged_a <- merge(demo_b, dent_b, by = c("SEQN"), all.y=TRUE)
nrow(merged_a)

#Mistake #2: Putting wrong dataset first and left joining
nrow(demo_b)
merged_a <- merge(dent_b, demo_b, by = c("SEQN"), all.x=TRUE)
nrow(merged_a)

#Mistake #3: Forgetting all.x option and doing an inner join
nrow(demo_b)
merged_a <- merge(demo_b, dent_b, by = c("SEQN"))
nrow(merged_a)




