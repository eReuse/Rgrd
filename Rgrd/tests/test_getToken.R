test_getToken <- function(username,password){
  # Init
  dfTest  <- data.frame(i=1:7,test="",result = F, stringsAsFactors = F)
  url     <- "http://sandbox.ereuse.org/api-token-auth/"
  i       <- 1
  #init test calls
  test= "All correct"
  token     <- suppressWarnings(getToken(url=url, username, password))
  result    <- is.character(token$result)
  dfTest[i,2:3] <- c(as.character(test),result)
  i <- i + 1
  
  test= "Url is NULL"
  urlWrong  <- NULL
  token     <- suppressWarnings(getToken(url=urlWrong, username, password))
  result    <- token$result$message == "Some arguments are NULL"
  dfTest[i,2:3] <- c(as.character(test),result)
  i <- i + 1
  
  test= "Username is NULL"
  usernameWrong  <- NULL
  token     <- suppressWarnings(getToken(url=url, username = usernameWrong, password))
  result    <- token$result$message == "Some arguments are NULL"
  dfTest[i,2:3] <- c(as.character(test),result)
  i <- i + 1
  
  test = "Username is not a string"
  usernameWrong  <- 324234
  url       <- "http://sandbox.ereuse.org/api-token-auth/"
  token     <- suppressWarnings(getToken(url=url, username = usernameWrong, password))
  result    <- token$result$message == "BAD REQUEST\r\n"
  dfTest[i,2:3] <- c(as.character(test),result)
  i <- i + 1
  
  test = "Url not exists"
  urlWrong  <- "http://sasken-auth/sas"
  token     <- suppressWarnings(getToken(url=urlWrong, username, password))
  token$result$message == "Not Found\r\n"
  dfTest[i,2:3] <- c(as.character(test),result)
  i <- i + 1
  
  test = "Username or password incorrect - test username"
  usernameWrong ="ereu"
  token   <- suppressWarnings(getToken(url, username = usernameWrong , password))
  token$result$message == "BAD REQUEST\r\n"
  dfTest[i,2:3] <- c(as.character(test),result)
  i <- i + 1
  
  test = "Username or password incorrect - test password"
  passWrong = "incorrect"
  token     <- suppressWarnings(getToken(url, username, password = passWrong))
  token$result$message == "BAD REQUEST\r\n"
  dfTest[i,2:3] <- c(as.character(test),result)
  return(dfTest)
}