pollutantmean <- function(directory, pollutant, id = 1:332){
  getwd()
  setwd("C:/learning/coursera/data_science/r_programming/week2/assignment-1")
  pmdata_list <- list.files(directory)
  mean_p <- 0
  sum_p <- 0
  count_p <- 0
  
  for(i in id){
    #print(i)
    if(i<10){
      filename <- paste(getwd(),"/",directory,"/00",i,".csv", sep="")
    }else if(i<100){
      filename <- paste(getwd(),"/",directory,"/0",i,".csv", sep="")
    }else{
      filename <- paste(getwd(),"/",directory,"/",i,".csv", sep="")
    }
    #print(filename)
    pmdata <- read.csv(filename)
    good <- complete.cases(pmdata)
    pmdata_good <- pmdata[good,]
    if(nrow(pmdata_good[pollutant]) > 1){
      sum_p <- sum_p + sum(pmdata[pollutant], na.rm = TRUE)
    
      count_p <- count_p + sum(!is.na(pmdata[pollutant]) )
    }
    #print(sum_p)
    #print(count_p)
  }
  
  if(sum_p != 0 && count_p != 0){
    mean_p <- sum_p / count_p
  }

  round(mean_p, digits = 3)
}


pollutantmean("specdata", "nitrate", 23)
pollutantmean("specdata", "nitrate", 70:72)
pollutantmean("specdata", "sulfate", 1:10)
pollutantmean("specdata", "nitrate", 286)

pollutantmean("specdata", "sulfate", 1:10)
pollutantmean("specdata", "nitrate", 70:72)
pollutantmean("specdata", "sulfate", 34)
pollutantmean("specdata", "nitrate")
