
install.packages("RMySQL")
library(RMySQL)
ucscDb <- dbConnect(MySQL(), user = "genome", host = "genome-mysql.cse.ucsc.edu")
result <- dbGetQuery(ucscDb, "show databases"); dbDisconnect(ucscDb)
result

hg19 <- dbConnect(MySQL(), user = "genome", db = "hg19", host = "genome-mysql.cse.ucsc.edu")
allTables <- dbListTables(hg19)
length(allTables)
allTables[1:5]
dbListFields(hg19, "affyU133Plus2")
dbGetQuery(hg19, "select count(*) from affyU133Plus2")
affyData <- dbReadTable(hg19, "affyU133Plus2")
head(affyData)
query <- dbSendQuery(hg19, "select * from affyU133Plus2 where misMatches between 1 and 3")
affyMis <- fetch(query)
quantile(affyMis$misMatches)
affyMisSmall <- fetch(query, n=10); dbClearResult(query);
dim(affyMisSmall)

dbDisconnect(hg19)


source("http://bioconductor.org/biocLite.R")
biocLite("rhdf5")
library(rhdf5)
created = h5createFile("example.h5")
created
created = h5createGroup("example.h5", "foo")
created = h5createGroup("example.h5", "baa")
created = h5createGroup("example.h5", "foo/foobaa")
h5ls("example.h5")

A = matrix(1:10, nr = 5, nc = 2)
h5write(A, "example.h5", "foo/A")
B = array(seq(0.1, 2.0, by = 0.1), dim = c(5,2,2))
attr(B, "scale") <- "liter"
h5write(B, "example.h5", "foo/foobaa/B")
h5ls("example.h5")
df = data.frame(1L:5L, seq(0, 1, length.out = 5 ), c("ab", "cde", "fghi", "a", "s"), stringsAsFactors = FALSE)
h5write(df, "example.h5", "df")
h5ls("example.h5")

readA = h5read("example.h5", "foo/A")
readB = h5read("example.h5", "foo/foobaa/B")
readdf = h5read("example.h5", "df")
readA

h5write(c(12, 13, 14), "example.h5", "foo/A", index = list(1:3, 1))
h5read("example.h5", "foo/A")


con = url("https://scholar.google.com/citations?user=HI-I6C0AAAAJ")
htmlCode = readLines(con)
close(con)
htmlCode

library(XML)
url <- "https://scholar.google.com/citations?user=HI-I6C0AAAAJ&hl=en"
html <- htmlTreeParse(url, useInternalNodes = TRUE)
xpathSApply(html, "//head", xmlValue)
xpathSApply(html, "//td[@class='gsc_rsb_std']", xmlValue)

library(httr)
html2 = GET(url)
content2 = content(html2, as="text")
parsedHtml = htmlParse(content2, asText = TRUE)
xpathSApply(parsedHtml, "//title", xmlValue)
xpathSApply(parsedHtml, "//td[@class='gsc_rsb_std']", xmlValue)

pg1 = GET("http://httpbin.org/basic-auth/user/passwd")
pg1

pg2 = GET("http://httpbin.org/basic-auth/user/passwd", authenticate("user", "passwd"))
pg2
names(pg2)

google = handle("http://google.com")
pg1 = GET(handle = google, path="/")
pg2 = GET(handle = google, path="serach")


myapp = oauth_app("twitter", key="IsAkRYvhlhgTL6TszudzqDC25", secret = "bym73Qh93ATdO1bo0rkMofEFDJOdvRiVAN7wxDdwPEVziPkdvJ")

sig = sign_oauth1.0(myapp, token = "36918611-z0OEdeB4A6qqX8pt4fqYTmsjIRTCQe6srTCkVt7f3", 
                              token_secret = "1Nva344Udk5xbCjJZxUKCEU8jnGZHiBCtabv3lMKrSJFh")

library(jsonlite)
homeTL = GET("https://api.twitter.com/1.1/statuses/home_timeline.json", sig)
homeTL

json1 = content(homeTL)
json2 = jsonlite::fromJSON(toJSON(json1)) 
json2[1, 1:4]
                    