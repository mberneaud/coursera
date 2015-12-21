setwd("/home/malte/Git/datasciencecoursera/RProgramming/Assignment 1")

corr <- function(directory, threshold = 0) {
      # creating string with "directory/filename" for loop later
      files <- list.files(directory)
      file.paths <- paste(directory, files, sep="/")
      # data frame with complete cases and valid id selector
      df <- complete(directory)
      valid.ids <- c(df$nobs > threshold)
      # creating correlation vector to be filled in loop 
      corr.vector <- c()
      for(i in seq_along(files)) { ## included hardcoding again
            if(valid.ids[i] == TRUE) { ## reads file and adds cor to corr.vector
            used.file <- read.csv(file.paths[i], header = T)
            corr.file <- cor(used.file$sulfate, used.file$nitrate, use = "complete.obs")
            corr.vector <- c(corr.vector, corr.file)
            } else { ## appends "NULL" to corr.vector if complete.obs < 150
                  corr.vector <- c(corr.vector)
            }
      }
       corr.vector
}


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
