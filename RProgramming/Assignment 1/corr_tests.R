# Test area for parts of function
directory <- "specdata"
threshold <- c(150)
files <- list.files(directory)
files.index <- as.factor(files)
file.paths <- paste(directory, files, sep="/")
corr.vector <- c()
used.file <- read.csv(file.paths[1], header = T)
complete.file <- sum(complete.cases(used.file))
test <- complete.file > threshold
cor <- cor(used.file$nitrate, used.file$sulfate, use = "complete.obs")
corr.vector <- c(corr.vector, cor)
corr.vector
