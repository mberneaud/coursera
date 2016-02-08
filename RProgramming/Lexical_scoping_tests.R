# Lexical scoping
y <- 10
f <- function(x) {
  y <- 2
  y^2 + g(x)
}
g <- function(x) {
  x*y
}
f(3)

# Exercises on functional programming
library(datasets)
data("mtcars")
df <- data.frame(mtcars)

coefficent.of.variation <- lapply(df, function(x) sd(x, na.rm = TRUE)/2)
df[[1]]


new_counter <- function() {
  i <- 0
  function() {
    i <<- i + 1
    i #  when we call i in the closure, it refers back to this stable environment
      #  where i does not get "reset"
  }
}
newcounter1 <- new_counter()
environment(newcounter1)
newcounter2 <- new_counter()
environment(newcounter2)
newcounter2()
newcounter2()

# what happens without the <<-
new_counter3 <- function() {
  i <- 0
  function() {
    i <- i + 1
    i
  }
}
new_counter3()
