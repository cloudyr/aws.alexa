context("Get Traffic History")

test_that("traffic_history works", {
  
  skip_on_cran()

  token_file <- file("aws.alexa_key", "r")
  token <- suppressWarnings(readLines(token_file))
  close(token_file)
  key <- unlist(strsplit(token, ","))[1]
  secret <- unlist(strsplit(token, ","))[2]
  set_secret_key(key, secret)
  
  traffic <- traffic_history("google.com")
  expect_that(traffic, is_a("data.frame"))

  traffic_history(url="http://www.google.com", start="20160505")
  expect_that(traffic, is_a("data.frame"))
})
