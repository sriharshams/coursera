corr <- function(directory, threshold = 0){
  pmdata.df <- complete("specdata")
  #print(pmdata.df)
  pmdata_df_threshold <- pmdata.df[pmdata.df$nobs > threshold, ]
  #print(pmdata_df_threshold)
  cr <- c()
  if(nrow(pmdata_df_threshold) > 0){
    for(i in 1:nrow(pmdata_df_threshold)) {
      row <- pmdata_df_threshold[i,]
      id <- row$id
      
      if(id<10){
        filename <- paste(getwd(),"/",directory,"/00",id,".csv", sep="")
      }else if(id<100){
        filename <- paste(getwd(),"/",directory,"/0",id,".csv", sep="")
      }else{
        filename <- paste(getwd(),"/",directory,"/",id,".csv", sep="")
      }
      
      pmdata <- read.csv(filename)
      good <- complete.cases(pmdata)
      pmdata_good <- pmdata[good,]
      
      cr <- c(cr, round(cor(pmdata_good$sulfate, pmdata_good$nitrate), digit=5))
      
    }
  }
  cr  
}

cr <- corr("specdata", 150)
head(cr)
summary(cr)

cr <- corr("specdata", 400)
head(cr)
summary(cr)

cr <- corr("specdata", 5000)
summary(cr)
length(cr)


cr <- corr("specdata")
summary(cr)
length(cr)


cr <- corr("specdata")                
cr <- sort(cr)                
set.seed(868)                
out <- round(cr[sample(length(cr), 5)], 4)
print(out)



cr <- corr("specdata", 129)                
cr <- sort(cr)                
n <- length(cr)                
set.seed(197)                
out <- c(n, round(cr[sample(n, 5)], 4))
print(out)


cr <- corr("specdata", 2000)                
n <- length(cr)                
cr <- corr("specdata", 1000)                
cr <- sort(cr)
print(c(n, round(cr, 4)))