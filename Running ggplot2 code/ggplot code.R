
#building a pie chart

piechart_df <- readRDS("piechart_df.rds")

library(ggplot2)

ggplot(piechart_df, aes("", Proportion, fill = Type)) +
    geom_bar(width = 1, size = 1, color = "white", stat = "identity") +
    coord_polar("y") +
    geom_text(aes(label = paste0(round(Proportion*100,0), "%")), 
              position = position_stack(vjust = 0.5)) +
    labs(x = NULL, y = NULL, fill = NULL, 
         title = "Distribution of Media Conditions Tested") +
    guides(fill = guide_legend(reverse = TRUE)) +
    scale_fill_manual(values = pie_colors) +
    theme_classic() +
    theme(axis.line = element_blank(),
          axis.text = element_blank(),
          axis.ticks = element_blank(),
          plot.title = element_text(hjust = 0.5, color = "saddlebrown"))

pie_colors <- c("orangered4","orchid4","palegreen4","paleturquoise4","palevioletred4")

#building a line chart

timeseries_df <- readRDS("timeseries_df.rds")

library(ggplot2)
library(scales)
library(dplyr)

ggplot(timeseries_df, aes(x = Year, y = Frequency)) + 
	geom_line(aes(color = Condition_Modality), size = 1) +
	scale_color_manual(values = line_colors) +
	labs(color="DL Method Modality") +
	ylab("Frequency of DL Method Studied") +
	xlab("Year Article Published") +
	scale_x_datetime(date_breaks = "1 year", labels = date_format("%Y")) +
	theme(axis.text.x = element_text(angle=90))

line_colors <- c("slateblue4", "springgreen4", "steelblue4")

#building a bar chart

barplot_df <- readRDS("barplot_df.rds")

library(ggplot2)

ggplot(barplot_df, aes(x=Measure, y=Mean, fill=Group)) +
  geom_bar(position=position_dodge(), stat="identity", color='black') +
  geom_errorbar(aes(ymin=Mean-SE, ymax=Mean+SE), width=.2,position=position_dodge(.9)) +
  scale_fill_manual(values=bar_colors) +
  ylab("Mean Number of Cells per 45 x 50 µm") + 
  xlab("Measurement")

bar_colors <- c("tan2", "tomato2", "violetred2", "yellow2")


