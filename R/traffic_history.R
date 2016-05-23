#' Get Traffic History of a URL
#'
#' @param url String; Required; valid url
#' @param range Integer; Required; Default is 31, Maximum is 31. Pick an integer between 1 and 31. 
#' @param start String; Required; A date within the last 4 years in format YYYYMMDD.
#' 
#' @return list
#'  
#' @export
#' @references \url{http://docs.aws.amazon.com/AlexaWebInfoService/latest/ApiReference_TrafficHistoryAction.html}
#' 
#' @examples \dontrun{
#' traffic_history(url="http://www.google.com", start="20160505")
#' }

traffic_history <- function(url = NULL, range=31, start=NULL) {
    
   if (is.null(url)) stop("Must specify url")
   if (range < 1 | range > 31) stop("Range must be between 1 and 31.")

   query <-  list(Action = "TrafficHistory", Url = url, ResponseGroup="History", range=range, start=start)

   traffic <- aws.alexa_GET(query)

   traffic
}