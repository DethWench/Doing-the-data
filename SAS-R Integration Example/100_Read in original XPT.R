# call library(foreign) or load "foreign" package
#that way, we can load the SAS XPT file into R

library(foreign)

#Read XPT directly off of my computer
#and convert it into a dataframe named BRFSS_a.
#You will have to edit this code to add the name of the folder
#where the XPT file is on your computer.

BRFSS_a <- read.xport("C:/NAME OF FOLDER WHERE XPT FILE IS/LLCP2020.xpt")

#check number of columns and rows

colnames(BRFSS_a)
nrow(BRFSS_a)

#export as RDS

saveRDS(BRFSS_a, file = "BRFSS_a.rds")



