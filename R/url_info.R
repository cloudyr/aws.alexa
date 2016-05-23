#' Get Information about a URL
#'
#' @param url String; Required; valid url
#' @param response_group String; Required; One of the following: RelatedLinks, Categories, Rank,  
#' RankByCountry, UsageStats, AdultContent, Speed, Language,  OwnedDomains, LinksInCount, SiteData
#' 
#' @return data.frame
#'  
#' @export
#' @references \url{http://docs.aws.amazon.com/AlexaWebInfoService/latest/ApiReference_UrlInfoAction.html}
#' @examples \dontrun{
#' url_info(domain="http://www.google.com")
#' }

url_info <- function(url = NULL, response_group = "SiteData") {
    
   if (is.null(url)) stop("Must specify url")

   query <-  list(Action = "UrlInfo", Url = url, ResponseGroup=response_group)

   urlinfo <- aws.alexa_GET(query)

   urlinfo
}