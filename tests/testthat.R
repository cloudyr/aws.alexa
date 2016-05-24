library("testthat")
library("aws.alexa")

token_file <- try(suppressWarnings(readLines("aws.alexa_key")), silent = TRUE)
if (!inherits(token_file, "try-error")) {
    key <- unlist(strsplit(token, ","))[1]
    secret <- unlist(strsplit(token, ","))[2]
    set_secret_key(key, secret)
    test_check("aws.alexa")
}
