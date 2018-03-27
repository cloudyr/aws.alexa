#' Category Listing
#'
#' Uses data from \url{http://www.dmoz.org}. For any given category, 
#' it returns a list of site listings contained within that category.
#' 
#' @param path  String; Required; valid category path
#' @param description Boolean; Optional; Whether or not to return descriptions 
#' of categories; Default is TRUE
#' @param sort_by  sort results by Popularity, Title, or AverageReview 
#' @param recursive Boolean; Whether to return listings for the current 
#' category only, or for the current category plus all subcategories, 
#' Default is TRUE
#' @param start index of result at which to start; default is 0
#' @param count Number of results to return for this request; 
#' Max = 20; Default = 20
#' @param \dots Additional arguments passed to \code{\link{alexa_GET}}.
#' 
#' @return data.frame
#'  
#' @export
#' @references \url{http://docs.aws.amazon.com/AlexaWebInfoService/latest/ApiReference_CategoryListingsAction.html}
#' @examples \dontrun{
#' category_listing(path="Top/Arts")
#' }

category_listing <- function(path = NULL, sort_by = "Popularity",
             recursive = TRUE, start = 0, count = 20, description = TRUE, ...) {

  if (!is.character(path)) {
    stop("Provide a valid value for path.")
  }

  if (!is.logical(recursive)) {
    stop("Provide a valid value for recursive.")
  }

  if (!is.logical(description)) {
    stop("Provide a valid value for description.")
  }

  # Convert Boolean to String
  recursive   <- ifelse(recursive, "True", "False")
  description <- ifelse(description, "True", "False")

  query <-  list(Action = "CategoryListings", ResponseGroup = "Listings",
                 SortBy = sort_by, Path = path, Start = start,
                 Recursive = recursive, Count = count,
                 Descriptions = description)

  cat_list <- alexa_GET(query, ...)

  bind_rows(lapply(cat_list[[1]]$CategoryListingsResult$Alexa$CategoryListings$Listings,
            function(x) 
            c(data_url = x$DataUrl,
              popularity_rank = x$PopularityRank,
              title = x$Title,
              description = x$Description)))
}
