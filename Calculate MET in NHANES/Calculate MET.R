#use haven to read in *.xpt files
library(haven)

#Step 1: Read in XPT data file
#Note: replace the path with the path to where you stored the *.xpt file
#Original data file from here: https://wwwn.cdc.gov/nchs/nhanes/search/datapage.aspx?Component=Questionnaire&Cycle=2017-2020
#Look under "Physical Activity"
PAQ_a <- read_xpt("C:/Data/P_PAQ.xpt")

#Step 2: Transform variables to calculate MET
#You need to keep them and just make the value 0 if it is missing
#or an unacceptable value
PAQ_a$USE610 <- PAQ_a$PAQ610
PAQ_a$USE610[PAQ_a$PAQ610 > 7 | is.na(PAQ_a$PAQ610)] <- 0
table(PAQ_a$USE610, useNA = c("always"))

PAQ_a$USE615 <- PAQ_a$PAD615
PAQ_a$USE615[PAQ_a$PAD615 > 840 | is.na(PAQ_a$PAD615)] <- 0
table(PAQ_a$USE615, useNA = c("always"))

PAQ_a$USE625 <- PAQ_a$PAQ625
PAQ_a$USE625[PAQ_a$PAQ625 > 7 | is.na(PAQ_a$PAQ625)] <- 0
table(PAQ_a$USE625, useNA = c("always"))

PAQ_a$USE630 <- PAQ_a$PAD630
PAQ_a$USE630[PAQ_a$PAD630 > 900 | is.na(PAQ_a$PAD630)] <- 0
table(PAQ_a$USE630, useNA = c("always"))

PAQ_a$USE640 <- PAQ_a$PAQ640
PAQ_a$USE640[PAQ_a$PAQ640 > 7 | is.na(PAQ_a$PAQ640)] <- 0
table(PAQ_a$USE640, useNA = c("always"))

PAQ_a$USE645 <- PAQ_a$PAD645
PAQ_a$USE645[PAQ_a$PAD645 > 840 | is.na(PAQ_a$PAD645)] <- 0
table(PAQ_a$USE645, useNA = c("always"))

PAQ_a$USE655 <- PAQ_a$PAQ655
PAQ_a$USE655[PAQ_a$PAQ655 > 7 | is.na(PAQ_a$PAQ655)] <- 0
table(PAQ_a$USE655, useNA = c("always"))

PAQ_a$USE660 <- PAQ_a$PAD660
PAQ_a$USE660[PAQ_a$PAD660 > 480 | is.na(PAQ_a$PAD660)] <- 0
table(PAQ_a$USE660, useNA = c("always"))

PAQ_a$USE670 <- PAQ_a$PAQ670
PAQ_a$USE670[PAQ_a$PAQ670 > 7 | is.na(PAQ_a$PAQ670)] <- 0
table(PAQ_a$USE670, useNA = c("always"))

PAQ_a$USE675 <- PAQ_a$PAD675
PAQ_a$USE675[PAQ_a$PAD675 > 600 | is.na(PAQ_a$PAD675)] <- 0
table(PAQ_a$USE675, useNA = c("always"))

#Step 3: Calculate components
PAQ_a$Vig <- 8*PAQ_a$USE610*PAQ_a$USE615
PAQ_a$Mod <- 4*PAQ_a$USE625*PAQ_a$USE630
PAQ_a$Trans <- 4*PAQ_a$USE640*PAQ_a$USE645
PAQ_a$VigRec <- 8*PAQ_a$USE655*PAQ_a$USE660
PAQ_a$ModRec <- 4*PAQ_a$USE670*PAQ_a$USE675

#Step 4: Add up components
PAQ_a$MET_min <- PAQ_a$Vig + PAQ_a$Mod + PAQ_a$Trans + PAQ_a$VigRec + PAQ_a$ModRec



