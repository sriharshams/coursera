getwd()
read.csv('mydata.csv')
dir()
x<-1
print(x)
x
msg <- "Hello"
msg
x <- ## Incomplete message
2
x
X <- 1:20
X

x <- c(0.5, 0.6) ##numeric
x
x<-c(TRUE, FALSE) ##logical 
y<-c(T,F) ##logicaal
x<-c("a","b","c") ##character
x<-9:29  ## integer
x
x<-c(1+0i, 2+4i) ##complex
x
x<-vector("numeric", length=10)
x
y<-c(1.7, "a") ##character
y
y<-c(TRUE, 2) ##numeric
y
y<-c("a", TRUE) ##character
y
x<-0:6
x
class(x)
as.numeric(x)
as.logical(x)
as.character(x)

x<-c("a","b","c")
as.numeric(x)
as.logical(x)
as.complex(x)

x<-list(1, "a", TRUE, 1+4i)
x

m<-matrix(nrow=2, ncol=3)
m
dim(m)
attributes(m)
m<-matrix(1:6, nrow=2, ncol=3)
m
m<-1:10
m
dim(m)<-c(2,5)
m
dim(m)
x<-1:3
y<-10:12
cbind(x,y)
rbind(x,y)

x<- factor(c("yes","yes","no", "yes", "no"))
x
table(x)
unclass(x)


x<-factor(c("yes","yes","no", "yes", "no"), levels = c("yes","no"))
x

x<-c(1, 2, NA, 10, 3)
x
is.na(x)

is.nan(x)

x<-c(1, 2, NaN, NA, 4)
x
is.na(x)
is.nan(x)

x<- data.frame(foo=1:4, bar=c(T,T,F,F))
x
nrow(x)
ncol(x)

x<-1:3
x
names(x)
names(x) <- c("foo", "bar", "norf")
x
names(x)

x<-list(a=1, b=2, c=3)
x

m<-matrix(1:4, nrow=2, ncol=2)
m
dimnames(m)<-list(c("a", "b"), c("c", "d"))
m

y <- data.frame(a=1, b = "a")

dput(y)
getwd()
setwd("C:/learning/coursera/data_science/r_programming")
dput(y, file = "y.R")
new.y <- dget("y.R")
new.y

x <- "foo"
y <- data.frame(a=1, b="a")
y
dump(c("x", "y"), file="data.R")
rm(x,y)
source("data.R")
y
x

x<-c("a","b","c","c", "d","a") 
x[1]
x[2]
x[1:4]
x[x>"a"]
u <- x>"a"
u
x[u]
x<-list(foo=1:4, bar=0.6)
x[1]
x[[1]]
x$bar
x[["bar"]]
x["bar"]

x<-list(foo=1:4, bar=0.6, baz="hello")

x[c(1,3)]
name<-"foo"
x[[name]]
x$name
x$foo
x<-list(a=list(10,12,14), b=c(3.14,2.18))
x
x[[c(1,3)]]
x[[1]][[3]]
x[[c(2,1)]]
x[[2]][[1]]

x<-matrix(1:6, 2,3)
x[1,2]
x[2,1]
x[1,]
x[2,]
x[,2]
x[1,2]
x[1,2, drop=FALSE]

x[1,]
x[1,,drop=FALSE]
x<-list(aardvarl = 1:5)
x$a
x[["a", exact=FALSE]]
x<-c(1,2,NA,4,NA,5)
bad<-is.na(x)
bad
x[!bad]
y <- c("a", "b", NA, "d", NA, "f")
good <- complete.cases(x,y)
good
x[good]
y[good]

airquality[1:6, ]
good <- complete.cases(airquality)
airquality[good, ][1:6, ]

x <- 1:4; y <- 6:9
x+y
x>2
x>=2
y==8
x*y
x/y
x <- matrix(1:4, 2, 2); y <- matrix(rep(10,4), 2, 2)
y
x*y
x/y
x %*% y

## week 1 assignment
x<-4
class(x)

x<-c(4,TRUE)
class(x)

x <- c(1,3,5)
y <- c(3,2,10)
z<-cbind(x,y)
dim(z)

x <- list(2, "a", "b", TRUE)
class(x[[1]])

x <- 1:4
y <- 2:3
z<-x+y
x
y
z
class(z)


x <- c(17, 14, 4, 5, 13, 12, 10)

x[x>10]<-4
x

x[x>=11]<-4
x

getwd()
dataset_q1 <- read.csv("hw1_data.csv")
colnames(dataset_q1)
head(dataset_q1,2)
summary(dataset_q1)
dim(dataset_q1)
tail(dataset_q1,2)

dataset_q1[c(Ozone,47)]
dataset_q1[[Ozone]]

dataset_q1$Ozone[47]
good <- dataset_q1$Ozone
bad <- is.na(dataset_q1$Ozone)
length(good[!bad])
noNaOzone <- good[!bad]
153-116
mean(noNaOzone)

good <- complete.cases(dataset_q1)
dataset_q1_18a <- dataset_q1[good,]
dataset_q1_18b <- dataset_q1_18a[dataset_q1_18a$Ozone>31 & dataset_q1_18a$Temp>90,]
mean(dataset_q1_18b$Solar.R)

head(dataset_q1_18a,2)
dataset_q1_19 <- dataset_q1[dataset_q1$Month==6,]
mean(dataset_q1_19$Temp)

dataset_q1_20 <- dataset_q1_18a[dataset_q1_18a$Month==5,]
max(dataset_q1_20$Ozone)
