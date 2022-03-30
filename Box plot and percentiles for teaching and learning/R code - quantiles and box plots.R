#read in MA hospital dataset
hosp_a <- read.csv("MA Hospital Demo Dataset.csv", header = TRUE, sep = ",")
hosp_a

#fields in dataset
colnames(hosp_a)

#what are the percentiles of StaffedBeds?
#But quantile doesn't work on the variable.
class(hosp_a$StaffedBeds)
as.numeric(hosp_a$StaffedBeds)
quantile(as.numeric(hosp_a$StaffedBeds), na.rm = TRUE)

#pull out a vector and clean it up
BedVec_a <- as.numeric(hosp_a$StaffedBeds)
length(BedVec_a)
BedVec_b <- BedVec_a[!is.na(BedVec_a)]
length(BedVec_b)

#now do the quantile
quantile(BedVec_b)

#in case you wanted other percentiles
quantile(BedVec_b, probs = c(.05, .95))

#or just do a boxplot
boxplot(BedVec_b)

#make it fancy in ggplot2
library(ggplot2)

#to make it easy, we will just remove records from our dataset
#that are NA
hosp_a$StaffedBeds_n <- as.numeric(hosp_a$StaffedBeds)
nrow(hosp_a)
hosp_b <- subset(hosp_a, !is.na(StaffedBeds_n))
nrow(hosp_b)
hosp_b$StaffedBeds_n

#basic ggplot2 box plot
ggplot(data = hosp_b, aes(x = StaffedBeds_n)) +
	geom_boxplot()

#Make it pretty
ggplot(data = hosp_b, aes(x = StaffedBeds_n)) +
	geom_boxplot(fill = "pink") + 
	xlab(c("Staffed Beds")) +
	ylab(c("Massachusetts Hospitals")) +
	coord_flip() +
	theme_classic()

keep_cities <- c("Boston", "Worcester", "Springfield")

#add groupings
nrow(hosp_b)
hosp_c <- subset(hosp_b, HospCity %in% keep_cities)
nrow(hosp_c)

#now compare cities
ggplot(data = hosp_c, aes(x = StaffedBeds_n, y = HospCity)) +
	geom_boxplot(fill = c("pink", "orange", "yellow")) + 
	xlab(c("Staffed Beds")) +
	ylab(c("Massachusetts Hospitals")) +
	coord_flip() +
	theme_classic()

#let's look at hosp_c
write.csv(hosp_c, "hosp_c.csv")


