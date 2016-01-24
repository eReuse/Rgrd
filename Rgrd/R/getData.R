#' GetData
#' 
#' \code{getData} This function is used to return data from an API REST where url is pointing
#' @usage getData(path.devices,token)  
#' @param url an uri pointing to a resource
#' @param token a string with a valid access for a given user and resource
#' @details If name do not match to any resource returns an error. 
#' @return a list (result, error, url called)


getData <- function(url, tok){
  out <- tryCatch(
    { 
      call <- GET(url, add_headers(Authorization = paste("Token",tok)))
      aux <- content(call)
      return(list(result = aux, error=F, call = list(url = url)))
    },
    error = function(cond){
      return(list(result=cond, error=T))
    },
    finnally ={}
  )
  return(out)
}