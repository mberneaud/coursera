# Setting workind directory
setwd("/windows/Dropbox/Coursera/R_Programming/Week 2")

pollutantmean <- function(directory, pollutant, id = 1:332) {
      files <- list.files(directory)
      file.paths <- paste(directory, files, sep="/")
      for(i in id) {
            used.file <- read.csv(file.paths[i], header = T, sep = ",")
            mean.file <- mean(used.file[, pollutant], na.rm = T)
            mean.collector <- c()
            mean.collector <- c(mean.collector, mean.file)
      }
      mean(mean.collector)
}

# For tests later
pollutantmean("specdata", "sulfate", 1:10)
