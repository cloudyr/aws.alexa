#' Category Listing
#'
#' Uses data from \url{http://www.dmoz.org}. For any given category, it returns a list of site listings contained within that category.
#' 
#' @param path  String; Required; valid category path
#' @param description Boolean; Optional; Whether or not to return descriptions of categories; Default is TRUE
#' @param sort_by  sort results by Popularity, Title, or AverageReview 
#' @param recursive Boolean; Whether to return listings for the current category only, or for the current category plus all subcategories, Default is TRUE
#' @param start index of result at which to start; default is 0
#' @param count Number of results to return for this request; Max = 20; Default = 20
#' @param \dots Additional arguments passed to \code{\link{alexa_GET}}.
#' 
#' @return data.frame
#'  
#' @export
#' @references \url{http://docs.aws.amazon.com/AlexaWebInfoService/latest/ApiReference_CategoryListingsAction.html}
#' @examples \dontrun{
#' category_listing(path="Top/Arts")
#' }

category_listing <- function(path = path, sort_by="Popularity", recursive = TRUE, start = 0, count = 20, description = TRUE, ...) {
    
   query <-  list(Action = "CategoryListings", ResponseGroup="Listings", SortBy = sort_by, Path =  path, 
   				  Start = start, Recursive = recursive, Count = count, Descriptions = description)

   cat_list <- alexa_GET(query, ...)

   do.call(rbind.fill, lapply(cat_list[[2]][[1]][[1]][[3]], as.data.frame))
}
