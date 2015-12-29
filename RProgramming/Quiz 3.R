# Question 1
library(datasets)
data(iris)
df <- data.frame(iris)
mean(df$Petal.Length[df$Species == "virginica"], na.rm = TRUE)

# Question 2
apply(iris, 2, mean)
sum(complete.cases(iris[, 1:4]))
apply(iris, 1, mean)
apply(iris[, 1:4], 2, mean)

# Question 3
library(datasets)
data(mtcars)
lapply(mtcars, mean)
mean(mtcars$mpg, mtcars$cyl)
with(mtcars, tapply(mpg, cyl, mean))

# Question 4
vectorbycyl <- with(mtcars, tapply(hp, cyl, mean))
difference <- vectorbycyl["4"] - vectorbycyl["8"]
