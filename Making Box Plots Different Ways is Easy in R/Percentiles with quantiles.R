#read in MA hospital dataset
MAHosp <- read.csv("MAHosp.csv", header = TRUE, sep = ",")
MAHosp

#Let's look at percentile distribution of StaffedBeds
quantile(MAHosp$StaffedBeds)

#Imagine we want particular percentiles
#Like 5% and 95%
quantile(MAHosp$StaffedBeds, probs = c(0.05, 0.95))

#Other things you can do

#Make an external vector
probabilities <- c(0.10, 0.90)
quantile(MAHosp$StaffedBeds, probs = probabilities)

#Use a sequence for the probabilities
quantile(MAHosp$StaffedBeds, probs = seq(0, 1, 0.1))

#Save the quantiles as a vector so you can
#use it in future processing
pctiles <- quantile(MAHosp$StaffedBeds, probs = seq(0, 1, 0.1))