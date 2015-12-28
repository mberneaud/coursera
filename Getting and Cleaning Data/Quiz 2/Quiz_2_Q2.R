library(sqldf)
setwd("/home/malte/Git/datasciencecoursera/Getting and Cleaning Data/Quiz 2")
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06pid.csv"
download.file(fileUrl, "acs.csv", method = "curl")
acs <- read.csv("acs.csv")

optionA <- sqldf("select pwgtp1 from acs where AGEP < 50")
summary(optionA)
optionD <- sqldf("select * from acs where AGEP < 50 and pwgtp1")
str(optionD)
summary(optionD)
