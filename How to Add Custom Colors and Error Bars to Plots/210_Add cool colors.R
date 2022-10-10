#read in data

metric_plot_data <- readRDS("metric_plot_data.rds")

#add cool colors using Coolors

library(ggplot2)

cool_colors <- c("#00FFED", "#004CFF", "#ED3B61", "#EDED44")

ggplot(metric_plot_data, aes(x=Measure, y=Mean, fill=Group)) +
	geom_bar(position=position_dodge(), stat="identity", color='black') +
	ylab("Mean (mm)") + 
	xlab("Measurement") +
	scale_fill_manual(values=cool_colors)

##WARNING: UGLY DEFAULT

ggplot(metric_plot_data, aes(x=Measure, y=Mean, fill=Group)) +
	geom_bar(position=position_dodge(), stat="identity") +
	ylab("Mean (mm)") + 
	xlab("Measurement")


##WENTE VINEYARD PALETTE

wente_sky <- c("#3a73b3")	#rgb(74,115,179)
wente_leaf <- c("#687839")	#rgb(104,120,57)
wente_pole <- c("#544646") 	#rgb(84,70,70)
wente_ground <- c("#b99b75")	#rgb(185,155,117)
wente_colors <- c(wente_sky, wente_leaf, wente_pole, wente_ground)

ggplot(metric_plot_data, aes(x=Measure, y=Mean, fill=Group)) +
	geom_bar(position=position_dodge(), stat="identity", color='black') +
	ylab("Mean (mm)") + 
	xlab("Measurement") +
	scale_fill_manual(values=wente_colors)


