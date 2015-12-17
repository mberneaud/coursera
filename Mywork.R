# Question 5
x <- c(4, T)
class(x)

# Question 6
# Not needed

# Question 11 
setwd("/windows/Dropbox/Coursera/R Programming/Quizzes/Quiz 1/")
data <- read.csv("/windows/Dropbox/Coursera/R Programming/Quizzes/Quiz 1/hw1_data.csv")
head(data)

# Question 12
data[1:2, ]

# Question 13
nrow(data)

# Question 14
data[152:153, ]

# Question 15
data[47, 1]

# Question 16
sum(is.na(data[, 1]))

# Question 17
bad <- is.na(data[, 1])
mean(data[, 1][!bad])

# Question 18
bad2 <- is.na(data$Solar)
mean(data$Solar.R[data$Ozone > 31][data$Temp > 90], na.rm = T)

# Question 19
mean(data$Temp[data$Month == 6])

# Question 20
max(data$Ozone[data$Month ==5], na.rm = T)

