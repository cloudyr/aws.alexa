% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/set_secret_key.R
\name{set_secret_key}
\alias{set_secret_key}
\title{Set up Key and Secret}
\usage{
set_secret_key(key = NULL, secret = NULL, force = FALSE)
}
\arguments{
\item{key}{String; Required; Access Key ID}

\item{secret}{String; Required; Secret Access Key}

\item{force}{String; Required; Force change the \code{AWS_ACCESS_KEY_ID} and \code{AWS_SECRET_ACCESS_KEY} stored in the environment}
}
\description{
Get the Access Key ID and Secret Access Key by logging into \url{https://console.aws.amazon.com/}, 
clicking on the username followed by security credentials. The function sets two environmental variables
\code{AWS_ACCESS_KEY_ID} and \code{AWS_SECRET_ACCESS_KEY}. These environment variables persist within a R session. The function 
looks for these variables
}
\examples{
\dontrun{
set_secret_key(key = "key", secret = "secret")
}
}
\references{
\url{https://aws.amazon.com/}
}
