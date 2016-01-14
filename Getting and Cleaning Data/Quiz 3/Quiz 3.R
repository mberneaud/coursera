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

# Answer: 125, 238,262

# Question 2
library(jpeg)
fileURL2 <- "https://d396qusza40orc.cloudfront.net/getdata%2Fjeff.jpg"
download.file(fileURL2, "jtleek.jpg", method = "curl")
list.files()
jeff <- readJPEG("jtleek.jpg", native = TRUE)
quantile(jeff, probs = c(0.3, 0.8))

# Answer: -15259150 -10575416 

# Question 3
# Loading data
library(dplyr)
library(tidyr)
fileURL3 <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv"
download.file(fileURL3, "GDP.csv", method = "curl")
gdp <- read.csv("GDP.csv", skip = 5, header = FALSE)

fileURL4 <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FEDSTATS_Country.csv"
download.file(fileURL4, "educ.csv", method = "curl")
educ <- read.csv("educ.csv")

##### Data Manipulation
###############################

# cleaning gdp and coercing CountryCode variable into characters
gdp <- gdp[1:231, c(1, 2, 4, 5)]
names(gdp) <- c("CountryCode", "Ranking", "FullName", "GDP")
gdp$CountryCode <- as.character(gdp$CountryCode)

# selecting only relevant variables from educ and and coercing CountryCode into character
educ <- educ[, 1:3]
educ$CountryCode <- as.character(educ$CountryCode)

# Merging the two data frames
merged <- merge(gdp, educ)
merged <- merged[merged$Ranking != "", ]
filter(merged, Ranking == 13)  # Using filter()
merged[merged$Ranking == 13, ]  # the classic way
# Result: 189 matches, Spain 

# Question 4
# First I have to coerce the factor ranking into a 

merged$Ranking <- as.numeric(as.character(merged$Ranking))


merged %>%
    group_by(Income.Group) %>% 
    summarise(Ranking = mean(Ranking)) %>%
    (function(x) {
        means <- x 
        print(means)
    })
# Answer: 32.9666667 91.91304

# Question 5
quantiles <- quantile(merged$Ranking, probs = seq(0, 1, .2))
merged$quantile <- cut(merged$Ranking, quantiles, include.lowest = TRUE)
table(merged$quantile, merged$Income.Group)

# Answer: 5 countries