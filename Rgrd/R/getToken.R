
#' Get GRD Token
#' 
#' \code{getToken} uses getToken to get a token for GRD
#' @param url an uri, for example http://sandbox.ereuse.org/api-token-auth/
#' @param username an string with the username of a user
#' @param password an string
#' @usage urlToken  <- "http://sandbox.ereuse.org/api-token-auth/"
#' @usage token     <- getToken(urlToken, username = "xxxx", password = "xxxx")
#' @return a string qith token id


getToken <- function(url,username,password){
  result    <- postForm(uri = url, username=username, password = password,.checkParams = TRUE, style = 'HTTPPOST')
  data      <- rjson::fromJSON  (result, method = "C", unexpected.escape = "skip")
  return(data$token)  
}
