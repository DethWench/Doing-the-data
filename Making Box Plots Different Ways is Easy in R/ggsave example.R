#read in dataframe
CityCompare <- read.csv("CityCompare.csv", header = TRUE, sep = ",")
CityCompare

#call up ggplot2
library(ggplot2)

#run the plot in question
#and save it to an object
boxplot_figure <- ggplot(data = CityCompare, aes(x = StaffedBeds, y = HospCity)) +
	geom_boxplot(fill = c("pink", "gold")) + 
	xlab(c("Staffed Beds")) +
	ylab(c("Compare Cities")) +
	coord_flip() +
	theme_classic()

#save the box plot as PNG
#with these specifications
#in the working directory
ggsave(file = "Compare Cities Box Plot.png", 
	units = c("in"),
	width = 8,
	height = 5.5,
	dpi = 300,
	boxplot_figure) 
