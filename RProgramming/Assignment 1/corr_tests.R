# Test area for parts of function
# Retired Function
setwd("/home/malte/Git/datasciencecoursera/RProgramming/Assignment 1")
directory <- "specdata"
threshold <- c(150)
files <- list.files(directory)
files.index <- as.factor(files)
file.paths <- paste(directory, files, sep="/")
corr.vector <- c(NULL)
used.file <- read.csv(file.paths[1], header = T)
complete.file <- sum(complete.cases(used.file))
test <- complete.file > threshold
cor <- cor(used.file$nitrate, used.file$sulfate, use = "complete.obs")
corr.vector <- c(corr.vector, cor)
corr.vector

# New function using complete.R as nested function
df <-  complete("specdata")
threshold <- 150
valid.ids <- df[, 2][nobs > threshold]

valid.ids <- c(df$nobs > threshold)
corr.vector <- c(NULL)
length(valid.ids)
valid.ids[10]
used.file <- read.csv(file.paths[3], header = T)
corr.file <- cor(used.file$sulfate, used.file$nitrate, use = "complete.obs")
corr.vector <- c(corr.vector, corr.file)    

corr.vector <- c(corr.vector, NULL)

# Troubleshooting
summary(valid.ids)
