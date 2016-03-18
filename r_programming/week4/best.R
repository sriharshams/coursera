#2 Finding the best hospital in a state
getwd()
setwd("C:/learning/coursera/coursera-data_science-data/week4")
library(dplyr)
best <- function(state, outcome) {
  #state <- 'AK'
  ## Read outcome data
  outcome_data <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
  ## Check that state and outcome are valid
  try(if(nrow(outcome_data[outcome_data$State==state,])==0) stop("invalid state"))
  
  try(if(!(outcome=='heart attack' || outcome=='heart failure' || outcome=='pneumonia')) stop("invalid outcome"))
  
  ## Return hospital name in that state with lowest 30-day death
  state_outcome_data <- outcome_data[outcome_data$State==state,]
  state_outcome_data[ state_outcome_data == "Not Available" ] = NA
  
  
  #state_outcome_data[state_outcome_data$Hospital.Name=="FORT DUNCAN MEDICAL CENTER",]
  if(outcome == 'heart attack'){
    bad <- is.na(state_outcome_data$Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack)
    state_outcome_data <- state_outcome_data[!bad,]
    
    state_outcome_data_outcome <- state_outcome_data[which.min(state_outcome_data$Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack),]
    state_outcome_data_outcome_sorted <- arrange(state_outcome_data_outcome, Hospital.Name)
    
  }
  
  if(outcome == 'heart failure'){
    bad <- is.na(state_outcome_data$Hospital.30.Day.Death..Mortality..Rates.from.Heart.Failure)
    state_outcome_data <- state_outcome_data[!bad,]
    
    state_outcome_data_outcome <- state_outcome_data[which.min(state_outcome_data$Hospital.30.Day.Death..Mortality..Rates.from.Heart.Failure),]
    state_outcome_data_outcome_sorted <- arrange(state_outcome_data_outcome, Hospital.Name)
    
  }
  
  if(outcome == 'pneumonia'){
    bad <- is.na(state_outcome_data$Hospital.30.Day.Death..Mortality..Rates.from.Pneumonia)
    state_outcome_data <- state_outcome_data[!bad,]
    
    state_outcome_data_outcome <- state_outcome_data[which.min(state_outcome_data$Hospital.30.Day.Death..Mortality..Rates.from.Pneumonia),]
    state_outcome_data_outcome_sorted <- arrange(state_outcome_data_outcome, Hospital.Name)
    
  }
  ## rate
  state_outcome_data_outcome_sorted[1,]$Hospital.Name
}

best("TX", "heart attack")
best("TX", "heart failure")
best("MD", "heart attack")
best("MD", "pneumonia")
best("BB", "heart attack")
best("NY", "hert attack")

best("SC", "heart attack")
best("NY", "pneumonia")
best("AK", "pneumonia")
