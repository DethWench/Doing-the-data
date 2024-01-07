#set the working directory to the directory where you put data
setwd("C:/Users/dethw/Dropbox/Timon Coaching/Data Scientist Program/Frontend Offer/Events/CSSI4_Offloading to R/Code and Data")

#import dataset
BF_a <- read.csv(file = "Black Friday.csv", header = TRUE, sep = ",")

counts <- table(BF_a$Type, BF_a$Period)
barplot(counts, main="Black Friday Deaths by Type and Period",
  	xlab="Type",
	ylab="Period",
	col=c("red", "orange", "green", "blue", "purple"),
  	legend = rownames(counts), 
	beside=TRUE)