library(dplyr)
getwd()
setwd("C:/learning/coursera/data_science/getting_and_cleaning_data/week1")
setwd("data")
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv"
download.file(fileUrl, destfile = "idaho_housing.csv")
list.files(".")
idaho_housing_df <- read.csv("idaho_housing.csv")
filter(idaho_housing_df, VAL == 24 )
str(idaho_housing_df)
select(idaho_housing_df, FES)

library(xlsx)
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FDATA.gov_NGAP.xlsx"
download.file(fileUrl, destfile = "ngap.xlsx")
colIndex2 <- 7:15
rowIndex2 <- 18:23
dat <- read.xlsx("getdata-data-DATA.gov_NGAP.xlsx", sheetIndex = 1, colIndex = colIndex2, rowIndex = rowIndex2)
sum(dat$Zip*dat$Ext,na.rm=T)


library(XML)
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Frestaurants.xml"
download.file(fileUrl, destfile = "restaurants.xml")
doc <- xmlTreeParse("restaurants.xml", useInternal = TRUE)
rootNode <- xmlRoot(doc)
xmlName(rootNode)
names(rootNode)
zipcodes <- xpathSApply(rootNode, "//zipcode", xmlValue)
sum(zipcodes==21231)

library(data.table)
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06pid.csv"
download.file(fileUrl, destfile = "idaho_housing2.csv")
DT <- fread("idaho_housing2.csv")
DT

system.time({rowMeans(DT)[DT$SEX==1]; rowMeans(DT)[DT$SEX==2]})
{rowMeans(DT)[DT$SEX==1]; rowMeans(DT)[DT$SEX==2]}
system.time(sapply(split(DT$pwgtp15,DT$SEX),mean))

sapply(split(DT$pwgtp15,DT$SEX),mean)
system.time(DT[,mean(pwgtp15),by=SEX])
DT[,mean(pwgtp15),by=SEX]
system.time(mean(DT$pwgtp15,by=DT$SEX))
mean(DT$pwgtp15,by=DT$SEX)
system.time(tapply(DT$pwgtp15,DT$SEX,mean))
tapply(DT$pwgtp15,DT$SEX,mean)
system.time({mean(DT[DT$SEX==1,]$pwgtp15); mean(DT[DT$SEX==2,]$pwgtp15)})
{mean(DT[DT$SEX==1,]$pwgtp15); mean(DT[DT$SEX==2,]$pwgtp15)}

DT <- read.table("idaho_housing2.csv", header=TRUE, sep="\t")
DT

system.time({rowMeans(DT)[DT$SEX==1]; rowMeans(DT)[DT$SEX==2]})
system.time(sapply(split(DT$pwgtp15,DT$SEX),mean))
system.time(DT[,mean(pwgtp15),by=SEX])
system.time(mean(DT$pwgtp15,by=DT$SEX))
system.time(tapply(DT$pwgtp15,DT$SEX,mean))
system.time({mean(DT[DT$SEX==1,]$pwgtp15); mean(DT[DT$SEX==2,]$pwgtp15)})
