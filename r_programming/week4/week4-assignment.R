setwd("C:/learning/coursera/data_science/r_programming/week4")
getwd()
outcome <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
head(outcome)
ncol(outcome)
#46
nrow(outcome)
#4706
names(outcome) 
#1 Plot the 30-day mortality rates for heart attack
outcome[, 11] <- as.numeric(outcome[, 11])
hist(outcome[, 11])


#2 Finding the best hospital in a state
best <- function(state, outcome) {
  ## Read outcome data
  outcome <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
  ## Check that state and outcome are valid
  
  ## Return hospital name in that state with lowest 30-day death
  ## rate
}

source("best.R")
best("TX", "heart attack")
