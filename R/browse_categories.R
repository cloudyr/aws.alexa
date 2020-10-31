#' Browse Categories
#'
#' Uses data from dmoz.org, which is no longer updated.
#'
#' @param response_group String; Required; One of the following: Categories, RelatedCategories, LanguageCategories, LetterBars
#' @param path  String; Required; valid category path
#' @param description Boolean; Optional; Whether or not to return descriptions of categories; Default is TRUE
#' @param \dots Additional arguments passed to \code{\link{alexa_GET}}.
#'
#' @return data.frame with 5 columns: \code{path, title, sub_category_count, total_listing_count, description}
#'
#' @export
#' @references \url{https://docs.aws.amazon.com/AlexaWebInfoService/latest/index.html?ApiReference_CategoryBrowseAction.html}
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

  bind_rows(lapply(browse_cat[[1]]$CategoryBrowseResult$Alexa$CategoryBrowse$Categories, function(x)
            c(path = x$Path,
              title = x$Title,
              sub_category_count = x$SubCategoryCount,
              total_listing_count = x$TotalListingCount,
              description = x$Description)))

}
