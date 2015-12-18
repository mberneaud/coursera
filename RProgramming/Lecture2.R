setwd("/home/malte/Git/datasciencecoursera/RProgramming")
for(i in 1:10) {
      print(i)
}
x <- matrix(1:6, 2, 3)

# First function
add2 <-function(x, y) {
      x + y
}

# with loop
above10 <- function(x) {
      use <- x > 10
      x[use]
}

# with specified number
above <- function(x, n){
      use <- x > n
      x[use]
}

# messing around (like Roger wanted)
test <- c(1:15)
above(test, 7)

# with default value for n
above <- function(x, n = 10){
      use <- x > n
      x[use]
}

columnmean <- function(y) {
      nc <- ncol(y)
      means <- numeric(nc)
      for(i in 1:nc) {
            means[i] <- mean(y[,i])
      }
      means
}
# getting data from Hw 1
data <- read.csv("/windows/Dropbox/Coursera/R Programming/Quizzes/Quiz 1/hw1_data.csv")

columnmean(data)


