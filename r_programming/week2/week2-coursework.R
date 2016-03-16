x <-4 
if(x > 3){
  y <- 10
}else{
  y<-0
}
y

x <- 2 
y <- if(x>3){
  10
}else{
  0
}
y

for(i in 1:10){
  print(i)
}

x <- c("a", "b", "c", "d")

for(i in 1:4){
  print(x[i])
}

for(i in seq_along(x)){
  print(x[i])
}

for(letter in x){
  print(letter)
}

for(i in 1:4) print(x[i])


x <- matrix(1:6, 2, 3)


for(i in seq_len(nrow(x))){
  for(j in seq_len(ncol(x))){
    print(x[i, j])
  }
}


count <- 0

while(count < 4){
  print(count)
  count <- count+1
}

z <- 5

while(z >= 3 && z <= 10 ){
  print(z)
  coin <- rbinom(1, 1, 0.5)
  
  if(coin == 1){ #Random walk
    z <- z + 1
  } else{
    z <- z - 1
  }
}

for( i in 1:30){
  if(i <= 20){
    next
  }
  print(i)
  
}

#First R function
add2 <- function(x, y){
  x+y
}

add2(3, 5)

above10 <- function(x){
  use <- x > 10
  x[use]
}


above10(2)

above <- function(x, n=10){
  use <- x > n
  x[use]
}

x <- 1:20
above(x, 12)

above(x)

columnmean <- function(y, removeNA = TRUE){
  nc <- ncol(y)
  means <- numeric(nc)
  for(i in 1:nc){
    means[i] <- mean(y[, i], na.rm = removeNA)
  }
  means
}

columnmean(airquality)


mydata <- rnorm(100)

sd(mydata)

sd(x=mydata)
sd(x=mydata, na.rm=FALSE)

sd(na.rm=FALSE, x= mydata)

sd(na.rm = FALSE, mydata)
args(lm)


search()


#Week 2 Quizes
3+4
cube <- function(x, n){
  x^3
}

cube(3)

x <- 1:10
if(x > 5) {
  x <- 0
}


f <- function(x) {
  g <- function(y) {
    y + z
  }
  z <- 4
  x + g(x)
}

z <- 10
f(3)

y<-1

x <- 5
y <- if(x < 3) {
  NA
} else {
  10
}

# Q5
h <- function(x, y = NULL, d = 3L) {
  z <- cbind(x, d)
  if(!is.null(y))
    z <- z + y
  else
    z <- z + f
  g <- x + y / z
  if(d == 3L)
    return(g)
  g <- g + 10
  g
}


source("pollutantmean.R")
pollutantmean("specdata", "sulfate", 1:10)
pollutantmean("specdata", "nitrate", 70:72)
pollutantmean("specdata", "nitrate", 23)



source("complete.R")
complete("specdata", 1)
complete("specdata", c(2, 4, 8, 10, 12))
complete("specdata", 30:25)
complete("specdata", 3)


source("corr.R")
source("complete.R")
cr <- corr("specdata", 150)
head(cr)
summary(cr)

cr <- corr("specdata", 400)
head(cr)
summary(cr)

cr <- corr("specdata", 5000)
summary(cr)


cr <- corr("specdata")
summary(cr)
length(cr)


#Quiz
pollutantmean("specdata", "sulfate", 1:10)
pollutantmean("specdata", "nitrate", 70:72)
pollutantmean("specdata", "sulfate", 34)
pollutantmean("specdata", "nitrate")



x <- 4
class(x)

x <- c(4, TRUE)
class(x)


x <- c(1,3, 5)
y <- c(3, 2, 10)
cbind(x, y)


x <- list(2, "a", "b", TRUE)
x[[1]]
class(x[[1]])


x <- 1:4
y <- 2:3
z <- x + y
class(z)


x <- c(17, 14, 4, 5, 13, 12, 10)
x[x > 4] <- 10


setwd("C:/learning/coursera/data_science/r_programming/week1")
data <- read.csv("hw1_data.csv")
data[1:2,]
data[(nrow(data)-1):nrow(data),]

data[47,]
nrow(data[is.na(data$Ozone),])

data_ozone_temp <- data[!is.na(data$Ozone),]

data_ozone_temp2 <- data_ozone_temp[!is.na(data_ozone_temp$Temp),]

data_ozone_temp2_O31 <- data_ozone_temp2[data_ozone_temp2$Ozone>31,]

data_ozone_temp2_O31_t90 <- data_ozone_temp2_O31[data_ozone_temp2_O31$Temp>90,]

mean(data_ozone_temp2_O31_t90$Solar.R)


data <- read.csv("hw1_data.csv")
data_m_6 <- data[data$Month==6,]
mean(data_m_6$Temp)

data <- read.csv("hw1_data.csv")
data_m_5 <- data[data$Month==5,]
data_m_5_o <- data_m_5[!is.na(data_m_5$Ozone),]
max(data_m_5_o$Ozone)
