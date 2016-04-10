packages <- c("data.table", "quantmod")
sapply(packages, require, character.only = TRUE, quietly = TRUE)

getwd()
file.url <- 'https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv'
file.dest <- 'ACS.csv'
# download from the URL
download.file(file.url, file.dest )

# read the data
ACS <- read.csv('ACS.csv')

names(ACS)
splitNames = strsplit(names(ACS), "wgtp")
splitNames[123]


file.url <- 'https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv'
file.dest <- 'GDP.csv'
download.file(file.url, file.dest )
GDP <- read.csv("GDP.csv")
summary(GDP)

dtGDP <- data.table(read.csv(file.dest, skip = 4, nrows = 215, stringsAsFactors = FALSE))
dtGDP <- dtGDP[X != ""]
dtGDP <- dtGDP[, list(X, X.1, X.3, X.4)]
setnames(dtGDP, c("X", "X.1", "X.3", "X.4"), c("CountryCode", "rankingGDP", 
                                               "Long.Name", "gdp"))
gdp <- as.numeric(gsub(",", "", dtGDP$gdp))
mean(gdp, na.rm = TRUE)


isUnited <- grepl("^United", dtGDP$Long.Name)
summary(isUnited)

grep("^United", dtGDP$Long.Name)

isUnited <- grepl("United$", dtGDP$Long.Name)
summary(isUnited)

isUnited <- grepl("*United", dtGDP$Long.Name)



url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FEDSTATS_Country.csv"
f <- file.path(getwd(), "EDSTATS_Country.csv")
download.file(url, f)
dtEd <- data.table(read.csv(f))
dt <- merge(dtGDP, dtEd, all = TRUE, by = c("CountryCode"))
isFiscalYearEnd <- grepl("fiscal year end", tolower(dt$Special.Notes))
isJune <- grepl("june", tolower(dt$Special.Notes))
table(isFiscalYearEnd, isJune)
dt[isFiscalYearEnd & isJune, Special.Notes]

install.packages("quantmod")
library(quantmod)
amzn = getSymbols("AMZN",auto.assign=FALSE)
sampleTimes = index(amzn)
length(sampleTimes)
sampleTimes <- index(amzn)
addmargins(table(year(sampleTimes), weekdays(sampleTimes)))
