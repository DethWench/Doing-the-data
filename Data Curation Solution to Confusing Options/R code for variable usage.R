#read in dataset of Boston and Minneapolis hospitals
CityCompare <- read.csv("CityCompare.csv", header = TRUE, sep = ",")
CityCompare

library(ggplot2)

#ggplot2 box plot
#without any variables or vectors
ggplot(data = CityCompare, aes(x = StaffedBeds, y = HospCity)) +
	geom_boxplot(fill = c("pink", "gold")) + 
	xlab(c("Staffed Beds")) +
	ylab(c("Compare Cities")) +
	xlim(c(20, 1500)) 

#now we can set any variables
fill_colors <- c("pink", "gold")
x_label <- c("Staffed Beds")
y_label <- c("Compare Cities")
x_limits <- c(20, 1500)

#now we can restate the code with the variables
#and vectors and it will come out the same
ggplot(data = CityCompare, aes(x = StaffedBeds, y = HospCity)) +
	geom_boxplot(fill = fill_colors) + 
	xlab(x_label) +
	ylab(y_label) +
	xlim(x_limits) 

#What if you have the longest vector in the world
#to set a whole bunch of options for one thing?

