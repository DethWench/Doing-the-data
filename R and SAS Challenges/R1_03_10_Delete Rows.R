#read in demographic
library(foreign)

DG_a <- read.xport("P_DEMO.xpt")
nrow(DG_a)

#remove men and keep women
nrow(DG_a)
DG_b <- subset(DG_a, RIAGENDR == 2)
nrow(DG_b)


