library(swirl)

library(datasets)
data(iris)
?iris
mean(iris$Sepal.Length)
names(iris)
apply(iris[, 1:4], 2, mean)
colMeans(iris)
rowMeans(iris[, 1:4])
apply(iris, 1, mean)
apply(iris[, 1:4], 1, mean)
apply(iris, 2, mean)


library(datasets)
data(mtcars)
names(mtcars)
mean(mtcars$mpg, mtcars$cyl)
tapply(mtcars$mpg, mtcars$cyl, mean)
str(mtcars)

apply(mtcars, 2, mean)
sapply(split(mtcars$mpg, mtcars$cyl), mean)
tapply(mtcars$cyl, mtcars$mpg, mean)
sapply(mtcars, cyl, mean)
with(mtcars, tapply(mpg, cyl, mean))
lapply(mtcars, mean)
split(mtcars, mtcars$cyl)


names(mtcars)

tapply(mtcars$hp, mtcars$cyl, mean)

209.21429 - 82.63636
209 - 83

debug(ls)
ls()


names(iris)

tapply(iris$Sepal.Length, iris$Species, mean)
