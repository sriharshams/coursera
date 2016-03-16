rankall <- function(outcome, num = "best") {
  ## Read outcome data
  outcome_data <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
  outputdf <- data.frame(hospital=character(), state = character())
  states <- outcome_data[!duplicated(outcome_data[c('State')]),]$State
  states <- sort(states)
  ## Check that state and outcome are valid
  #try(if(nrow(outcome_data[outcome_data$State==state,])==0) stop("invalid state"))
  
  try(if(!(outcome=='heart attack' || outcome=='heart failure' || outcome=='pneumonia')) stop("invalid outcome"))
  
  ## Get data per sate
  for(state in states ){
    state_outcome_data <- outcome_data[outcome_data$State==state,]
    state_outcome_data[ state_outcome_data == "Not Available" ] <- NA
    
    
    
    if(outcome == 'heart attack'){
      
      bad <- is.na(state_outcome_data$Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack)
      state_outcome_data_good <- state_outcome_data[!bad,]
      
      state_outcome_data_outcome_sorted <- state_outcome_data_good[order(as.numeric(state_outcome_data_good$Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack), state_outcome_data_good$Hospital.Name),]
      state_outcome_data_outcome_sorted$Rank <- 1:nrow(state_outcome_data_outcome_sorted)
      #state_outcome_data_outcome_sorted[(nrow(state_outcome_data_outcome_sorted)-6):nrow(state_outcome_data_outcome_sorted),c("Hospital.Name", "Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack", "Rank")]
      
    }
    
    if(outcome == 'heart failure'){
      
      bad <- is.na(state_outcome_data$Hospital.30.Day.Death..Mortality..Rates.from.Heart.Failure)
      state_outcome_data_good <- state_outcome_data[!bad,]
      
      state_outcome_data_outcome_sorted <- state_outcome_data_good[order(as.numeric(state_outcome_data_good$Hospital.30.Day.Death..Mortality..Rates.from.Heart.Failure), state_outcome_data_good$Hospital.Name),]
      state_outcome_data_outcome_sorted$Rank <- 1:nrow(state_outcome_data_outcome_sorted)
      #state_outcome_data_outcome_sorted[(nrow(state_outcome_data_outcome_sorted)-6):nrow(state_outcome_data_outcome_sorted),c("Hospital.Name", "Hospital.30.Day.Death..Mortality..Rates.from.Heart.Failure", "Rank")]
    }
    
    if(outcome == 'pneumonia'){
      
      bad <- is.na(state_outcome_data$Hospital.30.Day.Death..Mortality..Rates.from.Pneumonia)
      state_outcome_data_good <- state_outcome_data[!bad,]
      
      state_outcome_data_outcome_sorted <- state_outcome_data_good[order(as.numeric(state_outcome_data_good$Hospital.30.Day.Death..Mortality..Rates.from.Pneumonia), state_outcome_data_good$Hospital.Name),]
      state_outcome_data_outcome_sorted$Rank <- 1:nrow(state_outcome_data_outcome_sorted)
      #state_outcome_data_outcome_sorted[1:6,c("Hospital.Name", "Hospital.30.Day.Death..Mortality..Rates.from.Pneumonia", "Rank")]
    }
    #print(state)
    #print(nrow(state_outcome_data_outcome_sorted))
    
    
    
    if(num == "best"){
      hospitalName <- state_outcome_data_outcome_sorted[1,c("Hospital.Name")]
      state <- state_outcome_data_outcome_sorted[1,c("State")]
      outputdf <- rbind(outputdf, data.frame(hospital=hospitalName, state = state))
    }else
      
    if(num == "worst"){
      
      count = nrow(state_outcome_data_outcome_sorted)
      hospitalName <- state_outcome_data_outcome_sorted[count,c("Hospital.Name")]
      state <- state_outcome_data_outcome_sorted[count,c("State")]
      outputdf <- rbind(outputdf, data.frame(hospital=hospitalName, state = state))
      
    }else
      
    if(num >=1 && num <= nrow(state_outcome_data_outcome_sorted)){
      hospitalName <- state_outcome_data_outcome_sorted[num,c("Hospital.Name")]
      state <- state_outcome_data_outcome_sorted[num,c("State")]
      outputdf <- rbind(outputdf, data.frame(hospital=hospitalName, state = state))
    }else{
      hospitalName <- NA
      outputdf <- rbind(outputdf, data.frame(hospital=hospitalName, state = state))
      
    }
    
    
  }
  
  ## For each state, find the hospital of the given rank
  ## Return a data frame with the hospital names and the
  ## (abbreviated) state name
  outputdf <- outputdf[order(outputdf$state),]
  outputdf
}

head(rankall("heart attack", 20), 10)
tail(rankall("pneumonia", "worst"), 3)
tail(rankall("heart failure"), 10)

r <- rankall("heart attack", 4)
as.character(subset(r, state == "HI")$hospital)


r <- rankall("pneumonia", "worst")
as.character(subset(r, state == "NJ")$hospital)

r <- rankall("heart failure", 10)
as.character(subset(r, state == "NV")$hospital)
