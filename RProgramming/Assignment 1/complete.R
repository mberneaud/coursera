setwd("/home/malte/Git/datasciencecoursera/RProgramming/Assignment 1")

complete <- function(directory, id = 1:332) {
      ## 'directory' is a character vector of length 1 indicating
      ## the location of the CSV files
      
      ## 'id' is an integer vector indicating the monitor ID numbers
      ## to be used
      
      ## Return a data frame of the form:
      ## id nobs
      ## 1  117
      ## 2  1041
      ## ...
      ## where 'id' is the monitor ID number and 'nobs' is the
      ## number of complete cases
      files <- list.files(directory)
      file.paths <- paste(directory, files, sep="/")
      ids <- c()
      nobs <- c()
      length <- length(id)
      #completecases <- data.frame("ID" = integer(),"nobs" = integer())
      for(i in id) {
            used.file <- read.csv(file.paths[i], header = T)
            nobs.file <- nrow(na.omit(used.file))
            nobs <- append(nobs, nobs.file)
            ids <- append(ids, id)
      }
      completecases <- data.frame("ID" = ids, "nobs" = nobs)
      comple.cases.short <- head(completecases, n = length)
      return(comple.cases.clean)
}
# Tests
source("complete.R")
complete("specdata", 1)
complete("specdata", c(2, 4, 8, 10, 12))
complete("specdata", 30:25)
complete("specdata", 3)

