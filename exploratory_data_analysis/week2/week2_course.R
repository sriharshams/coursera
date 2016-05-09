
library(lattice)
library(datasets)
## simple scatterplot
xyplot(Ozone ~ Wind, data = airquality)

##Convert 'Month' to a factor variable
airquality <- transform(airquality, Month = factor(Month))
xyplot(Ozone ~ Wind | Month, data = airquality, layout = c(5,1))

p <- xyplot(Ozone ~ Wind, data = airquality)
print(p)
xyplot(Ozone ~ Wind, data = airquality)


set.seed(10)
x <- rnorm(100)
f <- rep(0:1, each = 50)
y <- x + f - f*x + rnorm(100, sd = 0.5)
f <- factor(f, labels = c("Group 1", "Group 2"))

xyplot( y ~ x | f, layout = c(2,1))

# ggplot2
library(ggplot2)
str(mpg)
summary(mpg)

# hello world of ggplot2
qplot(displ, hwy, data = mpg)
# ggplot2 with aesthetics like color
qplot(displ, hwy, data = mpg, color = drv)
# ggplot2 with loess or points & smooth (a line with 95% confidence interval grayed)
qplot(displ, hwy, data = mpg, geom = c('point', 'smooth'))
# histogram with fill feature
qplot(hwy, data = mpg, fill = drv)
# facets are like panels (in lattice / plots)
qplot(displ, hwy, data = mpg, facets = .~drv)
# facets with histogram
qplot(hwy, data = mpg, facets = drv~., binwidth = 2)

getwd()
setwd("C:/learning/coursera/coursera-data_science-data/exploratory_data_analysis/week1/data")

#eno <- read.csv("eno.csv")
#skin <- read.csv("skin.csv")
#env <- read.csv("environmental.csv")
#m <- merge(eno, env, by = "id")
#maacs <- merge(m, skin, by = "id")
load("maacs.Rda")

str(maacs)
qplot(log(eno), data = maacs)
qplot(log(eno), data = maacs, fill = mopos)

qplot(log(eno), data = maacs, geom = "density", color = mopos)
qplot(log(pm25), log(eno), data = maacs)
qplot(log(pm25), log(eno), data = maacs, shape = mopos )
qplot(log(pm25), log(eno), data = maacs, color = mopos )
qplot(log(pm25), log(eno), data = maacs, color = mopos ) + geom_smooth(method = lm)
qplot(log(pm25), log(eno), data = maacs, facets = .~mopos ) + geom_smooth(method = lm)
qplot(log(pm25), log(eno), data = maacs, facets = mopos~. ) + geom_smooth(method = lm)
names(maacs)
aplot(log(pm25), eno, data=maacs, facets = .~)

library(swirl)

library(nlme)
library(lattice)
xyplot(weight ~ Time | Diet, BodyWeight)


library(lattice)
library(datasets)
data(airquality)
p <- xyplot(Ozone ~ Wind | factor(Month), data = airquality)

library(datasets)
data(airquality)

library(ggplot2)
airquality = transform(airquality, Month = factor(Month))
qplot(Wind, Ozone, data = airquality, facets = . ~ Month)


library(ggplot2)
library(ggplot2movies)
g <- ggplot(movies, aes(votes, rating))
print(g)

library(ggplot2)
g <- ggplot(movies, aes(votes, rating))
print(g)

qplot(votes, rating, data = movies)

swirl()
