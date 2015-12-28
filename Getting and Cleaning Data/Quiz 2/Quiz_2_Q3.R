library(sqldf)

uniques.simple <- unique(acs$AGEP)
optionB <- sqldf("select AGEP where unique from acs") ## "unique" produces syntax error
optionD <- sqldf("select distinct AGEP from acs")