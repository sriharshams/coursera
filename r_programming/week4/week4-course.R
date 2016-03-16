str(str)
str(lm)
str(ls)
x <- rnorm(100, 2, 4)
str(x)
summary(x)
f <- gl(40, 10)
str(f)
summary(f)
library(datasets)
head(airquality)
str(airquality)
m <- matrix(rnorm(100), 10, 10)
str(m)
m[,1]
s <- split(airquality, airquality$Month)
str(s)


x <- rnorm(10)
x
x <- rnorm(10, 20, 2)
x
summary(x)


set.seed(1)
rnorm(5)

set.seed(20)
x <- rnorm(100)
x
e <- rnorm(100, 0, 2)
e

y <- 0.5 + 2*x + e
y
summary(y)
plot(x, y)


set.seed(10)
x <- rbinom(100, 1, 0.5)
x
e <- rnorm(100, 0, 2)
e

y <- 0.5 + 2*x + e
y
summary(y)
plot(x, y)


set.seed(1)
x <- rnorm(100)
log.mu <- 0.5 + 0.3 * x
y <- rpois(100, exp(log.mu))
summary(y)
plot(x, y)


set.seed(1)
sample(1:10, 4)
sample(1:10, 4)
sample(letters, 5)
sample(1:10)
sample(1:10)
sample(1:10, replace = TRUE)



system.time(readLines("http://www.jhsph.edu"))

hilbert <- function(n){
  i <- 1:n
  1 / outer(i-1, i, "+")  
}

x <- hilbert(1000)
system.time(svd(x))

system.time({
  n <- 1000
  r <- numeric(n)
  for(i in 1:n){
    x <- rnorm(n)
    r[i] <- mean(x)
  }
})



set.seed(1)
rpois(5, 2)


set.seed(10)
x <- rep(0:1, each = 5)
x
e <- rnorm(10, 0, 20)
y <- 0.5 + 2 * x + e
summary(y)
plot(x, y)


library(datasets)
Rprof()
fit <- lm(y ~ x1 + x2)
Rprof(NULL)
