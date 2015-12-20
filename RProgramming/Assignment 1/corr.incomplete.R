# Assignment 1 Part 3

corr <- function(directory, threshold = 0) {
      files <- list.files(directory)
      files.index <- as.factor(files)
      file.paths <- paste(directory, files, sep="/")
      corr.vector <- c()
      for(i in files.index) {
            used.file <- read.csv(file.paths[i], header = T)
            complete.file <- sum(complete.cases(used.file))
            if(complete.file > threshold) {
                  cor <- cor(used.file$nitrate, used.file$sulfate, use = "complete.obs")
                  corr.vector <- c(corr.vector, cor)
            } else {
                  break
            }
      }
      corr.vector
}

# Testing
setwd("/home/malte/Git/datasciencecoursera/RProgramming/Assignment 1")
source("corr.R")

cr <- corr("specdata", 150)


