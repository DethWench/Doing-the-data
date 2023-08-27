#read in data

metric_plot_data <- readRDS("metric_plot_data.rds")

#add annotation

library(ggplot2)

cool_colors <- c("#00FFED", "#004CFF", "#ED3B61", "#EDED44")

ggplot(metric_plot_data, aes(x=Measure, y=Mean, fill=Group)) +
	geom_bar(position=position_dodge(), stat="identity", color='black') +
	ylab("Mean (mm)") + 
	xlab("Measurement") +
	scale_fill_manual(values=cool_colors) +
	geom_text(aes(label=round(Mean, 0)), position=position_dodge(width=0.9), vjust=1.125)+
	annotate("text", x = 1.5, y = 210, size = 8, label = "Hi Mom!" )