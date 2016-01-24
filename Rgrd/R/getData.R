#' GetData
#' 
#' \code{getData} This function is used to return data pointing to an url resource
#' @usage getData(url = "http://sandbox.ereuse.org/api/devices/",token = "f012ee230b324f384f4def745ed0a8702adc9452")  
#' @param url an uri pointing to a resource
#' @param token a string with a valid access for a given user and resource
#' @details These command will return any authorized data for a given uri resource. 
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