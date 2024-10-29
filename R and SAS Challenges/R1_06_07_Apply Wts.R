#WTINTPRP = Full sample interview weight
#SDMVPSU = Masked variance pseudo-PSU
#SDMVSTRA = Masked variance pseudo-stratum
#RIAGENDR = Gender

#read in demographic
library(foreign)

DG_a <- read.xport("P_DEMO.xpt")
nrow(DG_a)

#make variables

DG_a$One <- c(1)

DG_a$WOMAN <- 0
DG_a$WOMAN[DG_a$RIAGENDR == 2] <- 1

table(DG_a$RIAGENDR, DG_a$WOMAN, useNA = c("always"))


#construct design

library(survey)

options(survey.lonely.psu = "adjust" )

nhanes_design <-
    svydesign(
        id = ~ SDMVPSU,
        strata = ~ SDMVPSU,
        data = DG_a ,
        weight = ~ WTINTPRP,
        nest = TRUE)

nhanes_design <- 
    update( 
        nhanes_design,
       
        WOMAN_f = factor(WOMAN, levels = c(0,1), labels = c("Not Woman", "Woman")))

#weighted proportions
svymean(~WOMAN_f, nhanes_design, na.rm = TRUE)

#weighted counts
svytotal( ~ One , nhanes_design)

svyby( ~ One , ~ WOMAN_f, nhanes_design, svytotal)


