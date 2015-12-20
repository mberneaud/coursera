setwd("/home/malte/Git/datasciencecoursera/RProgramming/Assignment 1")

complete <- function(directory, id = 1:332) {
      files <- list.files(directory)
      file.paths <- paste(directory, files, sep="/")
      ids <- c()
      nobs <- c()
      length <- length(id)
      for(i in id) {
            used.file <- read.csv(file.paths[i], header = T)
            nobs.file <- nrow(na.omit(used.file))
            nobs <- append(nobs, nobs.file)
            ids <- append(ids, id)
      }
      completecases <- data.frame("ID" = ids, "nobs" = nobs)
      comple.cases.short <- head(completecases, n = length)
      comple.cases.short
}

corr <- function(directory, threshold = 0) {
      # creating string with "directory/filename" for loop later
      files <- list.files(directory)
      file.paths <- paste(directory, files, sep="/")
      # data frame with complete cases and valid id selector
      df <- complete(directory)
      valid.ids <- c(df$nobs > threshold)
      # creating correlation vector to be filled in loop 
      corr.vector <- c(NULL)
      for(i in 1:332) { ## Unfortunately had to hardcode the length in here
            if(valid.ids[i] == TRUE) { ## reads file and adds cor to corr.vector
            used.file <- read.csv(file.paths[i], header = T)
            corr.file <- cor(used.file$sulfate, used.file$nitrate, use = "complete.obs")
            corr.vector <- c(corr.vector, corr.file)
            } else { ## appends "NULL" to corr.vector if complete.obs < 150
                  corr.vector <- c(corr.vector, NULL)
            }
      }
       corr.vector
}


# Testing
source("complete.R")
source("corr.R")

# Test 1
cr <- corr("specdata", 150)
head(cr)
summary(cr)

# Test 2
cr <- corr("specdata", 400)
head(cr)
summary(cr)

# Test 3
cr <- corr("specdata", 5000)
summary(cr)
length(cr)
