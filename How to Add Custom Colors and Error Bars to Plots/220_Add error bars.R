#read in data

metric_plot_data <- readRDS("metric_plot_data.rds")

#add error bars

library(ggplot2)

cool_colors <- c("#00FFED", "#004CFF", "#ED3B61", "#EDED44")

ggplot(metric_plot_data, aes(x=Measure, y=Mean, fill=Group)) +
	geom_bar(position=position_dodge(), stat="identity", color='black') +
	ylab("Mean (mm)") + 
	xlab("Measurement") +
	scale_fill_manual(values=cool_colors) + 
	geom_errorbar(aes(ymin=Mean-SE, ymax=Mean+SE), width=.2, position=position_dodge(.9))