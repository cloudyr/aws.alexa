#' Sites linking to the site
#'
#' 
#' @param url  String; Required; valid url
#' @param start index of result at which to start; default = 0
#' @param count Number of results to return for this request; Max = 20; Default = 20
#' 
#' @return data.frame
#'  
#' @export
#' @references \url{http://docs.aws.amazon.com/AlexaWebInfoService/latest/ApiReference_SitesLinkingInAction.html}
#' @examples \dontrun{
#' in_links(url="http://www.google.com")
#' }

in_links <- function(url = NULL, start = 0, count = 20) {
    
   query <-  list(Action = "SitesLinkingIn", Url = url, Start = start, Count = count)

   cat_list <- aws.alexa_GET(query)

   cat_list
}