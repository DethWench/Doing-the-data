#read in data

goofy <- read.csv(file = "Goofy Data.csv", header = TRUE, sep = ",")

#call library

library(rmeta)

#make calculations

calc <- meta.DSL(Trt_Denom, Cnt_Denom, Trt_Num, Trt_Num, data=goofy, names=Name)

summary(calc)

#make plot

plot(calc)

