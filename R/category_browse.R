#' Browse Categories
#'
#' Uses data from \url{http://www.dmoz.org}
#' 
#' @param response_group String; Required; One of the following: Categories, RelatedCategories, LanguageCategories, LetterBars
#' @param path  String; Required; valid category path
#' @param description Boolean; Optional; Whether or not to return descriptions of categories; Default is TRUE
#' 
#' @return data.frame
#'  
#' @export
#' @references \url{http://docs.aws.amazon.com/AlexaWebInfoService/latest/index.html?ApiReference_CategoryBrowseAction.html}
#' @examples \dontrun{
#' browse_categories(path="Top/Arts")
#' }

browse_categories <- function(path = path, response_group = "Categories", description = TRUE) {
    
   query <-  list(Action = "CategoryBrowse", ResponseGroup=response_group, Path = path, Descriptions = description)

   browse_cat <- aws.alexa_GET(query)

   browse_cat
}