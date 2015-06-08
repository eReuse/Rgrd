# Test Conenction
# 
# - Register devices: http://sandbox.ereuse.org/api/register/
# - Recycle devices (incluyendo opcionalmente los componentes que lo forman): http://sandbox.ereuse.org/api/[DEVICE_ID]/recycle/
# - Listar devices: http://sandbox.ereuse.org/api/devices/
# - Consultar los logs de un device:
# - http://sandbox.ereuse.org/api/[DEVICE_ID]/log/
# - Para ejemplos de peticiones a la API podéis consultar los tests funcionales:
#   https://github.com/eReuse/grd/blob/master/grd/tests/test_functional.py
#   




pckg = try(require(RCurl))
if(!pckg) {
  cat("Installing 'RCurl' from CRAN\n")
  getPckg("RCurl")
  require("RCurl")
}

pckg = try(require(rjson))
if(!pckg) {
  cat("Installing 'rjson' from CRAN\n")
  getPckg("rjson")
  require("rjson")
}


#' Description
#'  Get GRD user token
#' @params
#'  url:  
#'  
#' @usage:
#   funcParams="list(fileProfiles='C:/SocialValue/data/twitter/queryManager/data/analytics.5.csv',fileRepository='C:/SocialValue/data/twitter/queryManager/data/tw.network.index.csv',id='screenName', nFollowersMax = 5, nProfilesMax = 1)"
#   test <- getTwUserFollowers(funcParams)
#' @details
#' 
#funcParams="list(fileTweets = 'C:/SocialValue/data/twitter/queryManager/studies/123/bi/tw.tweets/bi.tw.tweets.csv', fileProfiles='C:/SocialValue/data/twitter/repository/profiles/profiles.csv',fileNetwork='C:/SocialValue/data/twitter/repository/network.index.csv',id='screenName', nFollowersMax = 5, nProfilesMax = 100, nMinutesWaitMax=40)"


getToken <- function(url,username,password){
  result    <- postForm(uri = url, username=username, password = password,.checkParams = TRUE, style = 'HTTPPOST')
  data      <- rjson::fromJSON  (result, method = "C", unexpected.escape = "skip")
  return(data$token)  
}

# test

urlToken  <- "http://sandbox.ereuse.org/api-token-auth/"
token     <- getToken(urlToken, username = "ereuse", password = "ereuse@grd")

