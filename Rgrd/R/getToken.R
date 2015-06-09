
#' Get Token
#' 
#' \code{getToken} This function is used to get authentication token to access to your grd session. This will enable many bits of functionality as well as allow other commands to provide more options
#' @usage getToken(url = "xxx", username = "xxx", password = "xxx")
#' @param url an uri pointing to a RESTful API to provide a token access
#' @param username (string) provided by ereuse.org federated platforms.
#' @param password (string) provided by ereuse.org federated platforms.
#' @details If username or password is invalid HTTP Status Code = 400
#' @return a list (result, error, call())
#' @return result contains token id#' 
#' @seealso http://sandbox.ereuse.org/swagger-ui/#!/default/post_api_token_auth

getToken <- function(url,username,password){
  out <- tryCatch(
    { 
      if(!is.null(url)&!is.null(username)&!(is.null(password))){
        raux    <- RCurl::postForm(uri = url, username=username, password = password,.checkParams = TRUE, style = 'HTTPPOST')
        djson   <- rjson::fromJSON  (raux, method = "C", unexpected.escape = "skip")
        return(list(result = djson$token, error=F, call = list(url = url, username = username)))        
      } else {
        return(list(result = simpleError(message = "Some arguments are NULL"), error=T))        
      }               
    },
    error = function(cond){
      return(list(result=cond, error=T))
    },
    finnally ={}
  )
return(out)
}
