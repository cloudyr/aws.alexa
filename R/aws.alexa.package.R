#' @title aws.alexa: R Client for the Alexa Amazon Web Information Service API
#' 
#' @name aws.alexa-package
#' @aliases aws.alexa
#'
#' @description OCR images, barcodes, forms, documents with machine readable zones, e.g. passports, right from R.
#' Get the results in any one of a wide variety of formats, from text to XML. 
#' The package provides access to Abbyy Cloud OCR. For more information, see \url{http://ocrsdk.com/}. 
#' Details about results of calls to the API can be found at \url{http://docs.aws.amazon.com/AlexaWebInfoService/latest/}.
#'
#' To learn how to use aws.alexa, see this vignette: \url{vignettes/overview.html}. 
#' 
#' You need to get credentials (Access Key ID and Secret Access Key) to use this application. 
#' If you haven't already, get these at \url{https://console.aws.amazon.com/iam/home#security_credential}. 
#' And set these using \code{\link{set_secret_key}}
#' 
#' @importFrom stats setNames
#' @importFrom httr GET content stop_for_status
#' @importFrom XML  xmlToList
#' @importFrom aws.signature signature_v2_auth
#' @docType package
#' @author Gaurav Sood
NULL


#' 
#' Base POST AND GET functions. Not exported.

#'
#' GET
#' 
#' @param query query list 
#' @return list

aws.alexa_GET <- 
function(query) {

	app_id = Sys.getenv("AWS_ACCESS_KEY_ID"); app_pass = Sys.getenv("AWS_SECRET_ACCESS_KEY")

	if(identical(app_id, "") | identical(app_pass, "")) stop("Please set application id and password using set_secret_key(key='key', secret='secret')).")
	
	sig <- signature_v2_auth(datetime = format(Sys.time(), 
	 						  format ="%Y-%m-%dT%H:%M:%SZ", tz = "UTC"),
                              verb = "GET",
                              service = "awis.amazonaws.com",
                              path = "/",
                              query_args = query,
                              key = app_id,
                              secret = app_pass)

	res <- GET("http://awis.amazonaws.com",  query = sig$Query)
	aws.alexa_check(res)
	res <- xmlToList(content(res, as="text"))

	res
}

#'
#' Request Response Verification
#' 
#' @param  req request
#' @return in case of failure, a message

aws.alexa_check <- 
function(req) {
  if (req$status_code < 400) return(invisible())

  stop("HTTP failure: ", req$status_code, "\n", call. = FALSE)
} 
