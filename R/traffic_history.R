#' Get Traffic History of a URL
#'
#' @param url String; Required; valid url
#' @param range Integer; Required; Default is 31, Maximum is 31. Pick an integer between 1 and 31. 
#' @param start String; Required; A date within the last 4 years in format YYYYMMDD.
#' @param \dots Additional arguments passed to \code{\link{alexa_GET}}.
#' 
#' @return data.frame with the following columns: date, page_views_per_million, page_views_per_user, rank, reach_per_million
#'  
#' @export
#' @references \url{http://docs.aws.amazon.com/AlexaWebInfoService/latest/ApiReference_TrafficHistoryAction.html}
#' 
#' @examples \dontrun{
#' traffic_history(url="http://www.google.com", start="20160505")
#' }

traffic_history <- function(url = NULL, range=31, start=NULL, ...) {
    
    if (!is.character(url)) {
        stop("Must specify url")
    }

    if (!is.numeric(range) | (range < 1 | range > 31)) {
        stop("Range must be between 1 and 31.")
    }
    
    if (is.na(as.Date(start, "%Y%m%d"))) {
        stop("Date is not in the right format. The correct format is YYYYMMDD")
    }

    query <-  list(Action = "TrafficHistory", Url = url, ResponseGroup="History", range=range, start=start)
    traffic_payload <- alexa_GET(query, ...)
    
    res <- do.call(rbind, lapply(lapply(traffic_payload[[2]][[1]], "[[", 4)[[1]], unlist))
    res <- as.data.frame(res, row.names= 1:length(res))
    names(res) <- c("date", "page_views_per_million", "page_views_per_user", "rank", "reach_per_million")

    res
}

 