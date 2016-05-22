
#Get data
getwd()
#Note: This directory needs to be changed based on the required directory for data location
setwd("C:/learning/coursera/coursera-data_science-data/exploratory_data_analysis/week1/data")

filename <- "avgpm25.csv"

## Download the dataset:
if (!file.exists(filename)){
  fileURL <- "https://raw.githubusercontent.com/jtleek/modules/master/04_ExploratoryAnalysis/exploratoryGraphs/data/avgpm25.csv"
  download.file(fileURL, filename, mode='wb', cacheOK=FALSE)
} 

pollution <- read.csv(filename, colClasses = c("numeric", "character", "factor", "numeric", "numeric"))
head(pollution)

#Simple summaries of data, one dimension
#Five-number  summary (6-number)
summary(pollution$pm25)

# Box plot
boxplot(pollution$pm25, col = "blue")
abline(h = 12)

# Histograms & density plot
hist(pollution$pm25, col = "green", breaks = 100)
abline(v = 12, lwd = 2)
abline(v = median(pollution$pm25), col = "magenta", lwd = 4)

rug(pollution$pm25)

#barplot
barplot(table(pollution$region), col = "wheat", main = "Number of Counties in Each Region")

# Simple smmaries of Data 2 dimensoins

# Multiple / overlayed 1-D plots(Lattice / ggplot2)
# Multople Boxplots
boxplot(pm25 ~ region, data = pollution, col = "red")

par(mfrow = c(2, 1), mar = c(4, 4, 2, 1))
hist(subset(pollution, region == "east")$pm25, col = "green")
hist(subset(pollution, region == "west")$pm25, col = "green")

# Scatterplots
with(pollution, plot(latitude, pm25, col = region))
abline(h = 12, lwd = 2, lty = 2)

par(mfrow = c(2, 1), mar = c(5, 4, 2, 1))
with(subset(pollution, region == "west"), plot(latitude, pm25, main = "West"))
with(subset(pollution, region == "east"), plot(latitude, pm25, main = "East"))

# Smooth scatterplots

# > 2 dimensions

# Overlayed/ multiple 2-D plots : coplots

# Use color, size, shape to add dimensions

# Spinning plots

# Actual 3-D plots (not that useful)

#baseplot
library(datasets)
data(cars)

with(cars, plot(speed, dist))

#latticeplot xyplot, bwplot
library(lattice)
state <- data.frame(state.x77, region = state.region)
xyplot(Life.Exp ~ Income | region, data = state, layout = c(4,1))

# ggplot2  mixes baseplot & lattice plot
library(ggplot2)
data(mpg)
qplot(displ, hwy, data = mpg)

#baseplot system (graphics : plot, hist, boxplot, grDevices : X11, PDF, PostScript, PNG etc)

#Latticeplot system (lattice : xyplot, bwplot, levelplot, grid : lattice uses grid)

hist(airquality$Ozone)
with(airquality, plot(Wind, Ozone))
boxplot(Ozone ~ Month, airquality, xlab = "Month", ylab = "Ozone (ppb)")

par("lty")
par("mar")
par("mfrow")

with(airquality, plot(Wind, Ozone))
title(main = "Ozone and Wind in New York City")

#baseplot with annotation
with(airquality, plot(Wind, Ozone, main = "Ozone and Wind in New York City"))
with(subset(airquality, Month == 5), points(Wind, Ozone, col = "blue"))
with(subset(airquality, Month != 5), points(Wind, Ozone, col = "red"))
legend("topright", pch = 1, col = c("blue", "red"), legend = c("May", "Other Months"))

#baseplot with regression line
with(airquality, plot(Wind, Ozone, main = "Ozone and Wind in New York City", pch = 20))
model <- lm(Ozone ~ Wind, airquality)
abline(model, lwd = 2)

#multiple baseplots
par(mfrow = c(1,2))
with(airquality, {
  plot(Wind, Ozone, main = "Ozone and Wind")
  plot(Solar.R, Ozone, main = "Ozone and Solr Radiation")
})

par(mfrow = c(1, 3), mar = c(4, 4, 2, 1), oma = c(0, 0, 2, 0))
with(airquality, {
  plot(Wind, Ozone, main = "Ozone and Wind" )
  plot(Solar.R, Ozone, main = "Ozone and Solar Radiation")
  plot(Temp, Ozone, main = "Ozone and Temperature")
  mtext("Ozone and Weather in New York City", outer = TRUE)
})

x <- rnorm(100)
hist(x)

y <- rnorm(100)
plot(x, y)

z <- rnorm(100)
plot(x, z)

par(mar = c(4, 4, 2, 2))

plot(x, y, pch = 20)
plot(x, y, pch = 19)
plot(x, y, pch = 2)
plot(x, y, pch = 3)
plot(x, y, pch = 4)

example(points)

plot(x, y, pch = 20)
title("Scatterplot")
text(-2, -2, "Label")
legend("topright", legend = "Data", pch = 20)
fit <- lm(y ~ x)
abline(fit)
abline(fit, lwd = 3, col = "red")
plot(x, y, xlab ="Weight", ylab = "height", main = "Scatterplot", pch = 20)

z <- rpois(100, 2)
par(mfrow = c(2,1))
plot(x, y, pch = 20 )
plot(x, z, pch = 20)

par("mar")
par(mar = c(2, 2, 1, 1))

par(mfrow = c(1,2))
plot(x, y, pch = 20 )
plot(x, z, pch = 20)
par(mar = c(4, 4, 2, 2))

par(mfrow = c(2, 2))
plot(x, y)
plot(x, z)
plot(z, x)
plot(y, x)

par(mfcol = c(2, 2))
plot(x, y)
plot(x, z)
plot(z, x)
plot(y, x)

par(mfrow = c(1, 1))
x <- rnorm(100)
y <- x + rnorm(100)
g <- gl(2, 50)
g <- gl(2, 50, labels = c("Male", "Female"))
str(g)
plot(x, y)
plot(x, y, type = "n")
points(x[g=="Male"], y[g=="Male"], col ="blue")
points(x[g=="Female"], y[g=="Female"], col ="red", pch = 19)
?Devices

with(faithful, plot(eruptions, waiting))
title(main = "Old Faithful gyser data")

getwd()
setwd("C:/learning/coursera/coursera-data_science-data/exploratory_data_analysis/week1")
pdf(file = "myplot.pdf")
with(faithful, plot(eruptions, waiting))
title(main = "Old Faithful gyser data")
dev.off()

with(faithful, plot(eruptions, waiting))
title(main = "Old Faithful gyser data")
dev.copy(png, file = "geyserplot.png")
dev.off()
