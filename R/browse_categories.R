#' Browse Categories
#'
#' Uses data from \url{http://www.dmoz.org}
#' 
#' @param response_group String; Required; One of the following: Categories, RelatedCategories, LanguageCategories, LetterBars
#' @param path  String; Required; valid category path
#' @param description Boolean; Optional; Whether or not to return descriptions of categories; Default is TRUE
#' @param \dots Additional arguments passed to \code{\link{alexa_GET}}.
#' 
#' @return data.frame
#'  
#' @export
#' @references \url{http://docs.aws.amazon.com/AlexaWebInfoService/latest/index.html?ApiReference_CategoryBrowseAction.html}
#' @examples \dontrun{
#' browse_categories(path="Top/Arts")
#' }

browse_categories <- function(path = NULL, response_group = "Categories", description = TRUE, ...) {
    
    if (!is.character(path)) {
        stop("Must specify valid path.")
    }

    if (!is.logical(description)) {
   		stop("Provide a valid value for description.")
    }

    # Convert Boolean to String
    description <- ifelse(description, 'True', 'False')

    query <-  list(Action = "CategoryBrowse", ResponseGroup=response_group, Path = path, Descriptions = description)

    browse_cat <- alexa_GET(query, ...)

    browse_cat
}
