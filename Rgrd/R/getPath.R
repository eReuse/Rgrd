#' GetPath
#' 
#' \code{getPath} This function is used to return the path to access API rest resources. 
#' @usage getPath(path_base = "http://sandbox.ereuse.org", name = "devices")
#' @param path_base an uri pointing to a sandbox
#' @param name (string) of the API REST resource, for example: "agents", "devices", "events",...
#' @details If name do not match to any resource returns an error. 
#' @return a list (result, error)

getPath <- function (path_base, name){
  out <- tryCatch(
    { 
      if (name=="agents") {return(list(result = paste0(path_base, "/api/agents/"), error = F))}
      else if (name=="devices") {return(list(result = paste0(path_base, "/api/devices/"), error = F))}
      else if (name=="events") {return(list(result = paste0(path_base, "/api/events/"), error = F))}
      else {return(list(result = simpleError(message = "Name do not match any path"), error = T))}
      return(out)
    },
    error = function(cond){
      return(list(result=cond, error=T))
    },
    finnally ={}
  )
  return(out)
}