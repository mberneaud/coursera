# Setting workind directory
setwd("/home/malte/Git/datasciencecoursera/RProgramming/Assignment 1")

pollutantmean <- function(directory, pollutant, id = 1:332) {
      files <- list.files(directory)
      file.paths <- paste(directory, files, sep="/")
      mean.collector <- c()
      for(i in id) {
            used.file <- read.csv(file.paths[i], header = T, sep = ",")
            mean.file <- mean(used.file[, pollutant], na.rm = T )
            mean.collector <- c(mean.collector, mean.file)
      }
      mean(mean.collector)
}


# For tests later
pollutantmean("specdata", "sulfate", 1:10)

# Function produces a knot stack overflow of some kind, but I cannot figure
# out why that is the case yet 

pollutantmean("specdata", "nitrate", 70:72)
