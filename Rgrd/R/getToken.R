
#' Get Token
#' 
#' \code This function is used to get authentication token to access to your grd session. This will enable many bits of functionality as well as allow other commands to provide more options
#' @usage getToken(urlToken, username, password)
#' @param url an uri pointing to a RESTful API to provide a token access, http://sandbox.ereuse.org/api-token-auth/
#' @param The username (string) provided by ereuse.org federated platforms.
#' @param The password (string) provided by ereuse.org federated platforms.
#' @details 
#' @return a string with a token id
#' @seealso http://sandbox.ereuse.org/swagger-ui/#!/default/post_api_token_auth
#' @examples 

getToken <- function(url,username,password){
  result    <- postForm(uri = url, username=username, password = password,.checkParams = TRUE, style = 'HTTPPOST')
  data      <- rjson::fromJSON  (result, method = "C", unexpected.escape = "skip")
  return(data$token)  
}
