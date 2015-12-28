setwd("/home/malte/Git/datasciencecoursera/Getting and Cleaning Data/Quiz 2")

con <- url("http://biostat.jhsph.edu/~jleek/contact.html")
rawhtml <- readLines(con)
nchars <- nchar(rawhtml[c(10, 20, 30, 100)])
close(con)
