#read in data

metric_plot_data <- readRDS("metric_plot_data.rds")

#Basic ggplot with default colors

library(ggplot2)

ggplot(metric_plot_data, aes(x=Measure, y=Mean, fill=Group)) +
	geom_bar(position=position_dodge(), stat="identity") +
	ylab("Mean (mm)") + 
	xlab("Measurement")