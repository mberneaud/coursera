setwd("/home/malte/Git/datasciencecoursera/Getting and Cleaning Data/Quiz 2")
fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fwksst8110.for"
download.file(fileURL, "foreign.for", method = "curl")

library(readr)

data <- read_fwf(
      file="foreign.for",   
      skip=4,
      fwf_widths(c(11, 9, 4, 9, 4, 9, 4, 9, 3)))

answer <- sum(data[ , 4])