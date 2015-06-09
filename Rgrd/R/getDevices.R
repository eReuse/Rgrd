#' Get Devices
#' 
#' \code{getDevicesJson} This function returns all devices stored on GRD.
#' @usage getDevices(url)
#' @param url an uri pointing to a RESTful API to provide a list of devices
#' @details Not finished
#' @return A list of 3 values. result is a json, error is a logical, call is list of one value (url called)
#' @seealso http://sandbox.ereuse.org/swagger-ui/#!/default/get_api_devices

getDevicesJson <- function(url){
  out <- tryCatch(
    { 
      
      if(devicesExists) {
        rGet    = getURL(url)
        return(list(result = rGet, error=F, call = list(url = url)))        
      } else {
        return(list(result = simpleError(message = "Url Not exists"), error=T))        
      }              
    },
    error = function(cond){
      return(list(result=cond, error=T))
    },
    finnally ={}
  )
return(out)
}
