#read in analytic
plot_df <- readRDS(file = "Figure_Data.rds")

#look at colnames and what the data look like
colnames(plot_df)
head(plot_df, 5)

#This is a legend to the text_scale_options entries below.
#Text scale options are:
#c(intersection size title (Counts of Patterns of Conditions), 
#	intersection size tick labels (numbers up vertical y-axis), 
#	set size title (Counts by Single Chronic Condition), 
#	set size tick labels (numbers across x-axis), 
#	set names (disease names), 
#	numbers above bars)

#I created different options so I could see which ones I liked best
text_scale_options1 <- c(1, 1, 1, 1, 0.75, 1)
text_scale_options2 <- c(1.3, 1.3, 1, 1, 2, 0.75)
text_scale_options3 <- c(1.5, 1.25, 1.25, 1, 2, 1.5)

#setting colors
#this can also be done with hexadecimal
main_bar_col <- c("violetred4")
sets_bar_col <- c("turquoise4")
matrix_col <- c("slateblue4")
shade_col <- c("wheat4")

#I called it "1" because I anticipated others
#but never needed them
mb_ratio1 <- c(0.55,0.45)

#This is the vector of variables to be graphed
#They are the colnames of the plot_df.
#I suppose I could have automated this, but I fought with this code a lot.
#Importantly, if you want these labels to be different,
#you have to change the column names in the df.

set_vars <- c("Asthma", "Heart Attack", "CHD", "Stroke", 
			"COPD", "Arthritis", "Depression", "Kidney Dis.", "Diabetes")

#these are the libraries you need
library(UpSetR)
library(ggplot2)

upset(plot_df, 
	sets = set_vars,
	mb.ratio = mb_ratio1, 
	mainbar.y.label = "Counts by Pattern of Conditions", 
	sets.x.label = "Counts by Condition",
	order.by = "freq",
	show.numbers = FALSE,
	point.size = 2, 
	line.size = 1,
	text.scale=text_scale_options3,
	main.bar.color = main_bar_col,
	sets.bar.color = sets_bar_col,
	matrix.color = matrix_col,
	shade.color = shade_col)

#ggsave doesn't work - only saves a portion

