# Question 1
setwd("~/Git/datasciencecoursera/")
library(curl)
dir.create("Getting and Cleaning Data")
dir.create("Getting and Cleaning Data/Quiz 1/")
list.files()
setwd("Getting and Cleaning Data/Quiz 1/")
fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv"
download.file(fileURL, destfile = "Idaho.csv", method = "curl")
dateDownloaded <- date()
list.files()
idaho <- read.csv("Idaho.csv")
sum(idaho$VAL == 24, na.rm = T)

# Question 3
setwd("/home/malte/Git/datasciencecoursera/Getting and Cleaning Data/Quiz 1")
fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FDATA.gov_NGAP.xlsx"
download.file(fileURL, destfile = "Natural Gas Acquisition Program.xlsx", method = "curl")
dateDownloaded <- date()
list.files()
library(xlsx)
colIndex <- 7:15
rowIndex <- 18:23
dat <- read.xlsx("Natural Gas Acquisition Program.xlsx", sheetIndex = 1,
                    rowIndex = rowIndex, colIndex = colIndex)
sum(dat$Zip*dat$Ext,na.rm=T) 

# Question 4
library(XML)
library(RCurl)
fileURL <- getURL("https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Frestaurants.xml")
fileURL2 <- "http://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Frestaurants.xml"
doc <- xmlTreeParse(fileURL2, useInternal = TRUE)
rootNode <- xmlRoot(doc)
xmlName(rootNode)
names(rootNode[[1]][[1]])
rootNode[[1]][[1]][[2]]
xmlSApply(rootNode, xmlValue)
zipcodes <- xpathSApply(rootNode[[1]][[1]],"//zipcode", xmlValue)
sum(zipcodes == 21231)

# Question 5
setwd("/home/malte/Git/datasciencecoursera/Getting and Cleaning Data/Quiz 1")
library(data.table)
DT <- fread("Idaho.csv")
system.time(mean(DT[DT$SEX==1,]$pwgtp15); mean(DT[DT$SEX==2,]$pwgtp15)) ## does not work
system.time(mean(DT$pwgtp15,by=DT$SEX))
