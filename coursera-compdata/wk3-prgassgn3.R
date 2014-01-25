filepath <- "~/Documents/R/outcome-of-care-measures.csv"

outcome <- read.csv(filepath, colClasses="character")

# get list of states with over 20 hospitals
states <- table(outcome$State)
states <- states[ which(states > 20) ]

# filter outcome by names of states
outcome2 <- subset(outcome, State %in% names(states))

death <- as.numeric(outcome2[, 11])
state <- outcome2$State
state <- reorder(state, death, median, na.rm=TRUE)
par(las=2)
boxplot(death ~ state, main="Heart Attack 30-day Death Rate by State", ylab="30-day Death Rate")
