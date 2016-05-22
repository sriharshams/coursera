
install.packages("httpuv")
library(httpuv)
library(httr)

# 1. Find OAuth settings for github:
#    http://developer.github.com/v3/oauth/
oauth_endpoints("github")


# 2. To make your own application, register at at
#    https://github.com/settings/applications. Use any URL for the homepage URL
#    (http://github.com is fine) and  http://localhost:1410 as the callback url
#
#    Replace your key and secret below.
myapp <- oauth_app("githubMSr", key = "15ce40f6551120791e1d", secret = "84d45733ba8173bebf4212387132cd9829162b5f")

# 3. Get OAuth credentials
github_token <- oauth2.0_token(oauth_endpoints("github"), myapp)


# 4. Use API
gtoken <- config(token = github_token)
gtoken
req <- GET("https://api.github.com/users/jtleek/repos", gtoken)
stop_for_status(req)

library(jsonlite)
request <- content(req)
json2 = jsonlite::fromJSON(toJSON(request)) 
names(json2)
data <- json2[json2$url=="https://api.github.com/repos/jtleek/datasharing",]
names(data)
data$created_at


## Quiz 2
install.packages("sqldf")
library(sqldf)
data()
sqldf("select * from iris limit 5")

getwd()
setwd("C:/learning/coursera/coursera-data_science-data/getting_and_cleaning_data/week2")
acs <- read.csv("getdata-data-ss06pid.csv", header = TRUE)

sqldf("select * from acs")
sqldf("select pwgtp1 from acs")
sqldf("select * from acs where AGEP < 50 and pwgtp1")
sqldf("select pwgtp1 from acs where AGEP < 50")
names(acs)

##Quiz 3
unique(acs$AGEP)
length(unique(acs$AGEP))
sqldf("select distinct AGEP from acs")

## Quiz 4 
con = url("http://biostat.jhsph.edu/~jleek/contact.html")
htmlCode = readLines(con)
close(con)
nchar(htmlCode[[10]]);nchar(htmlCode[[20]]);nchar(htmlCode[[30]]);nchar(htmlCode[[100]]);


# Quiz 5
install.packages("readr")
library(readr)

x <- read_fwf(
  file="getdata-wksst8110.for",   
  skip=4,
  fwf_widths(c(12, 7, 4, 9, 4, 9, 4, 9, 4)))
head(x)
sum(x[4]) + sum(x[9])
