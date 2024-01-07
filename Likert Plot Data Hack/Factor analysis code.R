#set the working directory to the directory where you put data
setwd("C:/Users/dethw/Dropbox/Timon Coaching/Data Scientist Program/Frontend Offer/Events/RTS4_Great R Packages/Analytics/Data")

#read in IDMot
analytic <- readRDS("IdentityStudy.rds")

#set up vector subscales
#no reverse coded items

Ident_Vars <- c("IDMot_Ident1", "IDMot_Ident2", "IDMot_Ident3", 
			"IDMot_Ident4", "IDMot_Ident5")

TC_Vars <- c("IDMot_TC1", "IDMot_TC2", "IDMot_TC3", "IDMot_TC4")

BI_Vars <- c("IDMot_BI1", "IDMot_BI2", "IDMot_BI3", "IDMot_BI4")

#separate and alpha

library(psych)

Ident <- analytic[Ident_Vars]
colnames(Ident)
alpha(Ident)

TC <- analytic[TC_Vars]
colnames(TC)
alpha(TC)

BI <- analytic[BI_Vars]
colnames(BI)
alpha(BI)

factor_vars <- c(Ident_Vars, TC_Vars, BI_Vars)
factor_p_df <- analytic[factor_vars]

library(psych)

fit3 <- principal(factor_p_df, nfactors=3, rotate="varimax")
fit3


fit4 <- principal(factor_p_df, nfactors=4, rotate="varimax")
fit4

fit5 <- principal(factor_p_df, nfactors=5, rotate="varimax")
fit5

#scree plot

library(nFactors)

ev <- eigen(cor(factor_p_df)) # get eigenvalues
ap <- parallel(subject=nrow(factor_p_df),var=ncol(factor_p_df),
  rep=100,cent=.05)
nS <- nScree(x=ev$values, aparallel=ap$eigen$qevpea)
plotnScree(nS)





