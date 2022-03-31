#read in MA hospital dataset
MAHosp <- read.csv("MAHosp.csv", header = TRUE, sep = ",")
MAHosp

#fields in dataset
colnames(MAHosp)

#Base R box plot
boxplot(MAHosp$StaffedBeds)

#Can add features to Base R plot
boxplot(MAHosp$StaffedBeds,
		col = c("gold"),
		xlab = c("Massachusetts Hospitals"),
		ylab = c("Staffed Beds"),
		notch = TRUE)

#Make it fancier in ggplot2
library(ggplot2)

#Basic ggplot2 box plot
ggplot(data = MAHosp, aes(x = StaffedBeds)) +
	geom_boxplot()

#Make it pretty
ggplot(data = MAHosp, aes(x = StaffedBeds)) +
	geom_boxplot(fill = "pink") + 
	xlab(c("Staffed Beds")) +
	ylab(c("Massachusetts Hospitals")) +
	coord_flip() +
	theme_classic()


***ADD GROUPINGS

#read in comparison dataset
CityCompare <- read.csv("CityCompare.csv", header = TRUE, sep = ",")
CityCompare

#Base R plot comparing cities
boxplot(StaffedBeds ~ HospCity, data = CityCompare,
		col = c("pink", "gold"),
		xlab = c("Compare Cities"),
		ylab = c("Staffed Beds")) 

#ggplot2 comparing cities
ggplot(data = CityCompare, aes(x = StaffedBeds, y = HospCity)) +
	geom_boxplot(fill = c("pink", "gold")) + 
	xlab(c("Staffed Beds")) +
	ylab(c("Compare Cities")) +
	coord_flip() +
	theme_classic()



