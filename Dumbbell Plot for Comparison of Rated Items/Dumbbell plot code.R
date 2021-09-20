#Make dataset
Order <- c(12, 11, 10, 9, 8, 7, 6, 5, 4, 3, 2, 1)
Char <- c("Landing Page: Quality",
		"Overall Quality",
		"Reputation",
		"Internet",
		"Opportunity",
		"Clubs",
		"Happiness",
		"Location",
		"Food",
		"Facilities",
		"Social",
		"Safety")
UofMScores <- c(3.7, 3.8, 4.0, 3.6, 4.0, 3.9, 3.9, 4.1, 3.1, 3.9, 3.7, 3.3)
HVDScores <- c(3.9, 3.3, 4.0, 3.2, 3.6, 3.0, 3.0, 3.3, 3.2, 3.4, 2.8, 3.3)
WebPageScores <- as.data.frame(cbind(Order, Char, UofMScores, HVDScores))
class(WebPageScores$UofMScores)

#convert scores to numeric
WebPageScores$Order_n <- as.numeric(WebPageScores$Order)
WebPageScores$UofMScores_n <- as.numeric(WebPageScores$UofMScores)
WebPageScores$HVDScores_n <- as.numeric(WebPageScores$HVDScores)

#designate colors of the points
UofMN_col <- c("#1a759f")
HVD_col <- c("#9b2226")

#load packages
library(ggplot2) 
library(ggalt)   
library(tidyverse)

#build the plot
ggplot() +
	geom_segment(data=WebPageScores, 
		aes(y= reorder(Char, Order_n), yend=reorder(Char, Order_n), x=2, xend=5), 
		color="gray87", 
		size=0.05)+
	geom_dumbbell(data=WebPageScores, 
		aes(y=reorder(Char, Order_n), x=UofMScores_n, xend=HVDScores_n), 
		size = 1.5,
		color="black", 
		size_x = 5,
		size_xend = 5,
		colour_x = UofMN_col,
		colour_xend = HVD_col) +
	ylab(c("College Characteristic")) +
	xlab(c("Score")) +
#hand-crafted legend
  	geom_rect(aes(xmin = 2, xmax = 3, ymin = 9, ymax = 11), 
           fill = NA, alpha = 0.4, color = "black") +
	annotate("point", x = 2.2, y =10.5, size = 3, colour = UofMN_col) +
	annotate("text", x = 2.3, y=10.5, label = "U of MN \nScore", hjust=0) +
	annotate("point", x = 2.2, y = 9.5, size = 3, colour = HVD_col) +
	annotate("text", x = 2.3, y= 9.5, label = "HVD Score \nScore", hjust=0) +
	theme_classic()

#I used ggsave to export the image as a *.png
ggsave("Dumbbell Plot.png", 
	units = c("in"),
	width = 8,
	height = 5.5,
	dpi = 300) 


