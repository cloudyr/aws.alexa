context("Get URL Info.")

test_that("url_info happens successfully", {
    get_info <- url_info("google.com")
    expect_that(get_info, is_a("list"))
})
