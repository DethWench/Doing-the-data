#Step 1 - Create and read in minimal dataset
survey1 <- read.csv("survey_data.csv", header = TRUE, sep = ",")

#Steps 2 and 3 - Design and make fake data
StudyID <- c("99991", "99992", "99993", "99994", "99995")
Q1 <- c(1, 2, 3, 4, 5)
Q2 <- c(1, 2, 3, 4, 5)
Q3 <- c(1, 2, 3, 4, 5)
Q4 <- c(1, 2, 3, 4, 5)
Q5 <- c(1, 2, 3, 4, 5)
fake <- data.frame(StudyID, Q1, Q2, Q3, Q4, Q5)

#Step 4 - Join fake data and convert variables to factor.
survey2 <- rbind(survey1, fake)
survey2$Q1_f <- as.factor(survey2$Q1)
survey2$Q2_f <- as.factor(survey2$Q2)
survey2$Q3_f <- as.factor(survey2$Q3)
survey2$Q4_f <- as.factor(survey2$Q4)
survey2$Q5_f <- as.factor(survey2$Q5)

#Step 5 - Attach factor levels
factor_levels <- c("Strongly Disagree", 
		"Somewhat Disagree", 
		"Neither Agree nor Disagree", 
		"Somewhat Agree", 
		"Strongly Agree")
levels(survey2$Q1_f) <- factor_levels
levels(survey2$Q2_f) <- factor_levels
levels(survey2$Q3_f) <- factor_levels
levels(survey2$Q4_f) <- factor_levels
levels(survey2$Q5_f) <- factor_levels

#Step 6 - Remove fake data rows
nrow(survey2)
survey3 <- subset(survey2, StudyID < 99991)
nrow(survey3)

#Step 7 - Remove non-plot columns and keep only Likert with levels
colnames(survey3)
survey4 <- survey3[,7:11]
colnames(survey4)

#Step 8 - Replace column headings with statements
VarHeadings <- c(	"I want to live in a world with unicorns.",
			"Whenever given a choice, I choose chocolate.",
			"My hair is too long.",
			"There really aren't any reasons to do cross-stitch.",
			"Rats are misunderstood.")
names(survey4) <- VarHeadings
colnames(survey4)

#Step 9 - Plot with legend
library(likert)
p <- likert(survey4)
a <- likert.bar.plot(p, legend.position = "right", text.size = 4) +
	theme(text = element_text(size = rel(4)),
	axis.text.y = element_text(size = rel(2))) +
	theme_update(legend.text = element_text(size = rel(0.7))) +
	theme_classic()
plot(a)