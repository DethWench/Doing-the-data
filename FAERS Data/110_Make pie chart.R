#Assemble plot dataframe
Type <- c("Use Errors", "Other Errors", "Unclassified")
Proportion <- c(total_useerrors/total_cases, 
			total_nonuseerrors/total_cases,
			total_unclass/total_cases)
plot_df <- data.frame(Type, Proportion)

#create and export pie chart
pie_colors <- c("paleturquoise4","orchid4",
  "palegreen4")

library(ggplot2)

pie <- ggplot(plot_df, aes("", Proportion, fill = Type)) +
    	geom_bar(width = 1, size = 1, color = "white", 
          stat = "identity") +
    	coord_polar("y") +
    	geom_text(aes(label = paste0(round(Proportion*100,0), "%")), 
              position = position_stack(vjust = 0.5)) +
    	labs(x = NULL, y = NULL, fill = NULL, 
         title = "Distribution of Error Classifications") +
    	guides(fill = guide_legend(reverse = TRUE)) +
    	scale_fill_manual(values = pie_colors) +
    	theme_classic() +
   	theme(axis.line = element_blank(),
          axis.text = element_blank(),
          axis.ticks = element_blank(),
          plot.title = element_text(hjust = 0.5, 
            color = "black"))

ggsave(file = "pie.png",
	units = c("in"),
	width = 8,
	height = 5.5,
	dpi = 300,
	pie)
		
