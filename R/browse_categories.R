#' Browse Categories
#'
#' Uses data from \url{http://www.dmoz.org}
#' 
#' @param response_group String; Required; One of the following: Categories, RelatedCategories, LanguageCategories, LetterBars
#' @param path  String; Required; valid category path
#' @param description Boolean; Optional; Whether or not to return descriptions of categories; Default is TRUE
#' @param \dots Additional arguments passed to \code{\link{alexa_GET}}.
#' 
#' @return data.frame with 5 columns: path, title, sub_category_count, total_listing_count, description
#'  
#' @export
#' @references \url{http://docs.aws.amazon.com/AlexaWebInfoService/latest/index.html?ApiReference_CategoryBrowseAction.html}
#' @examples \dontrun{
#' browse_categories(path="Top/Arts")
#' }

browse_categories <- function(path = NULL, response_group = "Categories",
                                                      description = TRUE, ...) {

  if (!is.character(path)) {
    stop("Please specify a valid path.")
  }

  if (!is.logical(description)) {
    stop("Please provide a valid value for description.")
  }

  if (!(response_group %in% c("Categories", "RelatedCategories",
                                         "LanguageCategories", "LetterBars"))) {
    stop("Please provide a valid value for response_group.")
  }

  # Convert Boolean to String
  description <- ifelse(description, "True", "False")

  query <-  list(Action = "CategoryBrowse", ResponseGroup = response_group,
                                        Path = path, Descriptions = description)

  browse_cat <- alexa_GET(query, ...)

  if (is.null(browse_cat[[2]][[1]][[1]][[1]])) {
    message("No Results. It is likely that the path you provided is incorrect.")
    return(NULL)
  }

  res <- do.call(rbind.fill, lapply(browse_cat[[2]][[1]][[1]][[1]], data.frame))
  names(res) <- c("path", "title", "sub_category_count", "total_listing_count",
                                                                  "description")
  res
}
