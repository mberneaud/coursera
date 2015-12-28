# Question 1
# Copied stuff from web
library(httr)
library(httpuv)
library(jsonlite)

# 1. Find OAuth settings for github:
#    http://developer.github.com/v3/oauth/
oauth_endpoints("github")


# 2. To make your own application, register at at
#    https://github.com/settings/applications. Use any URL for the homepage URL
#    (http://github.com is fine) and  http://localhost:1410 as the callback url
#
#    Replace your key and secret below.
myapp <- oauth_app("github",
                      key = "90a6ba830329448b87fa",
                      secret = "f3d81a0d3f3e928f2a9fcd3fc6f642b771d14072")
 

# 3. Get OAuth credentials
github_token <- oauth2.0_token(oauth_endpoints("github"), myapp,cache=FALSE )
 

# 4. Use API
gtoken <- config(token = github_token)
req <- GET("https://api.github.com/users/jtleek/repos", gtoken)
stop_for_status(req)
content <- content(req) 
content2 <- jsonlite::fromJSON(toJSON(content))
content2$name ## find out which # on list for "datasharing" repo
content2$created_at[8] ## display time of creating for 8th list element (repo) 



