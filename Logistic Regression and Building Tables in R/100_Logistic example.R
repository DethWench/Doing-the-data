#read in a subset of BRFSS data
BRFSS <- readRDS(file="BRFSS_i.rds")
colnames(BRFSS)
nrow(BRFSS)

#Hypothesis: Having no insurance plan (NOPLAN)
# is a risk factor for poor health (POORHLTH)
# after controlling for education (LOWED and SOMECOLL)

LogisticModel <- glm(POORHLTH ~ NOPLAN + LOWED + SOMECOLL, 
	data = BRFSS, family = "binomial")

summary(LogisticModel)
class(LogisticModel)

#What are the ORs?
library (devtools)
library (broom)

TidyModel <- tidy(LogisticModel)
class(TidyModel)
TidyModel 

#Add calculations
TidyModel$OR <- exp(TidyModel$estimate)
TidyModel$LL <- exp(TidyModel$estimate - (1.96 * TidyModel$std.error))
TidyModel$UL <- exp(TidyModel$estimate + (1.96 * TidyModel$std.error))
TidyModel

#export as a dataframe
write.csv(TidyModel, "TidyModel.csv")

#Make a coefficine plot
#NOTE: This plot is NOT using the UL and LL in the graph
#It is using 2 SE's for the error bars
library(arm)
VarLabels=c("Intercept", "No Insurance", "HS Diploma", "Some College")
par(mai=c(1.5,0,0,0))
coefplot(LogisticModel,
	vertical=FALSE, 
	ylim=c(-1, 1.5),
	main="Risk Factors for Poor Health",
	varnames=VarLabels,
	col=c("darkblue", "darkorange", "blueviolet", "darkgreen"))

