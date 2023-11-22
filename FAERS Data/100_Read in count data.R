#load readxl package
library(readxl)

#set working directory to where our Excel file is
setwd("ADD LOCATION")

#read Excel file in as a data frame (not a tibble)
ae_a <- data.frame(read_excel("Download from web page_edited.xlsx"))
nrow(ae_a)
colnames(ae_a)

