context("Get URL Info.")

test_that("url_info happens successfully", {

  skip_on_cran()

  token_file <- file("aws.alexa_key", "r")
  token <- suppressWarnings(readLines(token_file))
  close(token_file)
  key <- unlist(strsplit(token, ","))[1]
  secret <- unlist(strsplit(token, ","))[2]
  set_secret_key(key, secret)

  get_info <- url_info("google.com")
  expect_that(get_info, is_a("data.frame"))
})
