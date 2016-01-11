setwd("~/Git/datasciencecoursera/Getting and Cleaning Data/Quiz 3")

# Question 1
fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv"
download.file(fileURL, "acs.csv", method = "curl")
file <- read.csv("acs.csv")
dateDownloaded <- date()
write(dateDownloaded, "DateDownloaded")


agricultureLogical <- file$ACR == 3 & file$AGS == 6
table(agricultureLogical)
# solution
head(which(agricultureLogical), n = 3)

# Question 2
library(jpeg)
fileURL2 <- "https://d396qusza40orc.cloudfront.net/getdata%2Fjeff.jpg"
download.file(fileURL2, "jtleek.jpg", method = "curl")
list.files()
jeff <- readJPEG("jtleek.jpg", native = TRUE)
quantile(jeff, probs = c(0.3, 0.8))

# Question 3
# Dataset 1
fileURL3 <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv"
download.file(fileURL3, "GDP.csv", method = "curl")
GDP <- read.csv("GDP.csv", skip = 5, header = FALSE)
CleanGDP <- GDP[1:231, c(1, 2, 4, 5)]
names(CleanGDP) <- c("CountryID", "Ranking", "FullName", "GDP")


# Dataset 2
library(dplyr)
fileURL4 <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FEDSTATS_Country.csv"
download.file(fileURL4, "educ.csv", method = "curl")
EDUC <- read.csv("educ.csv")
merged <- merge(CleanGDP, EDUC, by.x = "CountryID", by.y = "CountryCode")
#merged <- merge(GDP, EDUC, by.x = "X", by.y = "CountryCode")
merged[, "Ranking"] <- sapply(merged[, "Ranking"], unclass)
class(merged$Ranking)
merged2 <- arrange(merged, desc(Ranking))

