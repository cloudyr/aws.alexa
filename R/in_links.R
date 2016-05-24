#' Sites linking to the site
#'
#' 
#' @param url  String; Required; valid url
#' @param start index of result at which to start; default = 0
#' @param count Number of results to return for this request; Max = 20; Default = 20
#' @param \dots Additional arguments passed to \code{\link{alexa_GET}}.
#' 
#' @return data.frame
#'  
#' @export
#' @references \url{http://docs.aws.amazon.com/AlexaWebInfoService/latest/ApiReference_SitesLinkingInAction.html}
#' @examples \dontrun{
#' in_links(url="google.com")
#' }

in_links <- function(url = NULL, start = 0, count = 20, ...) {
    
   query <-  list(Action = "SitesLinkingIn", ResponseGroup="SitesLinkingIn", Url = url, Start = start, Count = count)

   insite_links <- alexa_GET(query, ...)

   insite_links_request_id      <- insite_links[[1]]$OperationRequest$RequestId
   insite_links_response_status <- insite_links[[1]]$ResponseStatus$StatusCode

   cat("Request ID: ", insite_links_request_id, "\n")
   cat("Response Status: ", insite_links_response_status, "\n")

   do.call(rbind, insite_links[[1]][[2]][[1]][[1]])

}
