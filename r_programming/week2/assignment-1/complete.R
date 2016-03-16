complete <- function(directory, id = 1:332){
  getwd()
  setwd("C:/learning/coursera/data_science/r_programming/week2/assignment-1")
  ids <- c()
  nobs <- c()
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
    ids <- c(ids, i)
    nobs <- c(nobs, nrow(pmdata_good))
  }
  
  pmdata.df <- data.frame(id = ids, nobs = nobs )
  
  pmdata.df
}

complete("specdata", 1)
complete("specdata", c(2, 4, 8, 10, 12))
complete("specdata", 30:25)
complete("specdata", 3)

cc <- complete("specdata", c(6, 10, 20, 34, 100, 200, 310))
print(cc$nobs)

cc <- complete("specdata", 54)
print(cc$nobs)


set.seed(42)
cc <- complete("specdata", 332:1)
use <- sample(332, 10)
print(cc[use, "nobs"])
