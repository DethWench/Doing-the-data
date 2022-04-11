timeseries_errorbars_df <- readRDS("timeseries_errorbars_df.rds")

library(ggplot2)

timeseries_error_colors <- c("red4", "navyblue")

ggplot(timeseries_errorbars_df, aes(x = Time, y = Median)) + 
	geom_line(aes(color = Group), size = 1) +
	geom_text(data=timeseries_errorbars_df, show.legend = FALSE, 
		aes(x= Time - .1, y = Median + .5, 
		label = round(Median, 0), color = Group)) +
	scale_color_manual(values = timeseries_error_colors) +
	geom_errorbar(data=timeseries_errorbars_df, 
		mapping=aes(x = Time, ymin=LL, ymax=UL), 
		width=0.1, size=.5, color="black") +
	labs(color="Group") +
	ylab("Inhibition Zone (mm)") +
	xlab("Time Measured") +
	ylim(0, 20) +
	scale_x_continuous(breaks = c(1,2,3)) +
	theme(axis.text.x = element_text(angle=90)) +
	theme_classic()



