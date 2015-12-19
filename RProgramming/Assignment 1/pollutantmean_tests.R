# testing stuff
setwd("/home/malte/Git/datasciencecoursera/RProgramming/Assignment 1")
directory <- "specdata"
files <- list.files(directory)
file.paths <- paste(directory, files, sep="/")

test <- function(directory) {
      files <- list.files(directory)
      file.paths <- paste(directory, files, sep="/")
      file.paths
}
test("specdata")

# bring to file
file.paths <- test("specdata")


# calculating means
pollutant <- "sulfate"
used.file <- read.csv(file.paths[2], header = T, sep = ",")
mean.file <- mean(used.file[, pollutant], na.rm = T)
mean.collector <- c()
mean.collector <- c(mean.collector, mean.file)

mean(used.file[, 2], na.rm = T)







