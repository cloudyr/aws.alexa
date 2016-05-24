#' Set up Key and Secret
#'
#' Get the Access Key ID and Secret Access Key by logging into \url{https://console.aws.amazon.com/}, 
#' clicking on the username followed by security credentials. The function sets two environmental variables
#' \code{AWS_ACCESS_KEY_ID} and \code{AWS_SECRET_ACCESS_KEY}. These environment variables persist within a R session. The function 
#' looks for these variables 
#'  
#' @param key String; Required; Access Key ID
#' @param secret String; Required; Secret Access Key
#' @param force String; Required; Force change the \code{AWS_ACCESS_KEY_ID} and \code{AWS_SECRET_ACCESS_KEY} stored in the environment
#' @export
#' @references \url{https://console.aws.amazon.com/iam/home#security_credential}
#'
#' @examples \dontrun{
#' set_secret_key(key = "key", secret = "secret")
#' }

set_secret_key <- function(key = NULL, secret = NULL, force = FALSE) {
    
    env_id <- Sys.getenv('AWS_ACCESS_KEY_ID')
    env_pass <- Sys.getenv('AWS_SECRET_ACCESS_KEY')
    
    # If you cannot find AWS_ACCESS_KEY_ID or AWS_SECRET_ACCESS_KEY in the environment
    if ((identical(env_id, "") | identical(env_pass, "")) | !force) {

        if (!is.null(key) & !is.null(secret)) {
            # First look for arguments passed in the function
            Sys.setenv(AWS_ACCESS_KEY_ID = key)
            Sys.setenv(AWS_SECRET_ACCESS_KEY = secret)
        } else {
            # Else ask user for the details    
            message("Couldn't find env var AWS_ACCESS_KEY_ID or AWS_ACCESS_KEY_ID. See ?set_secret_key for more details.")
            message("Please enter your AWS_ACCESS_KEY_ID and press enter:")
            pat <- readline(": ")
            Sys.setenv(AWS_ACCESS_KEY_ID = pat)
            message("Now please enter your AWS_ACCESS_KEY_ID and press enter:")
            pat <- readline(": ")
            Sys.setenv(AWS_SECRET_ACCESS_KEY = pat)
        }
    }
}
