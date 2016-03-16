
rankhospital <- function(state, outcome, num = "best") {
  ## Read outcome data
  ## Read outcome data
  outcome_data <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
  ## Check that state and outcome are valid
  try(if(nrow(outcome_data[outcome_data$State==state,])==0) stop("invalid state"))
  
  try(if(!(outcome=='heart attack' || outcome=='heart failure' || outcome=='pneumonia')) stop("invalid outcome"))
  
  ## Return hospital name in that state with the given rank
  ## Return hospital name in that state with lowest 30-day death
  state_outcome_data <- outcome_data[outcome_data$State==state,]
  state_outcome_data[ state_outcome_data == "Not Available" ] <- NA
  
  
  #state_outcome_data[state_outcome_data$Hospital.Name=="FORT DUNCAN MEDICAL CENTER",]
  if(outcome == 'heart attack'){
    
    bad <- is.na(state_outcome_data$Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack)
    state_outcome_data_good <- state_outcome_data[!bad,]
    
    state_outcome_data_outcome_sorted <- state_outcome_data_good[order(as.numeric(state_outcome_data_good$Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack), state_outcome_data_good$Hospital.Name),]
    #state_outcome_data_outcome_sorted <- state_outcome_data_outcome_sorted[!is.na(state_outcome_data_outcome_sorted$Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack),]
    state_outcome_data_outcome_sorted$Rank <- 1:nrow(state_outcome_data_outcome_sorted)
    state_outcome_data_outcome_sorted[(nrow(state_outcome_data_outcome_sorted)-6):nrow(state_outcome_data_outcome_sorted),c("Hospital.Name", "Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack", "Rank")]
    
  }
  
  if(outcome == 'heart failure'){
    
    bad <- is.na(state_outcome_data$Hospital.30.Day.Death..Mortality..Rates.from.Heart.Failure)
    state_outcome_data_good <- state_outcome_data[!bad,]
    
    state_outcome_data_outcome_sorted <- state_outcome_data_good[order(as.numeric(state_outcome_data_good$Hospital.30.Day.Death..Mortality..Rates.from.Heart.Failure), state_outcome_data_good$Hospital.Name),]
    state_outcome_data_outcome_sorted$Rank <- 1:nrow(state_outcome_data_outcome_sorted)
    state_outcome_data_outcome_sorted[(nrow(state_outcome_data_outcome_sorted)-6):nrow(state_outcome_data_outcome_sorted),c("Hospital.Name", "Hospital.30.Day.Death..Mortality..Rates.from.Heart.Failure", "Rank")]
  }
  
  if(outcome == 'pneumonia'){
    
    bad <- is.na(state_outcome_data$Hospital.30.Day.Death..Mortality..Rates.from.Pneumonia)
    state_outcome_data_good <- state_outcome_data[!bad,]
    
    state_outcome_data_outcome_sorted <- state_outcome_data_good[order(as.numeric(state_outcome_data_good$Hospital.30.Day.Death..Mortality..Rates.from.Pneumonia), state_outcome_data_good$Hospital.Name),]
    state_outcome_data_outcome_sorted$Rank <- 1:nrow(state_outcome_data_outcome_sorted)
    state_outcome_data_outcome_sorted[1:6,c("Hospital.Name", "Hospital.30.Day.Death..Mortality..Rates.from.Pneumonia", "Rank")]
  }
  
  
  ## 30-day death rate
  if(num == "best"){
    hospitalName <- state_outcome_data_outcome_sorted[1,c("Hospital.Name")]
  }else
  
  if(num == "worst"){
    hospitalName <- state_outcome_data_outcome_sorted[nrow(state_outcome_data_outcome_sorted),c("Hospital.Name")]
  }else
  
  if(num >=1 && num <= nrow(state_outcome_data_outcome_sorted)){
    hospitalName <- state_outcome_data_outcome_sorted[num,c("Hospital.Name")]
  }else{
    hospitalName <- NA
  }
  
  hospitalName
}

source("rankhospital.R")
rankhospital("TX", "heart failure", 4)
rankhospital("MD", "heart attack", "worst")
rankhospital("MN", "heart attack", 5000)

rankhospital("NC", "heart attack", "worst")
rankhospital("WA", "heart attack", 7)
rankhospital("TX", "pneumonia", 10)
rankhospital("NY", "heart attack", 7)
