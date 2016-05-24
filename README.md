# R Client for the Alexa Web Information Services API

Find information about domains, including the kind of content that they carry, how popular are they, sites linking to them, among other things. The package provides access to the [Alexa Web Information Service API](http://docs.aws.amazon.com/AlexaWebInfoService/latest/). 

To use the package, you will need an AWS account and enter your credentials into R. Your keypair can be generated on the [IAM Management Console](https://aws.amazon.com/) under the heading *Access Keys*. Note that you only have access to your secret key once. After it is generated, you need to save it in a secure location. New keypairs can be generated at any time if yours has been lost, stolen, or forgotten. 

By default, all **cloudyr** packages look for the access key ID and secret access key in environment variables. You can also use this to specify a default region. For example:

```R
Sys.setenv("AWS_ACCESS_KEY_ID" = "mykey",
           "AWS_SECRET_ACCESS_KEY" = "mysecretkey",
           "AWS_DEFAULT_REGION" = "us-east-1")
```

These can alternatively be set on the command line or via an `Renviron.site` or `.Renviron` file ([see here for instructions](http://cran.r-project.org/web/packages/httr/vignettes/api-packages.html)).

## Code Examples

To get acquainted with some of the important functions, see the vignette:

```r
# Overview of the package
vignette("introduction", package = "alexa")
```

## License

Scripts are released under the [MIT License](https://opensource.org/licenses/MIT).

## Installation

[![Build Status](https://travis-ci.org/cloudyr/aws.alexa.svg?branch=master)](https://travis-ci.org/cloudyr/aws.alexa)
[![Appveyor Build status](https://ci.appveyor.com/api/projects/status/yh856e6cv7uucaj2?svg=true)](https://ci.appveyor.com/project/cloudyr/aws.alexa)
[![CRAN_Status_Badge](http://www.r-pkg.org/badges/version/alexa)](https://cran.r-project.org/package=alexa)
![](http://cranlogs.r-pkg.org/badges/grand-total/alexa)
[![codecov.io](http://codecov.io/github/cloudyr/aws.alexa/coverage.svg?branch=master)](http://codecov.io/github/cloudyr/aws.alexa?branch=master)

This package is not yet on CRAN. To install the latest development version you can install from the cloudyr drat repository:

```R
# latest stable version
install.packages("aws.alexa", repos = c(getOption("repos"), "http://cloudyr.github.io/drat"))
```

Or, to pull a potentially unstable version directly from GitHub:

```R
if(!require("ghit")){
    install.packages("ghit")
}
ghit::install_github("cloudyr/aws.alexa")
```


---
[![cloudyr project logo](http://i.imgur.com/JHS98Y7.png)](https://github.com/cloudyr)
