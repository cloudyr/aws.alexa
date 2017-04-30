context("Get In Links")

test_that("in_links works", {

  skip_on_cran()

  token_file <- file("aws.alexa_key", "r")
  token <- suppressWarnings(readLines(token_file))
  close(token_file)
  key <- unlist(strsplit(token, ","))[1]
  secret <- unlist(strsplit(token, ","))[2]
  set_secret_key(key, secret)

  links_dat <- in_links("google.com")
  expect_that(links_dat, is_a("data.frame"))
})
